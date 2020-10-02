import java.util.*;
class nim
{
    int GB[]=new int[3];
    int player=-1;
    String remove,p1,p2;
    Scanner inp=new Scanner(System.in);
    
    void mainCall()
    {
        System.out.print("\f");
        mainDisplay();
        generate();
        displayGB();
        input();
    }
    
    void mainDisplay()
    {
        System.out.println("Each player, in turn, must take at least one stone");
        System.out.println("they may take more than one stone as long as they all come from the same pile.");
        System.out.println("It's allowed to make a pile empty, effectively removing the pile out of the game.");
        System.out.println("When a player is unable to move, the game ends.");
        System.out.println("Naturally, as long as there is a stone, either player can take that stone, and thus can move.");
        System.out.println("So the ending condition can be rephrased, the player who picks up the last stone wins"); 
        System.out.println("There are 3 piles of stones and the numbers indicate the number of stones in each pile."); 
        System.out.println("If you wish to take 5 stones from pile B your input should be ---> B5."); 
        System.out.println("Have fun!");
        System.out.println("------------------------------------------------------------------------------------------");
        inp.useDelimiter("\n");
        System.out.println("Names:");
        System.out.print("Player 1: ");
        p1=inp.next();
        System.out.print("Player 2: ");
        p2=inp.next();
        System.out.println("\nA \tB \tC");
    }
    
    void generate()
    {
        Random rdm = new Random();
        for(byte i=0 ; i<3 ; i++)
            GB[i]=rdm.nextInt(30)+1;
    }
    
    void displayGB()
    {
        for(byte i=0 ; i<3 ; i++)
            System.out.print(GB[i]+"\t");
        System.out.println("\n");
        
        if((GB[0] == 0) && (GB[1] == 0) && (GB[2] == 0))
        {
            System.out.println((player%2!=0) ? p1+" won" : p2+" won"); 
            System.out.print("\nDo you want to play another game? (y/n): ");
            char ans= inp.next().charAt(0);
            Menu m=new Menu();
            if(ans == 'y')
                m.call();
            else
                m.thankYou();
        }
    }
    
    void input()
    { 
        for(;true;player++)
        {
           System.out.print((player%2!=0)? (p1+", your Choice: ") : (p2+", your Choice: "));
           remove=inp.next();
           gamePlay();
        }
    }
    
    void gamePlay()
    {
        byte p=0;//store index of chosen pile
        switch(remove.charAt(0))
        {
            case 'B':
            case 'b': p=1;
                      break;
            case 'C':
            case 'c': p=2;
                      break;
        }
        int n=Integer.parseInt(remove.substring(1));//store no of stones to remove
        if (n > 0)
        {
            GB[p]-=n; 
            if(GB[p] < 0)
            {   
                System.out.println("\nChoice exceeds number of stones in the pile.\n");
                input();
            }
        }
        else
        {
            System.out.println("\nYou must remove at least one stone\n");
            input();
        }
        displayGB();
    }
}
