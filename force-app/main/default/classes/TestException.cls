public class TestException extends Exception {

    override
    public String getMessage(){
    	return 'Exception message';
    }
    
    public static Decimal calculateFator(Double eScore, Integer term, double amount){
        double initialTermFactor = 0.06;
        double initialTermLenght = 1.0;
        Decimal constant1=0.0266;
        Decimal  constant2 = 450;
        Decimal percent1 = 1.5;
        Decimal percent2 = 0.92;
        
        Decimal eScoreValue =0;
        if(eScore<constant2){
            eScoreValue= percent1 - (eScore * percent2) / constant2;
        }
        else{
            eScoreValue = (-0.064 * Math.log(eScore) + 0.4595) + (-0.0002*eScore+0.54);
        }
        
        Decimal result =( 0.0266 * ( eScoreValue + 0.0001 * term * 21 + 0.0000000000004 * Math.pow(amount, 2) - 0.00000002 * amount + 0.0002 + 0.1 ) +0.0045)*(term-initialTermLenght)+initialTermFactor;
        result = result*100;
        
        return result;
    }
    
        
    public static void calculateFator(){
        Double d2=400;
        Integer d3 = 3;
        Double d4 = 25000;
        double g2 = 0.06;
        double g3 = 1.0;
        Decimal constant1=0.0266;
        Decimal  constant2 = 450;
        Decimal percent1 = 1.5;
        Decimal percent2 = 0.92;
        
        Decimal ifValue =0;
        if(d2<constant2){
            ifValue= percent1 - (d2*percent2)/constant2;
            
        }
        else{
            ifValue = -0.064 * Math.log(d2) + 0.4595 + (-0.0002*d2+0.54);
        }
        
        
        Decimal result =( 0.0266 * ( ifValue + 0.0001 * d3 * 21 + 0.0000000000004 * Math.pow(d4, 2) - 0.00000002 * d4 + 0.0002 + 0.1 ) +0.0045)*(d3-g3)+g2;
        result = result*100;
        System.debug(result);
        result = result.setScale(2);
        result=result.stripTrailingZeros();
        
        System.debug(result);
        
        /*
        =MROUND(
            (
                0.0266*(
                    IF(
                        $D$2<450,
                        150%-$D$2*92%/450,
                        (-0.064*LN($D$2)+0.4595)+(-0.0002*$D$2+0.54)
                    )
                    +0.0001*$D$3*21+0.0000000000004*$D$4^2-0.00000002*$D$4+0.0002+10%
                )
                +0.0045
            )
            *(
                $D$3-$G$3
            )
            +$G$2,1%)
		*/
    }
}