
function eqconqp_autodiff()

  n    = 50
  x0   = zeros(n)
  f(x) = sum(i * x[i]^2 for i = 1:n) / 2
  c(x) = [sum(x) - 1.0]
  lcon = [0.0]
  ucon = [0.0]

  return ADNLPModel(f, x0, c=c, lcon=lcon, ucon=ucon, name="eqconqp_autodiff")
end

function eqconqp_QP()
  n    = 50
  c    = zeros(n)
  H    = spdiagm(0 => 1:n)
  A    = ones(1, n)
  lcon = [1.0]
  ucon = [1.0]

  return QuadraticModel(c, H, A=A, lcon=lcon, ucon=ucon, name="eqconqp_QP")
end
