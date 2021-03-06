area_arg_one = rand(1..9)
area_arg_two = rand(1..9)
volume_arg_one = rand(1..9)
volume_arg_two = rand(1..9)
volume_arg_three = rand(1..9)

METHOD_QUESTONS = [
  {
    method_name: "calc_area",
    arg_count: 2,
    spec: "returns the product of its two arguments",
    eval_string: "calc_area(#{area_arg_one}, #{area_arg_two})",
    eval_answer: area_arg_one * area_arg_two
  },
  {
    method_name: "calc_volume",
    arg_count: 3,
    spec: "returns the product of its three arguments",
    eval_string: "calc_volume(#{volume_arg_one}, #{volume_arg_two}, #{volume_arg_three})",
    eval_answer: volume_arg_one * volume_arg_two * volume_arg_three
  },
  {
    method_name: "sum",
    arg_count: 2,
    spec: "returns the sum of its two arguments",
    eval_string: "sum(#{area_arg_one}, #{area_arg_two})",
    eval_answer: area_arg_one + area_arg_two
  },
]
