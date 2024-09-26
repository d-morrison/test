---
format: docx
---

$$\color{red}{x}$$

$$
\begin{array}{l@{\qquad}l}
\text{Infection/colonization episode} & \text{Waning immunity episode}\\
b^{\prime}(t) = \mu_{0}b(t) - cy(t) & b(t) = 0 \\
y^{\prime}(t) = \mu y(t) & y^{\prime}(t) = -\alpha y(t)^r
\end{array}
$$

interestingly, without `{l@{\qquad}l}` the array works:

$$
\begin{array}{}
\text{Infection/colonization episode} & \text{Waning immunity episode}\\
b^{\prime}(t) = \mu_{0}b(t) - cy(t) & b(t) = 0 \\
y^{\prime}(t) = \mu y(t) & y^{\prime}(t) = -\alpha y(t)^r
\end{array}
$$