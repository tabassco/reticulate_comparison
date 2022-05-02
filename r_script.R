reticulate::use_python("/usr/bin/python3.9")

reticulate::source_python("script.py")

test_generator <- TestGenerator(size = 1e3L)
test_generator$generate_dummies()

tictoc::tic()
pd_data <- test_generator$get_sample_df()
data.table::setDT(pd_data)
tictoc::toc()

tictoc::tic()
arrow_data <- test_generator$get_sample_arrow()
if ("pyarrow.lib.Table" %in% class(arrow_data)) {
    arrow_data <- arrow:::py_to_r.pyarrow.lib.Table(arrow_data)
}
test <- data.table::as.data.table(arrow_data)
tictoc::toc()