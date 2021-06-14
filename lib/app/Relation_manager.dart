
class RelationManager{
   static bool decodeLevel(int lev, int middle, int pos){
    bool res = lev >= middle;
    if(pos>0 && res){
      lev = lev - middle;
    }
    return pos>0? decodeLevel(lev, middle~/2, pos--) : res;
  }

}