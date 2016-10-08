class RecommendationAlgorithm:

    def __init__(self, user, movies):
        # self.db = get_db()
        self.multipliers = []
        self.returnID = []
        self.user = user
        self.movies = movies

    def makeMultipliers(self):
        maxIndex = self.maxGenre()
        j = 1
        for i in range(5):
            self.multipliers.append(float(self.user[j])/float(self.user[maxIndex]))
            j += 1

    def recalgo(self):
        self.makeMultipliers()
        counter = 0.0
        for i in range(len(self.movies)):
            for j in range(5, len(self.movies[0])):
                counter += float(self.movies[i][j]) * self.multipliers[j - 5]

                # if counter < 0.2:
                #     continue

            self.returnID.append((self.movies[i][0], counter * float(self.movies[i][4])))
            counter = 0.0


        return sorted(self.returnID, key=lambda x : x[1], reverse=True)

    def maxGenre(self):
        return self.user.index(max(self.user))
