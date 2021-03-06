context("parse_text")

test_that( "parser skips quotes and spaces", {
  expect_equal( parse_text( "'1.0'", double_parser()), 1.0 )
  expect_equal( parse_text( '"1.0"', double_parser() ), 1.0 )
  expect_equal( parse_text( ' " 1.0"', double_parser() ), 1.0 )

  expect_equal( parse_text( "'1'", integer_parser() ), 1L )
  expect_equal( parse_text( '"1"', integer_parser() ), 1L )
  expect_equal( parse_text( ' " 1"', integer_parser() ), 1L )

})

test_that("parser escapes quotes", {
  target <- "foo \"yada\" bar"
  expect_equal(parse_text('"foo ""yada"" bar"', character_parser() ), target)
  expect_equal(parse_text('"foo \"yada\" bar"', character_parser() ), target)
  expect_equal(parse_text('"foo "yada" bar"', character_parser() ), target)
})

