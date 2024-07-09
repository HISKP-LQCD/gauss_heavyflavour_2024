# Create scaling plot

# Data to plot
x_axis <- 2^seq(1:13)
ideal <- 2^seq(1:13)
non_ideal <- c(2,4,8,16,32,64,2^7-0.1*(2^7),2^8-0.2*(2^8),2^9-0.3*(2^9),2^10-0.4*(2^10),2^11-0.5*(2^11),2^12-0.6*(2^12),2^13-0.7*(2^13))


scale_df <- data.frame(x_axis, ideal, non_ideal)

legend_format <- scale_colour_manual("", values=c("black","red"))
line1 <- geom_line(aes(y = ideal, colour = "ideal"))
line2 <- geom_line(aes(y = non_ideal, colour = "speedup"))
x_label <- scale_x_continuous("Number of cores", trans=log2_trans())
y_label <- scale_y_continuous("Speedup", trans=log2_trans())
legend_specifics <- scale_colour_manual("", values=c("black","red"))

scaling_plot <- function() {
    ggplot(scale_df, aes(x_axis)) + line1 + line2 + x_label + y_label + legend_specifics + coord_fixed()
}
