# -----------------------------------------------------------------
# 스파게티 만들기
# ----------------------------------------------------------------
# 속성/필드/변수 : 면, 소스, 채소, 기타재료
# 역할/기능     : 물 끓이기, 면 삶기, 재료 손질하기, 볶기, 먹기
# ---------------------------------------------------------------
class Spaghetti:

    # 인스턴스 생성자
    def __init__(self, *vegetable, noodle='', sauce=''):
        self.noodle=noodle
        self.sauce=sauce
        self.vegetable=vegetable

    # getter/setter메서드 (선택)
    def getVegetable(self): return self.vegetable
    def setVegetable(self, vegetable): self.vegetable=vegetable

    def getNoodle(self): return self.noodle
    def setNoodle(self, noodle): self.noodle=noodle

    def getSauce(self): return self.sauce
    def setSauce(self, sauce): self.sauce=sauce

    # 내가 원하는 스파게티 기능 ---------------------------------
    def boil(self):
        print(f'{self.noodle}면을 삶습니다.')

    def repair(self):
        print(f'{self.vegetable}재료를 손질합니다.')

    def sauce(self):
        print(f'{self.sauce}소스를 붓습니다.')

    def fry(self):
        print(f'{self.sauce}와 {self.noodle}면, {self.vegetable}을 모두 볶습니다.')

    def eat(self):
        print(f'완성된 {self.sauce} Pasta를 맛있게 먹습니다.')



    # 사용자 인터페이스 (CUI) 기능 메서드
def showUI():
        print("********* 스파게티 **********")
        print("     1. 면   삶   기")
        print("     2. 재료 손질하기")
        print("     3. 소       스")
        print("     4. 볶       기")
        print("     5. 먹       기")
        print("     6. 종       료")
        print("****************************")


# 기능 관련 함수 ---------------------------------------
# 요리에 사용할 채소 재료 데이터 입력 받는 함수
def getVegetable():
    vegetables=[]
    while True:
        vegetable=input('넣을 재료 입력(종료 Q/q) : ')
        if vegetable in ['q','Q']: break
        vegetables.append(str(vegetable))
    return vegetables

# 요리에 사용할 면 데이터 입력 받는 함수
def getNoodle():
    Noodle=[]
    noodle=input('넣을 면 입력: ')
    Noodle.append(str(noodle))


# 요리에 사용할 소스 데이터 입력 받는 함수
def getSauce():
    Sauce=[]
    sauce=input('넣을 소스 입력: ')
    Sauce.append(sauce)




# 스파게티 프로그램 구동하는 함수 ---------------------------------
def playPasta():
    print('-----------------START------------------')
    while True:
        showUI()
        select = input("메뉴 선택: ")
        if select == '6': break

        elif select == '1':
            print(Spaghetti.setNoodle(getNoodle()))
            # Spaghetti.boil()

        elif select == '2':
            Spaghetti.setVegetable(getVegetable())
            Spaghetti.repair()

        elif select == '3':
            Spaghetti.setSauce(getSauce())
            Spaghetti.sauce()

        elif select == '4':
            Spaghetti.fry()

        elif select == '5':
            Spaghetti.eat()
    print('----------------END-------------------')

# ----------------------------------------------------------------
if __name__ == '__main__':
    playPasta()

