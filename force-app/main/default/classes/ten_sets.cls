public class ten_sets {
    public static void main(){
        // Adds an element to the set
        // Define set if not defined previously
        Set<string> ProductSet = new Set<string>{'Phenol', 'Benzene', 'H2SO4'};
        ProductSet.add('HCL');
        System.debug('Set with New Value '+ProductSet);
        
        // Removes an element from set
        ProductSet.remove('HCL');
        System.debug('Set with removed value '+ProductSet);
        
        // Check whether set contains the particular element or not and returns true or false
        ProductSet.contains('HCL');
        System.debug('Value of Set with all values '+ProductSet);
    }
}