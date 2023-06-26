**Q1**  
The linear regression equation is as follows:

```
class = -0.1084 * CRIM + 0.0458 * ZN +
    2.7187 * CHAS=1 - 17.376  * NOX +
    3.8016 * RM - 1.4927 * DIS +
    0.2996 * RAD - 0.0118 * TAX - 
    0.9465 * PTRATIO + 0.0093 * B - 
    0.5226 * LSTAT + 36.3411
```

The equation for the model comprises 12 terms, with the initial 11 being the product of weights and features, and the final term standing as the intercept.

In this context, three particular features `INDUS`, `AGE`, and `CHAS=0` are not included in the model. This is a consequence of the M5 attribute selection method employed.
This technique commences by incorporating all descriptors, subsequently shedding those with the least significant standardized regression coefficients in a stepwise fashion. 
This process continues until there's no observable enhancement in the average prediction error estimation, as quantified by the Akaike Information Criterion.

In the case at hand, eliminating these three features `INDUS`, `AGE`, and `CHAS=0` had no measurable impact on the value of the error. As a result, they were excluded from 
the model to maintain simplicity and accuracy.

**Q2**
Linear Regression equation :

```
num_rings = -0.08249 * sex=I  + 
            0.0577 * sex=M - 
            0.4583 * length +
            11.0751 * diameter + 
            10.7615 * height + 
            8.9754 * whole_weight - 
            19.7869 * shucked_weight - 
            10.5818 * viscera_weight + 
            8.7418 * shell_weight + 
            3.8946
```

**Q3**
Linear Regression equation :

```
num_rings = - 11.933 * length +
            25.766 * diameter +
            20.538 * height + 
            2.836
```


