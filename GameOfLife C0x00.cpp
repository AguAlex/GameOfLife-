#include <iostream>
#include <fstream>

using namespace std;

ifstream in("input.in");

//Variabilele programului

int n, m, s[20][20], copys[20][20], celule_vii, x, y, k;

void afisare_m(){
    for(int i=1; i<=n; i++)
        {
            for(int j=1; j<=m; j++)
                cout<<s[i][j]<<" ";
            cout<<endl;
        }
    cout<<endl;
}

void citire(){
    in>>n;
    in>>m;
    in>>celule_vii;
    for(int i=1; i<=celule_vii; i++)
        {
            in>>x>>y;
            s[x+1][y+1] = 1;
        }
    in>>k;
}

void evolutie(){
    for(int i=1; i<=n; i++)
        for(int j=1; j<=m; j++)
            {
                int nr_vecini = 0;
                if(s[i-1][j] == 1)
                    nr_vecini ++;
                if(s[i-1][j+1] == 1)
                    nr_vecini ++;
                if(s[i][j+1] == 1)
                    nr_vecini ++;
                if(s[i+1][j+1] == 1)
                    nr_vecini ++;
                if(s[i+1][j] == 1)
                    nr_vecini ++;
                if(s[i+1][j-1] == 1)
                    nr_vecini ++;
                if(s[i][j-1] == 1)
                    nr_vecini ++;
                if(s[i-1][j-1] == 1)
                    nr_vecini ++;

                if((nr_vecini < 2 or nr_vecini > 3) and s[i][j] == 1)
                    copys[i][j] = 0;  // SUBPOPULARE sau ULTRAPOPULARE
                if((nr_vecini == 2 or nr_vecini == 3) and s[i][j] == 1)
                    copys[i][j] = 1; //CONTINUITATE
                if(nr_vecini == 3 and s[i][j] == 0)
                        copys[i][j] = 1; // CREARE
                
            }
    //Inlocuire S cu COPYS si resetare COPYS
    for(int i=1; i<=n; i++)
        for(int j=1; j<=m; j++)
            {
                s[i][j] = copys[i][j];
                copys[i][j] = 0;
            }

}

int main(){
    
    citire();
    for(int e=1; e<=k; e++)
        {
            evolutie();
        }
    afisare_m();

    return 0;
}