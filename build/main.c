#include "mruby.h"
#include "mruby/irep.h"
#include "mruby/array.h"
#include "mruby/string.h"

#include "./dest/entrypoint.c"

int main(int argc, char** argv) {
  mrb_state* mrb = mrb_open();

  mrb_value args = mrb_ary_new(mrb);

  // Start from 1, skip self
  for(int i = 1; i < argc; i++) {
    mrb_ary_push(mrb, args, mrb_str_new_cstr(mrb, argv[i]));
  }

  mrb_define_global_const(mrb, "ARGC", mrb_fixnum_value(argc - 1));
  mrb_define_global_const(mrb, "ARGV", args);

  mrb_load_irep(mrb, _entrypoint);

  // Display Error Message
  if(mrb->exc) {
    mrb_value exception = mrb_inspect(mrb, mrb_obj_value(mrb->exc));
    fprintf(stderr, "%s\n", mrb_str_to_cstr(mrb, exception));
    mrb_close(mrb);
    return 1;
  }

  mrb_close(mrb);
  return 0;
}


