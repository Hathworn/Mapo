; ModuleID = '../data/hip_kernels/11579/1/main.cu'
source_filename = "../data/hip_kernels/11579/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%0 = type { %1 addrspace(1)*, %2 addrspace(1)*, %3, i64, i64, i64 }
%1 = type { i64, i64, i32, i32 }
%2 = type { [64 x [8 x i64]] }
%3 = type { i64 }
%4 = type { i64, %3, i64, i32, i32, i64, i64, %5, [2 x i32] }
%5 = type { %6 addrspace(1)* }
%6 = type { %7, [4 x i32], i64, i32, i32, i32, i32, i64, i32, [9 x i32], i64, i32, i32, [4 x i32], i64, i64, i32, i32, [2 x i32], %3, [14 x i32] }
%7 = type { i32, i32, i8 addrspace(1)*, %3, i32, i32, i64 }

@.str = private unnamed_addr addrspace(4) constant [14 x i8] c"Block id: %d\0A\00", align 1
@.str.1 = private unnamed_addr addrspace(4) constant [15 x i8] c"Thread id: %d\0A\00", align 1
@.str.2 = private unnamed_addr addrspace(4) constant [15 x i8] c"Global id: %d\0A\00", align 1

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: convergent norecurse nounwind
define protected amdgpu_kernel void @_Z8mykernelv() local_unnamed_addr #1 {
  %1 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %2 = tail call i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr()
  %3 = getelementptr inbounds i8, i8 addrspace(4)* %2, i64 24
  %4 = bitcast i8 addrspace(4)* %3 to i64 addrspace(4)*
  %5 = load i64, i64 addrspace(4)* %4, align 8, !tbaa !4
  %6 = inttoptr i64 %5 to i8 addrspace(1)*
  %7 = addrspacecast i8 addrspace(1)* %6 to i8*
  %8 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %7, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %9 = extractelement <2 x i64> %8, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([14 x i8], [14 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), label %10, label %14

10:                                               ; preds = %0
  %11 = and i64 %9, -225
  %12 = or i64 %11, 32
  %13 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %7, i64 noundef %12, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  br label %455

14:                                               ; preds = %0
  %15 = and i64 %9, 2
  %16 = and i64 %9, -3
  %17 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %16, i64 0
  br label %18

18:                                               ; preds = %444, %14
  %19 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([14 x i8], [14 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([14 x i8], [14 x i8] addrspace(4)* @.str, i64 0, i64 13) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([14 x i8]* addrspacecast ([14 x i8] addrspace(4)* @.str to [14 x i8]*) to i64)), i64 1))), %14 ], [ %452, %444 ]
  %20 = phi i8 addrspace(4)* [ getelementptr inbounds ([14 x i8], [14 x i8] addrspace(4)* @.str, i64 0, i64 0), %14 ], [ %453, %444 ]
  %21 = phi <2 x i64> [ %17, %14 ], [ %451, %444 ]
  %22 = icmp ugt i64 %19, 56
  %23 = extractelement <2 x i64> %21, i64 0
  %24 = or i64 %23, %15
  %25 = insertelement <2 x i64> poison, i64 %24, i64 0
  %26 = select i1 %22, <2 x i64> %21, <2 x i64> %25
  %27 = tail call i64 @llvm.umin.i64(i64 %19, i64 56)
  %28 = trunc i64 %27 to i32
  %29 = extractelement <2 x i64> %26, i64 0
  %30 = icmp ugt i32 %28, 7
  br i1 %30, label %33, label %31

31:                                               ; preds = %18
  %32 = icmp eq i32 %28, 0
  br i1 %32, label %86, label %73

33:                                               ; preds = %18
  %34 = load i8, i8 addrspace(4)* %20, align 1, !tbaa !8
  %35 = zext i8 %34 to i64
  %36 = getelementptr inbounds i8, i8 addrspace(4)* %20, i64 1
  %37 = load i8, i8 addrspace(4)* %36, align 1, !tbaa !8
  %38 = zext i8 %37 to i64
  %39 = shl nuw nsw i64 %38, 8
  %40 = or i64 %39, %35
  %41 = getelementptr inbounds i8, i8 addrspace(4)* %20, i64 2
  %42 = load i8, i8 addrspace(4)* %41, align 1, !tbaa !8
  %43 = zext i8 %42 to i64
  %44 = shl nuw nsw i64 %43, 16
  %45 = or i64 %40, %44
  %46 = getelementptr inbounds i8, i8 addrspace(4)* %20, i64 3
  %47 = load i8, i8 addrspace(4)* %46, align 1, !tbaa !8
  %48 = zext i8 %47 to i64
  %49 = shl nuw nsw i64 %48, 24
  %50 = or i64 %45, %49
  %51 = getelementptr inbounds i8, i8 addrspace(4)* %20, i64 4
  %52 = load i8, i8 addrspace(4)* %51, align 1, !tbaa !8
  %53 = zext i8 %52 to i64
  %54 = shl nuw nsw i64 %53, 32
  %55 = or i64 %50, %54
  %56 = getelementptr inbounds i8, i8 addrspace(4)* %20, i64 5
  %57 = load i8, i8 addrspace(4)* %56, align 1, !tbaa !8
  %58 = zext i8 %57 to i64
  %59 = shl nuw nsw i64 %58, 40
  %60 = or i64 %55, %59
  %61 = getelementptr inbounds i8, i8 addrspace(4)* %20, i64 6
  %62 = load i8, i8 addrspace(4)* %61, align 1, !tbaa !8
  %63 = zext i8 %62 to i64
  %64 = shl nuw nsw i64 %63, 48
  %65 = or i64 %60, %64
  %66 = getelementptr inbounds i8, i8 addrspace(4)* %20, i64 7
  %67 = load i8, i8 addrspace(4)* %66, align 1, !tbaa !8
  %68 = zext i8 %67 to i64
  %69 = shl nuw i64 %68, 56
  %70 = or i64 %65, %69
  %71 = add nsw i32 %28, -8
  %72 = getelementptr inbounds i8, i8 addrspace(4)* %20, i64 8
  br label %86

73:                                               ; preds = %31, %73
  %74 = phi i32 [ %84, %73 ], [ 0, %31 ]
  %75 = phi i64 [ %83, %73 ], [ 0, %31 ]
  %76 = zext i32 %74 to i64
  %77 = getelementptr inbounds i8, i8 addrspace(4)* %20, i64 %76
  %78 = load i8, i8 addrspace(4)* %77, align 1, !tbaa !8
  %79 = zext i8 %78 to i64
  %80 = shl i32 %74, 3
  %81 = zext i32 %80 to i64
  %82 = shl nuw i64 %79, %81
  %83 = or i64 %82, %75
  %84 = add nuw nsw i32 %74, 1
  %85 = icmp eq i32 %84, %28
  br i1 %85, label %86, label %73, !llvm.loop !9

86:                                               ; preds = %73, %33, %31
  %87 = phi i8 addrspace(4)* [ %72, %33 ], [ %20, %31 ], [ %20, %73 ]
  %88 = phi i32 [ %71, %33 ], [ 0, %31 ], [ 0, %73 ]
  %89 = phi i64 [ %70, %33 ], [ 0, %31 ], [ %83, %73 ]
  %90 = icmp ugt i32 %88, 7
  br i1 %90, label %93, label %91

91:                                               ; preds = %86
  %92 = icmp eq i32 %88, 0
  br i1 %92, label %146, label %133

93:                                               ; preds = %86
  %94 = load i8, i8 addrspace(4)* %87, align 1, !tbaa !8
  %95 = zext i8 %94 to i64
  %96 = getelementptr inbounds i8, i8 addrspace(4)* %87, i64 1
  %97 = load i8, i8 addrspace(4)* %96, align 1, !tbaa !8
  %98 = zext i8 %97 to i64
  %99 = shl nuw nsw i64 %98, 8
  %100 = or i64 %99, %95
  %101 = getelementptr inbounds i8, i8 addrspace(4)* %87, i64 2
  %102 = load i8, i8 addrspace(4)* %101, align 1, !tbaa !8
  %103 = zext i8 %102 to i64
  %104 = shl nuw nsw i64 %103, 16
  %105 = or i64 %100, %104
  %106 = getelementptr inbounds i8, i8 addrspace(4)* %87, i64 3
  %107 = load i8, i8 addrspace(4)* %106, align 1, !tbaa !8
  %108 = zext i8 %107 to i64
  %109 = shl nuw nsw i64 %108, 24
  %110 = or i64 %105, %109
  %111 = getelementptr inbounds i8, i8 addrspace(4)* %87, i64 4
  %112 = load i8, i8 addrspace(4)* %111, align 1, !tbaa !8
  %113 = zext i8 %112 to i64
  %114 = shl nuw nsw i64 %113, 32
  %115 = or i64 %110, %114
  %116 = getelementptr inbounds i8, i8 addrspace(4)* %87, i64 5
  %117 = load i8, i8 addrspace(4)* %116, align 1, !tbaa !8
  %118 = zext i8 %117 to i64
  %119 = shl nuw nsw i64 %118, 40
  %120 = or i64 %115, %119
  %121 = getelementptr inbounds i8, i8 addrspace(4)* %87, i64 6
  %122 = load i8, i8 addrspace(4)* %121, align 1, !tbaa !8
  %123 = zext i8 %122 to i64
  %124 = shl nuw nsw i64 %123, 48
  %125 = or i64 %120, %124
  %126 = getelementptr inbounds i8, i8 addrspace(4)* %87, i64 7
  %127 = load i8, i8 addrspace(4)* %126, align 1, !tbaa !8
  %128 = zext i8 %127 to i64
  %129 = shl nuw i64 %128, 56
  %130 = or i64 %125, %129
  %131 = add nsw i32 %88, -8
  %132 = getelementptr inbounds i8, i8 addrspace(4)* %87, i64 8
  br label %146

133:                                              ; preds = %91, %133
  %134 = phi i32 [ %144, %133 ], [ 0, %91 ]
  %135 = phi i64 [ %143, %133 ], [ 0, %91 ]
  %136 = zext i32 %134 to i64
  %137 = getelementptr inbounds i8, i8 addrspace(4)* %87, i64 %136
  %138 = load i8, i8 addrspace(4)* %137, align 1, !tbaa !8
  %139 = zext i8 %138 to i64
  %140 = shl i32 %134, 3
  %141 = zext i32 %140 to i64
  %142 = shl nuw i64 %139, %141
  %143 = or i64 %142, %135
  %144 = add nuw nsw i32 %134, 1
  %145 = icmp eq i32 %144, %88
  br i1 %145, label %146, label %133

146:                                              ; preds = %133, %93, %91
  %147 = phi i8 addrspace(4)* [ %132, %93 ], [ %87, %91 ], [ %87, %133 ]
  %148 = phi i32 [ %131, %93 ], [ 0, %91 ], [ 0, %133 ]
  %149 = phi i64 [ %130, %93 ], [ 0, %91 ], [ %143, %133 ]
  %150 = icmp ugt i32 %148, 7
  br i1 %150, label %153, label %151

151:                                              ; preds = %146
  %152 = icmp eq i32 %148, 0
  br i1 %152, label %206, label %193

153:                                              ; preds = %146
  %154 = load i8, i8 addrspace(4)* %147, align 1, !tbaa !8
  %155 = zext i8 %154 to i64
  %156 = getelementptr inbounds i8, i8 addrspace(4)* %147, i64 1
  %157 = load i8, i8 addrspace(4)* %156, align 1, !tbaa !8
  %158 = zext i8 %157 to i64
  %159 = shl nuw nsw i64 %158, 8
  %160 = or i64 %159, %155
  %161 = getelementptr inbounds i8, i8 addrspace(4)* %147, i64 2
  %162 = load i8, i8 addrspace(4)* %161, align 1, !tbaa !8
  %163 = zext i8 %162 to i64
  %164 = shl nuw nsw i64 %163, 16
  %165 = or i64 %160, %164
  %166 = getelementptr inbounds i8, i8 addrspace(4)* %147, i64 3
  %167 = load i8, i8 addrspace(4)* %166, align 1, !tbaa !8
  %168 = zext i8 %167 to i64
  %169 = shl nuw nsw i64 %168, 24
  %170 = or i64 %165, %169
  %171 = getelementptr inbounds i8, i8 addrspace(4)* %147, i64 4
  %172 = load i8, i8 addrspace(4)* %171, align 1, !tbaa !8
  %173 = zext i8 %172 to i64
  %174 = shl nuw nsw i64 %173, 32
  %175 = or i64 %170, %174
  %176 = getelementptr inbounds i8, i8 addrspace(4)* %147, i64 5
  %177 = load i8, i8 addrspace(4)* %176, align 1, !tbaa !8
  %178 = zext i8 %177 to i64
  %179 = shl nuw nsw i64 %178, 40
  %180 = or i64 %175, %179
  %181 = getelementptr inbounds i8, i8 addrspace(4)* %147, i64 6
  %182 = load i8, i8 addrspace(4)* %181, align 1, !tbaa !8
  %183 = zext i8 %182 to i64
  %184 = shl nuw nsw i64 %183, 48
  %185 = or i64 %180, %184
  %186 = getelementptr inbounds i8, i8 addrspace(4)* %147, i64 7
  %187 = load i8, i8 addrspace(4)* %186, align 1, !tbaa !8
  %188 = zext i8 %187 to i64
  %189 = shl nuw i64 %188, 56
  %190 = or i64 %185, %189
  %191 = add nsw i32 %148, -8
  %192 = getelementptr inbounds i8, i8 addrspace(4)* %147, i64 8
  br label %206

193:                                              ; preds = %151, %193
  %194 = phi i32 [ %204, %193 ], [ 0, %151 ]
  %195 = phi i64 [ %203, %193 ], [ 0, %151 ]
  %196 = zext i32 %194 to i64
  %197 = getelementptr inbounds i8, i8 addrspace(4)* %147, i64 %196
  %198 = load i8, i8 addrspace(4)* %197, align 1, !tbaa !8
  %199 = zext i8 %198 to i64
  %200 = shl i32 %194, 3
  %201 = zext i32 %200 to i64
  %202 = shl nuw i64 %199, %201
  %203 = or i64 %202, %195
  %204 = add nuw nsw i32 %194, 1
  %205 = icmp eq i32 %204, %148
  br i1 %205, label %206, label %193

206:                                              ; preds = %193, %153, %151
  %207 = phi i8 addrspace(4)* [ %192, %153 ], [ %147, %151 ], [ %147, %193 ]
  %208 = phi i32 [ %191, %153 ], [ 0, %151 ], [ 0, %193 ]
  %209 = phi i64 [ %190, %153 ], [ 0, %151 ], [ %203, %193 ]
  %210 = icmp ugt i32 %208, 7
  br i1 %210, label %213, label %211

211:                                              ; preds = %206
  %212 = icmp eq i32 %208, 0
  br i1 %212, label %266, label %253

213:                                              ; preds = %206
  %214 = load i8, i8 addrspace(4)* %207, align 1, !tbaa !8
  %215 = zext i8 %214 to i64
  %216 = getelementptr inbounds i8, i8 addrspace(4)* %207, i64 1
  %217 = load i8, i8 addrspace(4)* %216, align 1, !tbaa !8
  %218 = zext i8 %217 to i64
  %219 = shl nuw nsw i64 %218, 8
  %220 = or i64 %219, %215
  %221 = getelementptr inbounds i8, i8 addrspace(4)* %207, i64 2
  %222 = load i8, i8 addrspace(4)* %221, align 1, !tbaa !8
  %223 = zext i8 %222 to i64
  %224 = shl nuw nsw i64 %223, 16
  %225 = or i64 %220, %224
  %226 = getelementptr inbounds i8, i8 addrspace(4)* %207, i64 3
  %227 = load i8, i8 addrspace(4)* %226, align 1, !tbaa !8
  %228 = zext i8 %227 to i64
  %229 = shl nuw nsw i64 %228, 24
  %230 = or i64 %225, %229
  %231 = getelementptr inbounds i8, i8 addrspace(4)* %207, i64 4
  %232 = load i8, i8 addrspace(4)* %231, align 1, !tbaa !8
  %233 = zext i8 %232 to i64
  %234 = shl nuw nsw i64 %233, 32
  %235 = or i64 %230, %234
  %236 = getelementptr inbounds i8, i8 addrspace(4)* %207, i64 5
  %237 = load i8, i8 addrspace(4)* %236, align 1, !tbaa !8
  %238 = zext i8 %237 to i64
  %239 = shl nuw nsw i64 %238, 40
  %240 = or i64 %235, %239
  %241 = getelementptr inbounds i8, i8 addrspace(4)* %207, i64 6
  %242 = load i8, i8 addrspace(4)* %241, align 1, !tbaa !8
  %243 = zext i8 %242 to i64
  %244 = shl nuw nsw i64 %243, 48
  %245 = or i64 %240, %244
  %246 = getelementptr inbounds i8, i8 addrspace(4)* %207, i64 7
  %247 = load i8, i8 addrspace(4)* %246, align 1, !tbaa !8
  %248 = zext i8 %247 to i64
  %249 = shl nuw i64 %248, 56
  %250 = or i64 %245, %249
  %251 = add nsw i32 %208, -8
  %252 = getelementptr inbounds i8, i8 addrspace(4)* %207, i64 8
  br label %266

253:                                              ; preds = %211, %253
  %254 = phi i32 [ %264, %253 ], [ 0, %211 ]
  %255 = phi i64 [ %263, %253 ], [ 0, %211 ]
  %256 = zext i32 %254 to i64
  %257 = getelementptr inbounds i8, i8 addrspace(4)* %207, i64 %256
  %258 = load i8, i8 addrspace(4)* %257, align 1, !tbaa !8
  %259 = zext i8 %258 to i64
  %260 = shl i32 %254, 3
  %261 = zext i32 %260 to i64
  %262 = shl nuw i64 %259, %261
  %263 = or i64 %262, %255
  %264 = add nuw nsw i32 %254, 1
  %265 = icmp eq i32 %264, %208
  br i1 %265, label %266, label %253

266:                                              ; preds = %253, %213, %211
  %267 = phi i8 addrspace(4)* [ %252, %213 ], [ %207, %211 ], [ %207, %253 ]
  %268 = phi i32 [ %251, %213 ], [ 0, %211 ], [ 0, %253 ]
  %269 = phi i64 [ %250, %213 ], [ 0, %211 ], [ %263, %253 ]
  %270 = icmp ugt i32 %268, 7
  br i1 %270, label %273, label %271

271:                                              ; preds = %266
  %272 = icmp eq i32 %268, 0
  br i1 %272, label %326, label %313

273:                                              ; preds = %266
  %274 = load i8, i8 addrspace(4)* %267, align 1, !tbaa !8
  %275 = zext i8 %274 to i64
  %276 = getelementptr inbounds i8, i8 addrspace(4)* %267, i64 1
  %277 = load i8, i8 addrspace(4)* %276, align 1, !tbaa !8
  %278 = zext i8 %277 to i64
  %279 = shl nuw nsw i64 %278, 8
  %280 = or i64 %279, %275
  %281 = getelementptr inbounds i8, i8 addrspace(4)* %267, i64 2
  %282 = load i8, i8 addrspace(4)* %281, align 1, !tbaa !8
  %283 = zext i8 %282 to i64
  %284 = shl nuw nsw i64 %283, 16
  %285 = or i64 %280, %284
  %286 = getelementptr inbounds i8, i8 addrspace(4)* %267, i64 3
  %287 = load i8, i8 addrspace(4)* %286, align 1, !tbaa !8
  %288 = zext i8 %287 to i64
  %289 = shl nuw nsw i64 %288, 24
  %290 = or i64 %285, %289
  %291 = getelementptr inbounds i8, i8 addrspace(4)* %267, i64 4
  %292 = load i8, i8 addrspace(4)* %291, align 1, !tbaa !8
  %293 = zext i8 %292 to i64
  %294 = shl nuw nsw i64 %293, 32
  %295 = or i64 %290, %294
  %296 = getelementptr inbounds i8, i8 addrspace(4)* %267, i64 5
  %297 = load i8, i8 addrspace(4)* %296, align 1, !tbaa !8
  %298 = zext i8 %297 to i64
  %299 = shl nuw nsw i64 %298, 40
  %300 = or i64 %295, %299
  %301 = getelementptr inbounds i8, i8 addrspace(4)* %267, i64 6
  %302 = load i8, i8 addrspace(4)* %301, align 1, !tbaa !8
  %303 = zext i8 %302 to i64
  %304 = shl nuw nsw i64 %303, 48
  %305 = or i64 %300, %304
  %306 = getelementptr inbounds i8, i8 addrspace(4)* %267, i64 7
  %307 = load i8, i8 addrspace(4)* %306, align 1, !tbaa !8
  %308 = zext i8 %307 to i64
  %309 = shl nuw i64 %308, 56
  %310 = or i64 %305, %309
  %311 = add nsw i32 %268, -8
  %312 = getelementptr inbounds i8, i8 addrspace(4)* %267, i64 8
  br label %326

313:                                              ; preds = %271, %313
  %314 = phi i32 [ %324, %313 ], [ 0, %271 ]
  %315 = phi i64 [ %323, %313 ], [ 0, %271 ]
  %316 = zext i32 %314 to i64
  %317 = getelementptr inbounds i8, i8 addrspace(4)* %267, i64 %316
  %318 = load i8, i8 addrspace(4)* %317, align 1, !tbaa !8
  %319 = zext i8 %318 to i64
  %320 = shl i32 %314, 3
  %321 = zext i32 %320 to i64
  %322 = shl nuw i64 %319, %321
  %323 = or i64 %322, %315
  %324 = add nuw nsw i32 %314, 1
  %325 = icmp eq i32 %324, %268
  br i1 %325, label %326, label %313

326:                                              ; preds = %313, %273, %271
  %327 = phi i8 addrspace(4)* [ %312, %273 ], [ %267, %271 ], [ %267, %313 ]
  %328 = phi i32 [ %311, %273 ], [ 0, %271 ], [ 0, %313 ]
  %329 = phi i64 [ %310, %273 ], [ 0, %271 ], [ %323, %313 ]
  %330 = icmp ugt i32 %328, 7
  br i1 %330, label %333, label %331

331:                                              ; preds = %326
  %332 = icmp eq i32 %328, 0
  br i1 %332, label %386, label %373

333:                                              ; preds = %326
  %334 = load i8, i8 addrspace(4)* %327, align 1, !tbaa !8
  %335 = zext i8 %334 to i64
  %336 = getelementptr inbounds i8, i8 addrspace(4)* %327, i64 1
  %337 = load i8, i8 addrspace(4)* %336, align 1, !tbaa !8
  %338 = zext i8 %337 to i64
  %339 = shl nuw nsw i64 %338, 8
  %340 = or i64 %339, %335
  %341 = getelementptr inbounds i8, i8 addrspace(4)* %327, i64 2
  %342 = load i8, i8 addrspace(4)* %341, align 1, !tbaa !8
  %343 = zext i8 %342 to i64
  %344 = shl nuw nsw i64 %343, 16
  %345 = or i64 %340, %344
  %346 = getelementptr inbounds i8, i8 addrspace(4)* %327, i64 3
  %347 = load i8, i8 addrspace(4)* %346, align 1, !tbaa !8
  %348 = zext i8 %347 to i64
  %349 = shl nuw nsw i64 %348, 24
  %350 = or i64 %345, %349
  %351 = getelementptr inbounds i8, i8 addrspace(4)* %327, i64 4
  %352 = load i8, i8 addrspace(4)* %351, align 1, !tbaa !8
  %353 = zext i8 %352 to i64
  %354 = shl nuw nsw i64 %353, 32
  %355 = or i64 %350, %354
  %356 = getelementptr inbounds i8, i8 addrspace(4)* %327, i64 5
  %357 = load i8, i8 addrspace(4)* %356, align 1, !tbaa !8
  %358 = zext i8 %357 to i64
  %359 = shl nuw nsw i64 %358, 40
  %360 = or i64 %355, %359
  %361 = getelementptr inbounds i8, i8 addrspace(4)* %327, i64 6
  %362 = load i8, i8 addrspace(4)* %361, align 1, !tbaa !8
  %363 = zext i8 %362 to i64
  %364 = shl nuw nsw i64 %363, 48
  %365 = or i64 %360, %364
  %366 = getelementptr inbounds i8, i8 addrspace(4)* %327, i64 7
  %367 = load i8, i8 addrspace(4)* %366, align 1, !tbaa !8
  %368 = zext i8 %367 to i64
  %369 = shl nuw i64 %368, 56
  %370 = or i64 %365, %369
  %371 = add nsw i32 %328, -8
  %372 = getelementptr inbounds i8, i8 addrspace(4)* %327, i64 8
  br label %386

373:                                              ; preds = %331, %373
  %374 = phi i32 [ %384, %373 ], [ 0, %331 ]
  %375 = phi i64 [ %383, %373 ], [ 0, %331 ]
  %376 = zext i32 %374 to i64
  %377 = getelementptr inbounds i8, i8 addrspace(4)* %327, i64 %376
  %378 = load i8, i8 addrspace(4)* %377, align 1, !tbaa !8
  %379 = zext i8 %378 to i64
  %380 = shl i32 %374, 3
  %381 = zext i32 %380 to i64
  %382 = shl nuw i64 %379, %381
  %383 = or i64 %382, %375
  %384 = add nuw nsw i32 %374, 1
  %385 = icmp eq i32 %384, %328
  br i1 %385, label %386, label %373

386:                                              ; preds = %373, %333, %331
  %387 = phi i8 addrspace(4)* [ %372, %333 ], [ %327, %331 ], [ %327, %373 ]
  %388 = phi i32 [ %371, %333 ], [ 0, %331 ], [ 0, %373 ]
  %389 = phi i64 [ %370, %333 ], [ 0, %331 ], [ %383, %373 ]
  %390 = icmp ugt i32 %388, 7
  br i1 %390, label %393, label %391

391:                                              ; preds = %386
  %392 = icmp eq i32 %388, 0
  br i1 %392, label %444, label %431

393:                                              ; preds = %386
  %394 = load i8, i8 addrspace(4)* %387, align 1, !tbaa !8
  %395 = zext i8 %394 to i64
  %396 = getelementptr inbounds i8, i8 addrspace(4)* %387, i64 1
  %397 = load i8, i8 addrspace(4)* %396, align 1, !tbaa !8
  %398 = zext i8 %397 to i64
  %399 = shl nuw nsw i64 %398, 8
  %400 = or i64 %399, %395
  %401 = getelementptr inbounds i8, i8 addrspace(4)* %387, i64 2
  %402 = load i8, i8 addrspace(4)* %401, align 1, !tbaa !8
  %403 = zext i8 %402 to i64
  %404 = shl nuw nsw i64 %403, 16
  %405 = or i64 %400, %404
  %406 = getelementptr inbounds i8, i8 addrspace(4)* %387, i64 3
  %407 = load i8, i8 addrspace(4)* %406, align 1, !tbaa !8
  %408 = zext i8 %407 to i64
  %409 = shl nuw nsw i64 %408, 24
  %410 = or i64 %405, %409
  %411 = getelementptr inbounds i8, i8 addrspace(4)* %387, i64 4
  %412 = load i8, i8 addrspace(4)* %411, align 1, !tbaa !8
  %413 = zext i8 %412 to i64
  %414 = shl nuw nsw i64 %413, 32
  %415 = or i64 %410, %414
  %416 = getelementptr inbounds i8, i8 addrspace(4)* %387, i64 5
  %417 = load i8, i8 addrspace(4)* %416, align 1, !tbaa !8
  %418 = zext i8 %417 to i64
  %419 = shl nuw nsw i64 %418, 40
  %420 = or i64 %415, %419
  %421 = getelementptr inbounds i8, i8 addrspace(4)* %387, i64 6
  %422 = load i8, i8 addrspace(4)* %421, align 1, !tbaa !8
  %423 = zext i8 %422 to i64
  %424 = shl nuw nsw i64 %423, 48
  %425 = or i64 %420, %424
  %426 = getelementptr inbounds i8, i8 addrspace(4)* %387, i64 7
  %427 = load i8, i8 addrspace(4)* %426, align 1, !tbaa !8
  %428 = zext i8 %427 to i64
  %429 = shl nuw i64 %428, 56
  %430 = or i64 %425, %429
  br label %444

431:                                              ; preds = %391, %431
  %432 = phi i32 [ %442, %431 ], [ 0, %391 ]
  %433 = phi i64 [ %441, %431 ], [ 0, %391 ]
  %434 = zext i32 %432 to i64
  %435 = getelementptr inbounds i8, i8 addrspace(4)* %387, i64 %434
  %436 = load i8, i8 addrspace(4)* %435, align 1, !tbaa !8
  %437 = zext i8 %436 to i64
  %438 = shl i32 %432, 3
  %439 = zext i32 %438 to i64
  %440 = shl nuw i64 %437, %439
  %441 = or i64 %440, %433
  %442 = add nuw nsw i32 %432, 1
  %443 = icmp eq i32 %442, %388
  br i1 %443, label %444, label %431

444:                                              ; preds = %431, %393, %391
  %445 = phi i64 [ %430, %393 ], [ 0, %391 ], [ %441, %431 ]
  %446 = shl nuw nsw i64 %27, 2
  %447 = add nuw nsw i64 %446, 28
  %448 = and i64 %447, 480
  %449 = and i64 %29, -225
  %450 = or i64 %449, %448
  %451 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %7, i64 noundef %450, i64 noundef %89, i64 noundef %149, i64 noundef %209, i64 noundef %269, i64 noundef %329, i64 noundef %389, i64 noundef %445) #10
  %452 = sub i64 %19, %27
  %453 = getelementptr inbounds i8, i8 addrspace(4)* %20, i64 %27
  %454 = icmp eq i64 %452, 0
  br i1 %454, label %455, label %18

455:                                              ; preds = %444, %10
  %456 = phi <2 x i64> [ %13, %10 ], [ %451, %444 ]
  %457 = extractelement <2 x i64> %456, i64 0
  %458 = zext i32 %1 to i64
  %459 = and i64 %457, -227
  %460 = or i64 %459, 34
  %461 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %7, i64 noundef %460, i64 noundef %458, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %462 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !11
  %463 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %7, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %464 = extractelement <2 x i64> %463, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([15 x i8], [15 x i8] addrspace(4)* @.str.1, i64 0, i64 0) to i8*), i8* null), label %465, label %469

465:                                              ; preds = %455
  %466 = and i64 %464, -225
  %467 = or i64 %466, 32
  %468 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %7, i64 noundef %467, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  br label %910

469:                                              ; preds = %455
  %470 = and i64 %464, 2
  %471 = and i64 %464, -3
  %472 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %471, i64 0
  br label %473

473:                                              ; preds = %899, %469
  %474 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([15 x i8], [15 x i8] addrspace(4)* @.str.1, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([15 x i8], [15 x i8] addrspace(4)* @.str.1, i64 0, i64 14) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([15 x i8]* addrspacecast ([15 x i8] addrspace(4)* @.str.1 to [15 x i8]*) to i64)), i64 1))), %469 ], [ %907, %899 ]
  %475 = phi i8 addrspace(4)* [ getelementptr inbounds ([15 x i8], [15 x i8] addrspace(4)* @.str.1, i64 0, i64 0), %469 ], [ %908, %899 ]
  %476 = phi <2 x i64> [ %472, %469 ], [ %906, %899 ]
  %477 = icmp ugt i64 %474, 56
  %478 = extractelement <2 x i64> %476, i64 0
  %479 = or i64 %478, %470
  %480 = insertelement <2 x i64> poison, i64 %479, i64 0
  %481 = select i1 %477, <2 x i64> %476, <2 x i64> %480
  %482 = tail call i64 @llvm.umin.i64(i64 %474, i64 56)
  %483 = trunc i64 %482 to i32
  %484 = extractelement <2 x i64> %481, i64 0
  %485 = icmp ugt i32 %483, 7
  br i1 %485, label %488, label %486

486:                                              ; preds = %473
  %487 = icmp eq i32 %483, 0
  br i1 %487, label %541, label %528

488:                                              ; preds = %473
  %489 = load i8, i8 addrspace(4)* %475, align 1, !tbaa !8
  %490 = zext i8 %489 to i64
  %491 = getelementptr inbounds i8, i8 addrspace(4)* %475, i64 1
  %492 = load i8, i8 addrspace(4)* %491, align 1, !tbaa !8
  %493 = zext i8 %492 to i64
  %494 = shl nuw nsw i64 %493, 8
  %495 = or i64 %494, %490
  %496 = getelementptr inbounds i8, i8 addrspace(4)* %475, i64 2
  %497 = load i8, i8 addrspace(4)* %496, align 1, !tbaa !8
  %498 = zext i8 %497 to i64
  %499 = shl nuw nsw i64 %498, 16
  %500 = or i64 %495, %499
  %501 = getelementptr inbounds i8, i8 addrspace(4)* %475, i64 3
  %502 = load i8, i8 addrspace(4)* %501, align 1, !tbaa !8
  %503 = zext i8 %502 to i64
  %504 = shl nuw nsw i64 %503, 24
  %505 = or i64 %500, %504
  %506 = getelementptr inbounds i8, i8 addrspace(4)* %475, i64 4
  %507 = load i8, i8 addrspace(4)* %506, align 1, !tbaa !8
  %508 = zext i8 %507 to i64
  %509 = shl nuw nsw i64 %508, 32
  %510 = or i64 %505, %509
  %511 = getelementptr inbounds i8, i8 addrspace(4)* %475, i64 5
  %512 = load i8, i8 addrspace(4)* %511, align 1, !tbaa !8
  %513 = zext i8 %512 to i64
  %514 = shl nuw nsw i64 %513, 40
  %515 = or i64 %510, %514
  %516 = getelementptr inbounds i8, i8 addrspace(4)* %475, i64 6
  %517 = load i8, i8 addrspace(4)* %516, align 1, !tbaa !8
  %518 = zext i8 %517 to i64
  %519 = shl nuw nsw i64 %518, 48
  %520 = or i64 %515, %519
  %521 = getelementptr inbounds i8, i8 addrspace(4)* %475, i64 7
  %522 = load i8, i8 addrspace(4)* %521, align 1, !tbaa !8
  %523 = zext i8 %522 to i64
  %524 = shl nuw i64 %523, 56
  %525 = or i64 %520, %524
  %526 = add nsw i32 %483, -8
  %527 = getelementptr inbounds i8, i8 addrspace(4)* %475, i64 8
  br label %541

528:                                              ; preds = %486, %528
  %529 = phi i32 [ %539, %528 ], [ 0, %486 ]
  %530 = phi i64 [ %538, %528 ], [ 0, %486 ]
  %531 = zext i32 %529 to i64
  %532 = getelementptr inbounds i8, i8 addrspace(4)* %475, i64 %531
  %533 = load i8, i8 addrspace(4)* %532, align 1, !tbaa !8
  %534 = zext i8 %533 to i64
  %535 = shl i32 %529, 3
  %536 = zext i32 %535 to i64
  %537 = shl nuw i64 %534, %536
  %538 = or i64 %537, %530
  %539 = add nuw nsw i32 %529, 1
  %540 = icmp eq i32 %539, %483
  br i1 %540, label %541, label %528, !llvm.loop !9

541:                                              ; preds = %528, %488, %486
  %542 = phi i8 addrspace(4)* [ %527, %488 ], [ %475, %486 ], [ %475, %528 ]
  %543 = phi i32 [ %526, %488 ], [ 0, %486 ], [ 0, %528 ]
  %544 = phi i64 [ %525, %488 ], [ 0, %486 ], [ %538, %528 ]
  %545 = icmp ugt i32 %543, 7
  br i1 %545, label %548, label %546

546:                                              ; preds = %541
  %547 = icmp eq i32 %543, 0
  br i1 %547, label %601, label %588

548:                                              ; preds = %541
  %549 = load i8, i8 addrspace(4)* %542, align 1, !tbaa !8
  %550 = zext i8 %549 to i64
  %551 = getelementptr inbounds i8, i8 addrspace(4)* %542, i64 1
  %552 = load i8, i8 addrspace(4)* %551, align 1, !tbaa !8
  %553 = zext i8 %552 to i64
  %554 = shl nuw nsw i64 %553, 8
  %555 = or i64 %554, %550
  %556 = getelementptr inbounds i8, i8 addrspace(4)* %542, i64 2
  %557 = load i8, i8 addrspace(4)* %556, align 1, !tbaa !8
  %558 = zext i8 %557 to i64
  %559 = shl nuw nsw i64 %558, 16
  %560 = or i64 %555, %559
  %561 = getelementptr inbounds i8, i8 addrspace(4)* %542, i64 3
  %562 = load i8, i8 addrspace(4)* %561, align 1, !tbaa !8
  %563 = zext i8 %562 to i64
  %564 = shl nuw nsw i64 %563, 24
  %565 = or i64 %560, %564
  %566 = getelementptr inbounds i8, i8 addrspace(4)* %542, i64 4
  %567 = load i8, i8 addrspace(4)* %566, align 1, !tbaa !8
  %568 = zext i8 %567 to i64
  %569 = shl nuw nsw i64 %568, 32
  %570 = or i64 %565, %569
  %571 = getelementptr inbounds i8, i8 addrspace(4)* %542, i64 5
  %572 = load i8, i8 addrspace(4)* %571, align 1, !tbaa !8
  %573 = zext i8 %572 to i64
  %574 = shl nuw nsw i64 %573, 40
  %575 = or i64 %570, %574
  %576 = getelementptr inbounds i8, i8 addrspace(4)* %542, i64 6
  %577 = load i8, i8 addrspace(4)* %576, align 1, !tbaa !8
  %578 = zext i8 %577 to i64
  %579 = shl nuw nsw i64 %578, 48
  %580 = or i64 %575, %579
  %581 = getelementptr inbounds i8, i8 addrspace(4)* %542, i64 7
  %582 = load i8, i8 addrspace(4)* %581, align 1, !tbaa !8
  %583 = zext i8 %582 to i64
  %584 = shl nuw i64 %583, 56
  %585 = or i64 %580, %584
  %586 = add nsw i32 %543, -8
  %587 = getelementptr inbounds i8, i8 addrspace(4)* %542, i64 8
  br label %601

588:                                              ; preds = %546, %588
  %589 = phi i32 [ %599, %588 ], [ 0, %546 ]
  %590 = phi i64 [ %598, %588 ], [ 0, %546 ]
  %591 = zext i32 %589 to i64
  %592 = getelementptr inbounds i8, i8 addrspace(4)* %542, i64 %591
  %593 = load i8, i8 addrspace(4)* %592, align 1, !tbaa !8
  %594 = zext i8 %593 to i64
  %595 = shl i32 %589, 3
  %596 = zext i32 %595 to i64
  %597 = shl nuw i64 %594, %596
  %598 = or i64 %597, %590
  %599 = add nuw nsw i32 %589, 1
  %600 = icmp eq i32 %599, %543
  br i1 %600, label %601, label %588

601:                                              ; preds = %588, %548, %546
  %602 = phi i8 addrspace(4)* [ %587, %548 ], [ %542, %546 ], [ %542, %588 ]
  %603 = phi i32 [ %586, %548 ], [ 0, %546 ], [ 0, %588 ]
  %604 = phi i64 [ %585, %548 ], [ 0, %546 ], [ %598, %588 ]
  %605 = icmp ugt i32 %603, 7
  br i1 %605, label %608, label %606

606:                                              ; preds = %601
  %607 = icmp eq i32 %603, 0
  br i1 %607, label %661, label %648

608:                                              ; preds = %601
  %609 = load i8, i8 addrspace(4)* %602, align 1, !tbaa !8
  %610 = zext i8 %609 to i64
  %611 = getelementptr inbounds i8, i8 addrspace(4)* %602, i64 1
  %612 = load i8, i8 addrspace(4)* %611, align 1, !tbaa !8
  %613 = zext i8 %612 to i64
  %614 = shl nuw nsw i64 %613, 8
  %615 = or i64 %614, %610
  %616 = getelementptr inbounds i8, i8 addrspace(4)* %602, i64 2
  %617 = load i8, i8 addrspace(4)* %616, align 1, !tbaa !8
  %618 = zext i8 %617 to i64
  %619 = shl nuw nsw i64 %618, 16
  %620 = or i64 %615, %619
  %621 = getelementptr inbounds i8, i8 addrspace(4)* %602, i64 3
  %622 = load i8, i8 addrspace(4)* %621, align 1, !tbaa !8
  %623 = zext i8 %622 to i64
  %624 = shl nuw nsw i64 %623, 24
  %625 = or i64 %620, %624
  %626 = getelementptr inbounds i8, i8 addrspace(4)* %602, i64 4
  %627 = load i8, i8 addrspace(4)* %626, align 1, !tbaa !8
  %628 = zext i8 %627 to i64
  %629 = shl nuw nsw i64 %628, 32
  %630 = or i64 %625, %629
  %631 = getelementptr inbounds i8, i8 addrspace(4)* %602, i64 5
  %632 = load i8, i8 addrspace(4)* %631, align 1, !tbaa !8
  %633 = zext i8 %632 to i64
  %634 = shl nuw nsw i64 %633, 40
  %635 = or i64 %630, %634
  %636 = getelementptr inbounds i8, i8 addrspace(4)* %602, i64 6
  %637 = load i8, i8 addrspace(4)* %636, align 1, !tbaa !8
  %638 = zext i8 %637 to i64
  %639 = shl nuw nsw i64 %638, 48
  %640 = or i64 %635, %639
  %641 = getelementptr inbounds i8, i8 addrspace(4)* %602, i64 7
  %642 = load i8, i8 addrspace(4)* %641, align 1, !tbaa !8
  %643 = zext i8 %642 to i64
  %644 = shl nuw i64 %643, 56
  %645 = or i64 %640, %644
  %646 = add nsw i32 %603, -8
  %647 = getelementptr inbounds i8, i8 addrspace(4)* %602, i64 8
  br label %661

648:                                              ; preds = %606, %648
  %649 = phi i32 [ %659, %648 ], [ 0, %606 ]
  %650 = phi i64 [ %658, %648 ], [ 0, %606 ]
  %651 = zext i32 %649 to i64
  %652 = getelementptr inbounds i8, i8 addrspace(4)* %602, i64 %651
  %653 = load i8, i8 addrspace(4)* %652, align 1, !tbaa !8
  %654 = zext i8 %653 to i64
  %655 = shl i32 %649, 3
  %656 = zext i32 %655 to i64
  %657 = shl nuw i64 %654, %656
  %658 = or i64 %657, %650
  %659 = add nuw nsw i32 %649, 1
  %660 = icmp eq i32 %659, %603
  br i1 %660, label %661, label %648

661:                                              ; preds = %648, %608, %606
  %662 = phi i8 addrspace(4)* [ %647, %608 ], [ %602, %606 ], [ %602, %648 ]
  %663 = phi i32 [ %646, %608 ], [ 0, %606 ], [ 0, %648 ]
  %664 = phi i64 [ %645, %608 ], [ 0, %606 ], [ %658, %648 ]
  %665 = icmp ugt i32 %663, 7
  br i1 %665, label %668, label %666

666:                                              ; preds = %661
  %667 = icmp eq i32 %663, 0
  br i1 %667, label %721, label %708

668:                                              ; preds = %661
  %669 = load i8, i8 addrspace(4)* %662, align 1, !tbaa !8
  %670 = zext i8 %669 to i64
  %671 = getelementptr inbounds i8, i8 addrspace(4)* %662, i64 1
  %672 = load i8, i8 addrspace(4)* %671, align 1, !tbaa !8
  %673 = zext i8 %672 to i64
  %674 = shl nuw nsw i64 %673, 8
  %675 = or i64 %674, %670
  %676 = getelementptr inbounds i8, i8 addrspace(4)* %662, i64 2
  %677 = load i8, i8 addrspace(4)* %676, align 1, !tbaa !8
  %678 = zext i8 %677 to i64
  %679 = shl nuw nsw i64 %678, 16
  %680 = or i64 %675, %679
  %681 = getelementptr inbounds i8, i8 addrspace(4)* %662, i64 3
  %682 = load i8, i8 addrspace(4)* %681, align 1, !tbaa !8
  %683 = zext i8 %682 to i64
  %684 = shl nuw nsw i64 %683, 24
  %685 = or i64 %680, %684
  %686 = getelementptr inbounds i8, i8 addrspace(4)* %662, i64 4
  %687 = load i8, i8 addrspace(4)* %686, align 1, !tbaa !8
  %688 = zext i8 %687 to i64
  %689 = shl nuw nsw i64 %688, 32
  %690 = or i64 %685, %689
  %691 = getelementptr inbounds i8, i8 addrspace(4)* %662, i64 5
  %692 = load i8, i8 addrspace(4)* %691, align 1, !tbaa !8
  %693 = zext i8 %692 to i64
  %694 = shl nuw nsw i64 %693, 40
  %695 = or i64 %690, %694
  %696 = getelementptr inbounds i8, i8 addrspace(4)* %662, i64 6
  %697 = load i8, i8 addrspace(4)* %696, align 1, !tbaa !8
  %698 = zext i8 %697 to i64
  %699 = shl nuw nsw i64 %698, 48
  %700 = or i64 %695, %699
  %701 = getelementptr inbounds i8, i8 addrspace(4)* %662, i64 7
  %702 = load i8, i8 addrspace(4)* %701, align 1, !tbaa !8
  %703 = zext i8 %702 to i64
  %704 = shl nuw i64 %703, 56
  %705 = or i64 %700, %704
  %706 = add nsw i32 %663, -8
  %707 = getelementptr inbounds i8, i8 addrspace(4)* %662, i64 8
  br label %721

708:                                              ; preds = %666, %708
  %709 = phi i32 [ %719, %708 ], [ 0, %666 ]
  %710 = phi i64 [ %718, %708 ], [ 0, %666 ]
  %711 = zext i32 %709 to i64
  %712 = getelementptr inbounds i8, i8 addrspace(4)* %662, i64 %711
  %713 = load i8, i8 addrspace(4)* %712, align 1, !tbaa !8
  %714 = zext i8 %713 to i64
  %715 = shl i32 %709, 3
  %716 = zext i32 %715 to i64
  %717 = shl nuw i64 %714, %716
  %718 = or i64 %717, %710
  %719 = add nuw nsw i32 %709, 1
  %720 = icmp eq i32 %719, %663
  br i1 %720, label %721, label %708

721:                                              ; preds = %708, %668, %666
  %722 = phi i8 addrspace(4)* [ %707, %668 ], [ %662, %666 ], [ %662, %708 ]
  %723 = phi i32 [ %706, %668 ], [ 0, %666 ], [ 0, %708 ]
  %724 = phi i64 [ %705, %668 ], [ 0, %666 ], [ %718, %708 ]
  %725 = icmp ugt i32 %723, 7
  br i1 %725, label %728, label %726

726:                                              ; preds = %721
  %727 = icmp eq i32 %723, 0
  br i1 %727, label %781, label %768

728:                                              ; preds = %721
  %729 = load i8, i8 addrspace(4)* %722, align 1, !tbaa !8
  %730 = zext i8 %729 to i64
  %731 = getelementptr inbounds i8, i8 addrspace(4)* %722, i64 1
  %732 = load i8, i8 addrspace(4)* %731, align 1, !tbaa !8
  %733 = zext i8 %732 to i64
  %734 = shl nuw nsw i64 %733, 8
  %735 = or i64 %734, %730
  %736 = getelementptr inbounds i8, i8 addrspace(4)* %722, i64 2
  %737 = load i8, i8 addrspace(4)* %736, align 1, !tbaa !8
  %738 = zext i8 %737 to i64
  %739 = shl nuw nsw i64 %738, 16
  %740 = or i64 %735, %739
  %741 = getelementptr inbounds i8, i8 addrspace(4)* %722, i64 3
  %742 = load i8, i8 addrspace(4)* %741, align 1, !tbaa !8
  %743 = zext i8 %742 to i64
  %744 = shl nuw nsw i64 %743, 24
  %745 = or i64 %740, %744
  %746 = getelementptr inbounds i8, i8 addrspace(4)* %722, i64 4
  %747 = load i8, i8 addrspace(4)* %746, align 1, !tbaa !8
  %748 = zext i8 %747 to i64
  %749 = shl nuw nsw i64 %748, 32
  %750 = or i64 %745, %749
  %751 = getelementptr inbounds i8, i8 addrspace(4)* %722, i64 5
  %752 = load i8, i8 addrspace(4)* %751, align 1, !tbaa !8
  %753 = zext i8 %752 to i64
  %754 = shl nuw nsw i64 %753, 40
  %755 = or i64 %750, %754
  %756 = getelementptr inbounds i8, i8 addrspace(4)* %722, i64 6
  %757 = load i8, i8 addrspace(4)* %756, align 1, !tbaa !8
  %758 = zext i8 %757 to i64
  %759 = shl nuw nsw i64 %758, 48
  %760 = or i64 %755, %759
  %761 = getelementptr inbounds i8, i8 addrspace(4)* %722, i64 7
  %762 = load i8, i8 addrspace(4)* %761, align 1, !tbaa !8
  %763 = zext i8 %762 to i64
  %764 = shl nuw i64 %763, 56
  %765 = or i64 %760, %764
  %766 = add nsw i32 %723, -8
  %767 = getelementptr inbounds i8, i8 addrspace(4)* %722, i64 8
  br label %781

768:                                              ; preds = %726, %768
  %769 = phi i32 [ %779, %768 ], [ 0, %726 ]
  %770 = phi i64 [ %778, %768 ], [ 0, %726 ]
  %771 = zext i32 %769 to i64
  %772 = getelementptr inbounds i8, i8 addrspace(4)* %722, i64 %771
  %773 = load i8, i8 addrspace(4)* %772, align 1, !tbaa !8
  %774 = zext i8 %773 to i64
  %775 = shl i32 %769, 3
  %776 = zext i32 %775 to i64
  %777 = shl nuw i64 %774, %776
  %778 = or i64 %777, %770
  %779 = add nuw nsw i32 %769, 1
  %780 = icmp eq i32 %779, %723
  br i1 %780, label %781, label %768

781:                                              ; preds = %768, %728, %726
  %782 = phi i8 addrspace(4)* [ %767, %728 ], [ %722, %726 ], [ %722, %768 ]
  %783 = phi i32 [ %766, %728 ], [ 0, %726 ], [ 0, %768 ]
  %784 = phi i64 [ %765, %728 ], [ 0, %726 ], [ %778, %768 ]
  %785 = icmp ugt i32 %783, 7
  br i1 %785, label %788, label %786

786:                                              ; preds = %781
  %787 = icmp eq i32 %783, 0
  br i1 %787, label %841, label %828

788:                                              ; preds = %781
  %789 = load i8, i8 addrspace(4)* %782, align 1, !tbaa !8
  %790 = zext i8 %789 to i64
  %791 = getelementptr inbounds i8, i8 addrspace(4)* %782, i64 1
  %792 = load i8, i8 addrspace(4)* %791, align 1, !tbaa !8
  %793 = zext i8 %792 to i64
  %794 = shl nuw nsw i64 %793, 8
  %795 = or i64 %794, %790
  %796 = getelementptr inbounds i8, i8 addrspace(4)* %782, i64 2
  %797 = load i8, i8 addrspace(4)* %796, align 1, !tbaa !8
  %798 = zext i8 %797 to i64
  %799 = shl nuw nsw i64 %798, 16
  %800 = or i64 %795, %799
  %801 = getelementptr inbounds i8, i8 addrspace(4)* %782, i64 3
  %802 = load i8, i8 addrspace(4)* %801, align 1, !tbaa !8
  %803 = zext i8 %802 to i64
  %804 = shl nuw nsw i64 %803, 24
  %805 = or i64 %800, %804
  %806 = getelementptr inbounds i8, i8 addrspace(4)* %782, i64 4
  %807 = load i8, i8 addrspace(4)* %806, align 1, !tbaa !8
  %808 = zext i8 %807 to i64
  %809 = shl nuw nsw i64 %808, 32
  %810 = or i64 %805, %809
  %811 = getelementptr inbounds i8, i8 addrspace(4)* %782, i64 5
  %812 = load i8, i8 addrspace(4)* %811, align 1, !tbaa !8
  %813 = zext i8 %812 to i64
  %814 = shl nuw nsw i64 %813, 40
  %815 = or i64 %810, %814
  %816 = getelementptr inbounds i8, i8 addrspace(4)* %782, i64 6
  %817 = load i8, i8 addrspace(4)* %816, align 1, !tbaa !8
  %818 = zext i8 %817 to i64
  %819 = shl nuw nsw i64 %818, 48
  %820 = or i64 %815, %819
  %821 = getelementptr inbounds i8, i8 addrspace(4)* %782, i64 7
  %822 = load i8, i8 addrspace(4)* %821, align 1, !tbaa !8
  %823 = zext i8 %822 to i64
  %824 = shl nuw i64 %823, 56
  %825 = or i64 %820, %824
  %826 = add nsw i32 %783, -8
  %827 = getelementptr inbounds i8, i8 addrspace(4)* %782, i64 8
  br label %841

828:                                              ; preds = %786, %828
  %829 = phi i32 [ %839, %828 ], [ 0, %786 ]
  %830 = phi i64 [ %838, %828 ], [ 0, %786 ]
  %831 = zext i32 %829 to i64
  %832 = getelementptr inbounds i8, i8 addrspace(4)* %782, i64 %831
  %833 = load i8, i8 addrspace(4)* %832, align 1, !tbaa !8
  %834 = zext i8 %833 to i64
  %835 = shl i32 %829, 3
  %836 = zext i32 %835 to i64
  %837 = shl nuw i64 %834, %836
  %838 = or i64 %837, %830
  %839 = add nuw nsw i32 %829, 1
  %840 = icmp eq i32 %839, %783
  br i1 %840, label %841, label %828

841:                                              ; preds = %828, %788, %786
  %842 = phi i8 addrspace(4)* [ %827, %788 ], [ %782, %786 ], [ %782, %828 ]
  %843 = phi i32 [ %826, %788 ], [ 0, %786 ], [ 0, %828 ]
  %844 = phi i64 [ %825, %788 ], [ 0, %786 ], [ %838, %828 ]
  %845 = icmp ugt i32 %843, 7
  br i1 %845, label %848, label %846

846:                                              ; preds = %841
  %847 = icmp eq i32 %843, 0
  br i1 %847, label %899, label %886

848:                                              ; preds = %841
  %849 = load i8, i8 addrspace(4)* %842, align 1, !tbaa !8
  %850 = zext i8 %849 to i64
  %851 = getelementptr inbounds i8, i8 addrspace(4)* %842, i64 1
  %852 = load i8, i8 addrspace(4)* %851, align 1, !tbaa !8
  %853 = zext i8 %852 to i64
  %854 = shl nuw nsw i64 %853, 8
  %855 = or i64 %854, %850
  %856 = getelementptr inbounds i8, i8 addrspace(4)* %842, i64 2
  %857 = load i8, i8 addrspace(4)* %856, align 1, !tbaa !8
  %858 = zext i8 %857 to i64
  %859 = shl nuw nsw i64 %858, 16
  %860 = or i64 %855, %859
  %861 = getelementptr inbounds i8, i8 addrspace(4)* %842, i64 3
  %862 = load i8, i8 addrspace(4)* %861, align 1, !tbaa !8
  %863 = zext i8 %862 to i64
  %864 = shl nuw nsw i64 %863, 24
  %865 = or i64 %860, %864
  %866 = getelementptr inbounds i8, i8 addrspace(4)* %842, i64 4
  %867 = load i8, i8 addrspace(4)* %866, align 1, !tbaa !8
  %868 = zext i8 %867 to i64
  %869 = shl nuw nsw i64 %868, 32
  %870 = or i64 %865, %869
  %871 = getelementptr inbounds i8, i8 addrspace(4)* %842, i64 5
  %872 = load i8, i8 addrspace(4)* %871, align 1, !tbaa !8
  %873 = zext i8 %872 to i64
  %874 = shl nuw nsw i64 %873, 40
  %875 = or i64 %870, %874
  %876 = getelementptr inbounds i8, i8 addrspace(4)* %842, i64 6
  %877 = load i8, i8 addrspace(4)* %876, align 1, !tbaa !8
  %878 = zext i8 %877 to i64
  %879 = shl nuw nsw i64 %878, 48
  %880 = or i64 %875, %879
  %881 = getelementptr inbounds i8, i8 addrspace(4)* %842, i64 7
  %882 = load i8, i8 addrspace(4)* %881, align 1, !tbaa !8
  %883 = zext i8 %882 to i64
  %884 = shl nuw i64 %883, 56
  %885 = or i64 %880, %884
  br label %899

886:                                              ; preds = %846, %886
  %887 = phi i32 [ %897, %886 ], [ 0, %846 ]
  %888 = phi i64 [ %896, %886 ], [ 0, %846 ]
  %889 = zext i32 %887 to i64
  %890 = getelementptr inbounds i8, i8 addrspace(4)* %842, i64 %889
  %891 = load i8, i8 addrspace(4)* %890, align 1, !tbaa !8
  %892 = zext i8 %891 to i64
  %893 = shl i32 %887, 3
  %894 = zext i32 %893 to i64
  %895 = shl nuw i64 %892, %894
  %896 = or i64 %895, %888
  %897 = add nuw nsw i32 %887, 1
  %898 = icmp eq i32 %897, %843
  br i1 %898, label %899, label %886

899:                                              ; preds = %886, %848, %846
  %900 = phi i64 [ %885, %848 ], [ 0, %846 ], [ %896, %886 ]
  %901 = shl nuw nsw i64 %482, 2
  %902 = add nuw nsw i64 %901, 28
  %903 = and i64 %902, 480
  %904 = and i64 %484, -225
  %905 = or i64 %904, %903
  %906 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %7, i64 noundef %905, i64 noundef %544, i64 noundef %604, i64 noundef %664, i64 noundef %724, i64 noundef %784, i64 noundef %844, i64 noundef %900) #10
  %907 = sub i64 %474, %482
  %908 = getelementptr inbounds i8, i8 addrspace(4)* %475, i64 %482
  %909 = icmp eq i64 %907, 0
  br i1 %909, label %910, label %473

910:                                              ; preds = %899, %465
  %911 = phi <2 x i64> [ %468, %465 ], [ %906, %899 ]
  %912 = extractelement <2 x i64> %911, i64 0
  %913 = zext i32 %462 to i64
  %914 = and i64 %912, -227
  %915 = or i64 %914, 34
  %916 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %7, i64 noundef %915, i64 noundef %913, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %917 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %918 = getelementptr i8, i8 addrspace(4)* %917, i64 4
  %919 = bitcast i8 addrspace(4)* %918 to i16 addrspace(4)*
  %920 = load i16, i16 addrspace(4)* %919, align 4, !range !12, !invariant.load !13
  %921 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %7, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %922 = extractelement <2 x i64> %921, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([15 x i8], [15 x i8] addrspace(4)* @.str.2, i64 0, i64 0) to i8*), i8* null), label %923, label %927

923:                                              ; preds = %910
  %924 = and i64 %922, -225
  %925 = or i64 %924, 32
  %926 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %7, i64 noundef %925, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  br label %1368

927:                                              ; preds = %910
  %928 = and i64 %922, 2
  %929 = and i64 %922, -3
  %930 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %929, i64 0
  br label %931

931:                                              ; preds = %1357, %927
  %932 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([15 x i8], [15 x i8] addrspace(4)* @.str.2, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([15 x i8], [15 x i8] addrspace(4)* @.str.2, i64 0, i64 14) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([15 x i8]* addrspacecast ([15 x i8] addrspace(4)* @.str.2 to [15 x i8]*) to i64)), i64 1))), %927 ], [ %1365, %1357 ]
  %933 = phi i8 addrspace(4)* [ getelementptr inbounds ([15 x i8], [15 x i8] addrspace(4)* @.str.2, i64 0, i64 0), %927 ], [ %1366, %1357 ]
  %934 = phi <2 x i64> [ %930, %927 ], [ %1364, %1357 ]
  %935 = icmp ugt i64 %932, 56
  %936 = extractelement <2 x i64> %934, i64 0
  %937 = or i64 %936, %928
  %938 = insertelement <2 x i64> poison, i64 %937, i64 0
  %939 = select i1 %935, <2 x i64> %934, <2 x i64> %938
  %940 = tail call i64 @llvm.umin.i64(i64 %932, i64 56)
  %941 = trunc i64 %940 to i32
  %942 = extractelement <2 x i64> %939, i64 0
  %943 = icmp ugt i32 %941, 7
  br i1 %943, label %946, label %944

944:                                              ; preds = %931
  %945 = icmp eq i32 %941, 0
  br i1 %945, label %999, label %986

946:                                              ; preds = %931
  %947 = load i8, i8 addrspace(4)* %933, align 1, !tbaa !8
  %948 = zext i8 %947 to i64
  %949 = getelementptr inbounds i8, i8 addrspace(4)* %933, i64 1
  %950 = load i8, i8 addrspace(4)* %949, align 1, !tbaa !8
  %951 = zext i8 %950 to i64
  %952 = shl nuw nsw i64 %951, 8
  %953 = or i64 %952, %948
  %954 = getelementptr inbounds i8, i8 addrspace(4)* %933, i64 2
  %955 = load i8, i8 addrspace(4)* %954, align 1, !tbaa !8
  %956 = zext i8 %955 to i64
  %957 = shl nuw nsw i64 %956, 16
  %958 = or i64 %953, %957
  %959 = getelementptr inbounds i8, i8 addrspace(4)* %933, i64 3
  %960 = load i8, i8 addrspace(4)* %959, align 1, !tbaa !8
  %961 = zext i8 %960 to i64
  %962 = shl nuw nsw i64 %961, 24
  %963 = or i64 %958, %962
  %964 = getelementptr inbounds i8, i8 addrspace(4)* %933, i64 4
  %965 = load i8, i8 addrspace(4)* %964, align 1, !tbaa !8
  %966 = zext i8 %965 to i64
  %967 = shl nuw nsw i64 %966, 32
  %968 = or i64 %963, %967
  %969 = getelementptr inbounds i8, i8 addrspace(4)* %933, i64 5
  %970 = load i8, i8 addrspace(4)* %969, align 1, !tbaa !8
  %971 = zext i8 %970 to i64
  %972 = shl nuw nsw i64 %971, 40
  %973 = or i64 %968, %972
  %974 = getelementptr inbounds i8, i8 addrspace(4)* %933, i64 6
  %975 = load i8, i8 addrspace(4)* %974, align 1, !tbaa !8
  %976 = zext i8 %975 to i64
  %977 = shl nuw nsw i64 %976, 48
  %978 = or i64 %973, %977
  %979 = getelementptr inbounds i8, i8 addrspace(4)* %933, i64 7
  %980 = load i8, i8 addrspace(4)* %979, align 1, !tbaa !8
  %981 = zext i8 %980 to i64
  %982 = shl nuw i64 %981, 56
  %983 = or i64 %978, %982
  %984 = add nsw i32 %941, -8
  %985 = getelementptr inbounds i8, i8 addrspace(4)* %933, i64 8
  br label %999

986:                                              ; preds = %944, %986
  %987 = phi i32 [ %997, %986 ], [ 0, %944 ]
  %988 = phi i64 [ %996, %986 ], [ 0, %944 ]
  %989 = zext i32 %987 to i64
  %990 = getelementptr inbounds i8, i8 addrspace(4)* %933, i64 %989
  %991 = load i8, i8 addrspace(4)* %990, align 1, !tbaa !8
  %992 = zext i8 %991 to i64
  %993 = shl i32 %987, 3
  %994 = zext i32 %993 to i64
  %995 = shl nuw i64 %992, %994
  %996 = or i64 %995, %988
  %997 = add nuw nsw i32 %987, 1
  %998 = icmp eq i32 %997, %941
  br i1 %998, label %999, label %986, !llvm.loop !9

999:                                              ; preds = %986, %946, %944
  %1000 = phi i8 addrspace(4)* [ %985, %946 ], [ %933, %944 ], [ %933, %986 ]
  %1001 = phi i32 [ %984, %946 ], [ 0, %944 ], [ 0, %986 ]
  %1002 = phi i64 [ %983, %946 ], [ 0, %944 ], [ %996, %986 ]
  %1003 = icmp ugt i32 %1001, 7
  br i1 %1003, label %1006, label %1004

1004:                                             ; preds = %999
  %1005 = icmp eq i32 %1001, 0
  br i1 %1005, label %1059, label %1046

1006:                                             ; preds = %999
  %1007 = load i8, i8 addrspace(4)* %1000, align 1, !tbaa !8
  %1008 = zext i8 %1007 to i64
  %1009 = getelementptr inbounds i8, i8 addrspace(4)* %1000, i64 1
  %1010 = load i8, i8 addrspace(4)* %1009, align 1, !tbaa !8
  %1011 = zext i8 %1010 to i64
  %1012 = shl nuw nsw i64 %1011, 8
  %1013 = or i64 %1012, %1008
  %1014 = getelementptr inbounds i8, i8 addrspace(4)* %1000, i64 2
  %1015 = load i8, i8 addrspace(4)* %1014, align 1, !tbaa !8
  %1016 = zext i8 %1015 to i64
  %1017 = shl nuw nsw i64 %1016, 16
  %1018 = or i64 %1013, %1017
  %1019 = getelementptr inbounds i8, i8 addrspace(4)* %1000, i64 3
  %1020 = load i8, i8 addrspace(4)* %1019, align 1, !tbaa !8
  %1021 = zext i8 %1020 to i64
  %1022 = shl nuw nsw i64 %1021, 24
  %1023 = or i64 %1018, %1022
  %1024 = getelementptr inbounds i8, i8 addrspace(4)* %1000, i64 4
  %1025 = load i8, i8 addrspace(4)* %1024, align 1, !tbaa !8
  %1026 = zext i8 %1025 to i64
  %1027 = shl nuw nsw i64 %1026, 32
  %1028 = or i64 %1023, %1027
  %1029 = getelementptr inbounds i8, i8 addrspace(4)* %1000, i64 5
  %1030 = load i8, i8 addrspace(4)* %1029, align 1, !tbaa !8
  %1031 = zext i8 %1030 to i64
  %1032 = shl nuw nsw i64 %1031, 40
  %1033 = or i64 %1028, %1032
  %1034 = getelementptr inbounds i8, i8 addrspace(4)* %1000, i64 6
  %1035 = load i8, i8 addrspace(4)* %1034, align 1, !tbaa !8
  %1036 = zext i8 %1035 to i64
  %1037 = shl nuw nsw i64 %1036, 48
  %1038 = or i64 %1033, %1037
  %1039 = getelementptr inbounds i8, i8 addrspace(4)* %1000, i64 7
  %1040 = load i8, i8 addrspace(4)* %1039, align 1, !tbaa !8
  %1041 = zext i8 %1040 to i64
  %1042 = shl nuw i64 %1041, 56
  %1043 = or i64 %1038, %1042
  %1044 = add nsw i32 %1001, -8
  %1045 = getelementptr inbounds i8, i8 addrspace(4)* %1000, i64 8
  br label %1059

1046:                                             ; preds = %1004, %1046
  %1047 = phi i32 [ %1057, %1046 ], [ 0, %1004 ]
  %1048 = phi i64 [ %1056, %1046 ], [ 0, %1004 ]
  %1049 = zext i32 %1047 to i64
  %1050 = getelementptr inbounds i8, i8 addrspace(4)* %1000, i64 %1049
  %1051 = load i8, i8 addrspace(4)* %1050, align 1, !tbaa !8
  %1052 = zext i8 %1051 to i64
  %1053 = shl i32 %1047, 3
  %1054 = zext i32 %1053 to i64
  %1055 = shl nuw i64 %1052, %1054
  %1056 = or i64 %1055, %1048
  %1057 = add nuw nsw i32 %1047, 1
  %1058 = icmp eq i32 %1057, %1001
  br i1 %1058, label %1059, label %1046

1059:                                             ; preds = %1046, %1006, %1004
  %1060 = phi i8 addrspace(4)* [ %1045, %1006 ], [ %1000, %1004 ], [ %1000, %1046 ]
  %1061 = phi i32 [ %1044, %1006 ], [ 0, %1004 ], [ 0, %1046 ]
  %1062 = phi i64 [ %1043, %1006 ], [ 0, %1004 ], [ %1056, %1046 ]
  %1063 = icmp ugt i32 %1061, 7
  br i1 %1063, label %1066, label %1064

1064:                                             ; preds = %1059
  %1065 = icmp eq i32 %1061, 0
  br i1 %1065, label %1119, label %1106

1066:                                             ; preds = %1059
  %1067 = load i8, i8 addrspace(4)* %1060, align 1, !tbaa !8
  %1068 = zext i8 %1067 to i64
  %1069 = getelementptr inbounds i8, i8 addrspace(4)* %1060, i64 1
  %1070 = load i8, i8 addrspace(4)* %1069, align 1, !tbaa !8
  %1071 = zext i8 %1070 to i64
  %1072 = shl nuw nsw i64 %1071, 8
  %1073 = or i64 %1072, %1068
  %1074 = getelementptr inbounds i8, i8 addrspace(4)* %1060, i64 2
  %1075 = load i8, i8 addrspace(4)* %1074, align 1, !tbaa !8
  %1076 = zext i8 %1075 to i64
  %1077 = shl nuw nsw i64 %1076, 16
  %1078 = or i64 %1073, %1077
  %1079 = getelementptr inbounds i8, i8 addrspace(4)* %1060, i64 3
  %1080 = load i8, i8 addrspace(4)* %1079, align 1, !tbaa !8
  %1081 = zext i8 %1080 to i64
  %1082 = shl nuw nsw i64 %1081, 24
  %1083 = or i64 %1078, %1082
  %1084 = getelementptr inbounds i8, i8 addrspace(4)* %1060, i64 4
  %1085 = load i8, i8 addrspace(4)* %1084, align 1, !tbaa !8
  %1086 = zext i8 %1085 to i64
  %1087 = shl nuw nsw i64 %1086, 32
  %1088 = or i64 %1083, %1087
  %1089 = getelementptr inbounds i8, i8 addrspace(4)* %1060, i64 5
  %1090 = load i8, i8 addrspace(4)* %1089, align 1, !tbaa !8
  %1091 = zext i8 %1090 to i64
  %1092 = shl nuw nsw i64 %1091, 40
  %1093 = or i64 %1088, %1092
  %1094 = getelementptr inbounds i8, i8 addrspace(4)* %1060, i64 6
  %1095 = load i8, i8 addrspace(4)* %1094, align 1, !tbaa !8
  %1096 = zext i8 %1095 to i64
  %1097 = shl nuw nsw i64 %1096, 48
  %1098 = or i64 %1093, %1097
  %1099 = getelementptr inbounds i8, i8 addrspace(4)* %1060, i64 7
  %1100 = load i8, i8 addrspace(4)* %1099, align 1, !tbaa !8
  %1101 = zext i8 %1100 to i64
  %1102 = shl nuw i64 %1101, 56
  %1103 = or i64 %1098, %1102
  %1104 = add nsw i32 %1061, -8
  %1105 = getelementptr inbounds i8, i8 addrspace(4)* %1060, i64 8
  br label %1119

1106:                                             ; preds = %1064, %1106
  %1107 = phi i32 [ %1117, %1106 ], [ 0, %1064 ]
  %1108 = phi i64 [ %1116, %1106 ], [ 0, %1064 ]
  %1109 = zext i32 %1107 to i64
  %1110 = getelementptr inbounds i8, i8 addrspace(4)* %1060, i64 %1109
  %1111 = load i8, i8 addrspace(4)* %1110, align 1, !tbaa !8
  %1112 = zext i8 %1111 to i64
  %1113 = shl i32 %1107, 3
  %1114 = zext i32 %1113 to i64
  %1115 = shl nuw i64 %1112, %1114
  %1116 = or i64 %1115, %1108
  %1117 = add nuw nsw i32 %1107, 1
  %1118 = icmp eq i32 %1117, %1061
  br i1 %1118, label %1119, label %1106

1119:                                             ; preds = %1106, %1066, %1064
  %1120 = phi i8 addrspace(4)* [ %1105, %1066 ], [ %1060, %1064 ], [ %1060, %1106 ]
  %1121 = phi i32 [ %1104, %1066 ], [ 0, %1064 ], [ 0, %1106 ]
  %1122 = phi i64 [ %1103, %1066 ], [ 0, %1064 ], [ %1116, %1106 ]
  %1123 = icmp ugt i32 %1121, 7
  br i1 %1123, label %1126, label %1124

1124:                                             ; preds = %1119
  %1125 = icmp eq i32 %1121, 0
  br i1 %1125, label %1179, label %1166

1126:                                             ; preds = %1119
  %1127 = load i8, i8 addrspace(4)* %1120, align 1, !tbaa !8
  %1128 = zext i8 %1127 to i64
  %1129 = getelementptr inbounds i8, i8 addrspace(4)* %1120, i64 1
  %1130 = load i8, i8 addrspace(4)* %1129, align 1, !tbaa !8
  %1131 = zext i8 %1130 to i64
  %1132 = shl nuw nsw i64 %1131, 8
  %1133 = or i64 %1132, %1128
  %1134 = getelementptr inbounds i8, i8 addrspace(4)* %1120, i64 2
  %1135 = load i8, i8 addrspace(4)* %1134, align 1, !tbaa !8
  %1136 = zext i8 %1135 to i64
  %1137 = shl nuw nsw i64 %1136, 16
  %1138 = or i64 %1133, %1137
  %1139 = getelementptr inbounds i8, i8 addrspace(4)* %1120, i64 3
  %1140 = load i8, i8 addrspace(4)* %1139, align 1, !tbaa !8
  %1141 = zext i8 %1140 to i64
  %1142 = shl nuw nsw i64 %1141, 24
  %1143 = or i64 %1138, %1142
  %1144 = getelementptr inbounds i8, i8 addrspace(4)* %1120, i64 4
  %1145 = load i8, i8 addrspace(4)* %1144, align 1, !tbaa !8
  %1146 = zext i8 %1145 to i64
  %1147 = shl nuw nsw i64 %1146, 32
  %1148 = or i64 %1143, %1147
  %1149 = getelementptr inbounds i8, i8 addrspace(4)* %1120, i64 5
  %1150 = load i8, i8 addrspace(4)* %1149, align 1, !tbaa !8
  %1151 = zext i8 %1150 to i64
  %1152 = shl nuw nsw i64 %1151, 40
  %1153 = or i64 %1148, %1152
  %1154 = getelementptr inbounds i8, i8 addrspace(4)* %1120, i64 6
  %1155 = load i8, i8 addrspace(4)* %1154, align 1, !tbaa !8
  %1156 = zext i8 %1155 to i64
  %1157 = shl nuw nsw i64 %1156, 48
  %1158 = or i64 %1153, %1157
  %1159 = getelementptr inbounds i8, i8 addrspace(4)* %1120, i64 7
  %1160 = load i8, i8 addrspace(4)* %1159, align 1, !tbaa !8
  %1161 = zext i8 %1160 to i64
  %1162 = shl nuw i64 %1161, 56
  %1163 = or i64 %1158, %1162
  %1164 = add nsw i32 %1121, -8
  %1165 = getelementptr inbounds i8, i8 addrspace(4)* %1120, i64 8
  br label %1179

1166:                                             ; preds = %1124, %1166
  %1167 = phi i32 [ %1177, %1166 ], [ 0, %1124 ]
  %1168 = phi i64 [ %1176, %1166 ], [ 0, %1124 ]
  %1169 = zext i32 %1167 to i64
  %1170 = getelementptr inbounds i8, i8 addrspace(4)* %1120, i64 %1169
  %1171 = load i8, i8 addrspace(4)* %1170, align 1, !tbaa !8
  %1172 = zext i8 %1171 to i64
  %1173 = shl i32 %1167, 3
  %1174 = zext i32 %1173 to i64
  %1175 = shl nuw i64 %1172, %1174
  %1176 = or i64 %1175, %1168
  %1177 = add nuw nsw i32 %1167, 1
  %1178 = icmp eq i32 %1177, %1121
  br i1 %1178, label %1179, label %1166

1179:                                             ; preds = %1166, %1126, %1124
  %1180 = phi i8 addrspace(4)* [ %1165, %1126 ], [ %1120, %1124 ], [ %1120, %1166 ]
  %1181 = phi i32 [ %1164, %1126 ], [ 0, %1124 ], [ 0, %1166 ]
  %1182 = phi i64 [ %1163, %1126 ], [ 0, %1124 ], [ %1176, %1166 ]
  %1183 = icmp ugt i32 %1181, 7
  br i1 %1183, label %1186, label %1184

1184:                                             ; preds = %1179
  %1185 = icmp eq i32 %1181, 0
  br i1 %1185, label %1239, label %1226

1186:                                             ; preds = %1179
  %1187 = load i8, i8 addrspace(4)* %1180, align 1, !tbaa !8
  %1188 = zext i8 %1187 to i64
  %1189 = getelementptr inbounds i8, i8 addrspace(4)* %1180, i64 1
  %1190 = load i8, i8 addrspace(4)* %1189, align 1, !tbaa !8
  %1191 = zext i8 %1190 to i64
  %1192 = shl nuw nsw i64 %1191, 8
  %1193 = or i64 %1192, %1188
  %1194 = getelementptr inbounds i8, i8 addrspace(4)* %1180, i64 2
  %1195 = load i8, i8 addrspace(4)* %1194, align 1, !tbaa !8
  %1196 = zext i8 %1195 to i64
  %1197 = shl nuw nsw i64 %1196, 16
  %1198 = or i64 %1193, %1197
  %1199 = getelementptr inbounds i8, i8 addrspace(4)* %1180, i64 3
  %1200 = load i8, i8 addrspace(4)* %1199, align 1, !tbaa !8
  %1201 = zext i8 %1200 to i64
  %1202 = shl nuw nsw i64 %1201, 24
  %1203 = or i64 %1198, %1202
  %1204 = getelementptr inbounds i8, i8 addrspace(4)* %1180, i64 4
  %1205 = load i8, i8 addrspace(4)* %1204, align 1, !tbaa !8
  %1206 = zext i8 %1205 to i64
  %1207 = shl nuw nsw i64 %1206, 32
  %1208 = or i64 %1203, %1207
  %1209 = getelementptr inbounds i8, i8 addrspace(4)* %1180, i64 5
  %1210 = load i8, i8 addrspace(4)* %1209, align 1, !tbaa !8
  %1211 = zext i8 %1210 to i64
  %1212 = shl nuw nsw i64 %1211, 40
  %1213 = or i64 %1208, %1212
  %1214 = getelementptr inbounds i8, i8 addrspace(4)* %1180, i64 6
  %1215 = load i8, i8 addrspace(4)* %1214, align 1, !tbaa !8
  %1216 = zext i8 %1215 to i64
  %1217 = shl nuw nsw i64 %1216, 48
  %1218 = or i64 %1213, %1217
  %1219 = getelementptr inbounds i8, i8 addrspace(4)* %1180, i64 7
  %1220 = load i8, i8 addrspace(4)* %1219, align 1, !tbaa !8
  %1221 = zext i8 %1220 to i64
  %1222 = shl nuw i64 %1221, 56
  %1223 = or i64 %1218, %1222
  %1224 = add nsw i32 %1181, -8
  %1225 = getelementptr inbounds i8, i8 addrspace(4)* %1180, i64 8
  br label %1239

1226:                                             ; preds = %1184, %1226
  %1227 = phi i32 [ %1237, %1226 ], [ 0, %1184 ]
  %1228 = phi i64 [ %1236, %1226 ], [ 0, %1184 ]
  %1229 = zext i32 %1227 to i64
  %1230 = getelementptr inbounds i8, i8 addrspace(4)* %1180, i64 %1229
  %1231 = load i8, i8 addrspace(4)* %1230, align 1, !tbaa !8
  %1232 = zext i8 %1231 to i64
  %1233 = shl i32 %1227, 3
  %1234 = zext i32 %1233 to i64
  %1235 = shl nuw i64 %1232, %1234
  %1236 = or i64 %1235, %1228
  %1237 = add nuw nsw i32 %1227, 1
  %1238 = icmp eq i32 %1237, %1181
  br i1 %1238, label %1239, label %1226

1239:                                             ; preds = %1226, %1186, %1184
  %1240 = phi i8 addrspace(4)* [ %1225, %1186 ], [ %1180, %1184 ], [ %1180, %1226 ]
  %1241 = phi i32 [ %1224, %1186 ], [ 0, %1184 ], [ 0, %1226 ]
  %1242 = phi i64 [ %1223, %1186 ], [ 0, %1184 ], [ %1236, %1226 ]
  %1243 = icmp ugt i32 %1241, 7
  br i1 %1243, label %1246, label %1244

1244:                                             ; preds = %1239
  %1245 = icmp eq i32 %1241, 0
  br i1 %1245, label %1299, label %1286

1246:                                             ; preds = %1239
  %1247 = load i8, i8 addrspace(4)* %1240, align 1, !tbaa !8
  %1248 = zext i8 %1247 to i64
  %1249 = getelementptr inbounds i8, i8 addrspace(4)* %1240, i64 1
  %1250 = load i8, i8 addrspace(4)* %1249, align 1, !tbaa !8
  %1251 = zext i8 %1250 to i64
  %1252 = shl nuw nsw i64 %1251, 8
  %1253 = or i64 %1252, %1248
  %1254 = getelementptr inbounds i8, i8 addrspace(4)* %1240, i64 2
  %1255 = load i8, i8 addrspace(4)* %1254, align 1, !tbaa !8
  %1256 = zext i8 %1255 to i64
  %1257 = shl nuw nsw i64 %1256, 16
  %1258 = or i64 %1253, %1257
  %1259 = getelementptr inbounds i8, i8 addrspace(4)* %1240, i64 3
  %1260 = load i8, i8 addrspace(4)* %1259, align 1, !tbaa !8
  %1261 = zext i8 %1260 to i64
  %1262 = shl nuw nsw i64 %1261, 24
  %1263 = or i64 %1258, %1262
  %1264 = getelementptr inbounds i8, i8 addrspace(4)* %1240, i64 4
  %1265 = load i8, i8 addrspace(4)* %1264, align 1, !tbaa !8
  %1266 = zext i8 %1265 to i64
  %1267 = shl nuw nsw i64 %1266, 32
  %1268 = or i64 %1263, %1267
  %1269 = getelementptr inbounds i8, i8 addrspace(4)* %1240, i64 5
  %1270 = load i8, i8 addrspace(4)* %1269, align 1, !tbaa !8
  %1271 = zext i8 %1270 to i64
  %1272 = shl nuw nsw i64 %1271, 40
  %1273 = or i64 %1268, %1272
  %1274 = getelementptr inbounds i8, i8 addrspace(4)* %1240, i64 6
  %1275 = load i8, i8 addrspace(4)* %1274, align 1, !tbaa !8
  %1276 = zext i8 %1275 to i64
  %1277 = shl nuw nsw i64 %1276, 48
  %1278 = or i64 %1273, %1277
  %1279 = getelementptr inbounds i8, i8 addrspace(4)* %1240, i64 7
  %1280 = load i8, i8 addrspace(4)* %1279, align 1, !tbaa !8
  %1281 = zext i8 %1280 to i64
  %1282 = shl nuw i64 %1281, 56
  %1283 = or i64 %1278, %1282
  %1284 = add nsw i32 %1241, -8
  %1285 = getelementptr inbounds i8, i8 addrspace(4)* %1240, i64 8
  br label %1299

1286:                                             ; preds = %1244, %1286
  %1287 = phi i32 [ %1297, %1286 ], [ 0, %1244 ]
  %1288 = phi i64 [ %1296, %1286 ], [ 0, %1244 ]
  %1289 = zext i32 %1287 to i64
  %1290 = getelementptr inbounds i8, i8 addrspace(4)* %1240, i64 %1289
  %1291 = load i8, i8 addrspace(4)* %1290, align 1, !tbaa !8
  %1292 = zext i8 %1291 to i64
  %1293 = shl i32 %1287, 3
  %1294 = zext i32 %1293 to i64
  %1295 = shl nuw i64 %1292, %1294
  %1296 = or i64 %1295, %1288
  %1297 = add nuw nsw i32 %1287, 1
  %1298 = icmp eq i32 %1297, %1241
  br i1 %1298, label %1299, label %1286

1299:                                             ; preds = %1286, %1246, %1244
  %1300 = phi i8 addrspace(4)* [ %1285, %1246 ], [ %1240, %1244 ], [ %1240, %1286 ]
  %1301 = phi i32 [ %1284, %1246 ], [ 0, %1244 ], [ 0, %1286 ]
  %1302 = phi i64 [ %1283, %1246 ], [ 0, %1244 ], [ %1296, %1286 ]
  %1303 = icmp ugt i32 %1301, 7
  br i1 %1303, label %1306, label %1304

1304:                                             ; preds = %1299
  %1305 = icmp eq i32 %1301, 0
  br i1 %1305, label %1357, label %1344

1306:                                             ; preds = %1299
  %1307 = load i8, i8 addrspace(4)* %1300, align 1, !tbaa !8
  %1308 = zext i8 %1307 to i64
  %1309 = getelementptr inbounds i8, i8 addrspace(4)* %1300, i64 1
  %1310 = load i8, i8 addrspace(4)* %1309, align 1, !tbaa !8
  %1311 = zext i8 %1310 to i64
  %1312 = shl nuw nsw i64 %1311, 8
  %1313 = or i64 %1312, %1308
  %1314 = getelementptr inbounds i8, i8 addrspace(4)* %1300, i64 2
  %1315 = load i8, i8 addrspace(4)* %1314, align 1, !tbaa !8
  %1316 = zext i8 %1315 to i64
  %1317 = shl nuw nsw i64 %1316, 16
  %1318 = or i64 %1313, %1317
  %1319 = getelementptr inbounds i8, i8 addrspace(4)* %1300, i64 3
  %1320 = load i8, i8 addrspace(4)* %1319, align 1, !tbaa !8
  %1321 = zext i8 %1320 to i64
  %1322 = shl nuw nsw i64 %1321, 24
  %1323 = or i64 %1318, %1322
  %1324 = getelementptr inbounds i8, i8 addrspace(4)* %1300, i64 4
  %1325 = load i8, i8 addrspace(4)* %1324, align 1, !tbaa !8
  %1326 = zext i8 %1325 to i64
  %1327 = shl nuw nsw i64 %1326, 32
  %1328 = or i64 %1323, %1327
  %1329 = getelementptr inbounds i8, i8 addrspace(4)* %1300, i64 5
  %1330 = load i8, i8 addrspace(4)* %1329, align 1, !tbaa !8
  %1331 = zext i8 %1330 to i64
  %1332 = shl nuw nsw i64 %1331, 40
  %1333 = or i64 %1328, %1332
  %1334 = getelementptr inbounds i8, i8 addrspace(4)* %1300, i64 6
  %1335 = load i8, i8 addrspace(4)* %1334, align 1, !tbaa !8
  %1336 = zext i8 %1335 to i64
  %1337 = shl nuw nsw i64 %1336, 48
  %1338 = or i64 %1333, %1337
  %1339 = getelementptr inbounds i8, i8 addrspace(4)* %1300, i64 7
  %1340 = load i8, i8 addrspace(4)* %1339, align 1, !tbaa !8
  %1341 = zext i8 %1340 to i64
  %1342 = shl nuw i64 %1341, 56
  %1343 = or i64 %1338, %1342
  br label %1357

1344:                                             ; preds = %1304, %1344
  %1345 = phi i32 [ %1355, %1344 ], [ 0, %1304 ]
  %1346 = phi i64 [ %1354, %1344 ], [ 0, %1304 ]
  %1347 = zext i32 %1345 to i64
  %1348 = getelementptr inbounds i8, i8 addrspace(4)* %1300, i64 %1347
  %1349 = load i8, i8 addrspace(4)* %1348, align 1, !tbaa !8
  %1350 = zext i8 %1349 to i64
  %1351 = shl i32 %1345, 3
  %1352 = zext i32 %1351 to i64
  %1353 = shl nuw i64 %1350, %1352
  %1354 = or i64 %1353, %1346
  %1355 = add nuw nsw i32 %1345, 1
  %1356 = icmp eq i32 %1355, %1301
  br i1 %1356, label %1357, label %1344

1357:                                             ; preds = %1344, %1306, %1304
  %1358 = phi i64 [ %1343, %1306 ], [ 0, %1304 ], [ %1354, %1344 ]
  %1359 = shl nuw nsw i64 %940, 2
  %1360 = add nuw nsw i64 %1359, 28
  %1361 = and i64 %1360, 480
  %1362 = and i64 %942, -225
  %1363 = or i64 %1362, %1361
  %1364 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %7, i64 noundef %1363, i64 noundef %1002, i64 noundef %1062, i64 noundef %1122, i64 noundef %1182, i64 noundef %1242, i64 noundef %1302, i64 noundef %1358) #10
  %1365 = sub i64 %932, %940
  %1366 = getelementptr inbounds i8, i8 addrspace(4)* %933, i64 %940
  %1367 = icmp eq i64 %1365, 0
  br i1 %1367, label %1368, label %931

1368:                                             ; preds = %1357, %923
  %1369 = phi <2 x i64> [ %926, %923 ], [ %1364, %1357 ]
  %1370 = zext i16 %920 to i32
  %1371 = mul i32 %1, %1370
  %1372 = add i32 %1371, %462
  %1373 = extractelement <2 x i64> %1369, i64 0
  %1374 = zext i32 %1372 to i64
  %1375 = and i64 %1373, -227
  %1376 = or i64 %1375, 34
  %1377 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %7, i64 noundef %1376, i64 noundef %1374, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr() #2

; Function Attrs: convergent noinline norecurse nounwind optnone
define internal fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %0, i64 noundef %1, i64 noundef %2, i64 noundef %3, i64 noundef %4, i64 noundef %5, i64 noundef %6, i64 noundef %7, i64 noundef %8) unnamed_addr #3 {
  %10 = alloca i8*, align 8, addrspace(5)
  %11 = alloca i32, align 4, addrspace(5)
  %12 = alloca i64, align 8, addrspace(5)
  %13 = alloca i64, align 8, addrspace(5)
  %14 = alloca i64, align 8, addrspace(5)
  %15 = alloca i64, align 8, addrspace(5)
  %16 = alloca i64, align 8, addrspace(5)
  %17 = alloca i64, align 8, addrspace(5)
  %18 = alloca i64, align 8, addrspace(5)
  %19 = alloca i64, align 8, addrspace(5)
  %20 = alloca i32, align 4, addrspace(5)
  %21 = alloca i32, align 4, addrspace(5)
  %22 = alloca %0 addrspace(1)*, align 8, addrspace(5)
  %23 = alloca i64, align 8, addrspace(5)
  %24 = alloca %1 addrspace(1)*, align 8, addrspace(5)
  %25 = alloca %2 addrspace(1)*, align 8, addrspace(5)
  %26 = alloca <2 x i64>, align 16, addrspace(5)
  store i8* %0, i8* addrspace(5)* %10, align 8, !tbaa !14
  store i32 2, i32 addrspace(5)* %11, align 4, !tbaa !16
  store i64 %1, i64 addrspace(5)* %12, align 8, !tbaa !4
  store i64 %2, i64 addrspace(5)* %13, align 8, !tbaa !4
  store i64 %3, i64 addrspace(5)* %14, align 8, !tbaa !4
  store i64 %4, i64 addrspace(5)* %15, align 8, !tbaa !4
  store i64 %5, i64 addrspace(5)* %16, align 8, !tbaa !4
  store i64 %6, i64 addrspace(5)* %17, align 8, !tbaa !4
  store i64 %7, i64 addrspace(5)* %18, align 8, !tbaa !4
  store i64 %8, i64 addrspace(5)* %19, align 8, !tbaa !4
  %27 = bitcast i32 addrspace(5)* %20 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 4, i8 addrspace(5)* %27) #6
  %28 = call i32 @llvm.amdgcn.mbcnt.lo(i32 -1, i32 0)
  %29 = call i32 @llvm.amdgcn.mbcnt.hi(i32 -1, i32 %28)
  store i32 %29, i32 addrspace(5)* %20, align 4, !tbaa !16
  %30 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !16
  %31 = call i32 asm sideeffect "; ockl readfirstlane hoisting hack $0", "=v,0"(i32 %30) #10, !srcloc !18
  store i32 %31, i32 addrspace(5)* %20, align 4, !tbaa !16
  %32 = bitcast i32 addrspace(5)* %21 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 4, i8 addrspace(5)* %32) #6
  %33 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !16
  %34 = call i32 @llvm.amdgcn.readfirstlane(i32 %33)
  store i32 %34, i32 addrspace(5)* %21, align 4, !tbaa !16
  %35 = bitcast %0 addrspace(1)* addrspace(5)* %22 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %35) #6
  %36 = load i8*, i8* addrspace(5)* %10, align 8, !tbaa !14
  %37 = addrspacecast i8* %36 to %0 addrspace(1)*
  store %0 addrspace(1)* %37, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !14
  %38 = bitcast i64 addrspace(5)* %23 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %38) #6
  %39 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !14
  %40 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !16
  %41 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !16
  %42 = icmp eq i32 %40, %41
  br i1 %42, label %43, label %68

43:                                               ; preds = %9
  %44 = getelementptr inbounds %0, %0 addrspace(1)* %39, i64 0, i32 3
  %45 = load atomic i64, i64 addrspace(1)* %44 syncscope("one-as") acquire, align 8
  %46 = getelementptr %0, %0 addrspace(1)* %39, i64 0, i32 0
  %47 = getelementptr %0, %0 addrspace(1)* %39, i64 0, i32 5
  %48 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %46, align 8, !tbaa !19
  %49 = load i64, i64 addrspace(1)* %47, align 8, !tbaa !22
  %50 = and i64 %49, %45
  %51 = getelementptr inbounds %1, %1 addrspace(1)* %48, i64 %50, i32 0
  %52 = load atomic i64, i64 addrspace(1)* %51 syncscope("one-as") monotonic, align 8
  %53 = cmpxchg i64 addrspace(1)* %44, i64 %45, i64 %52 syncscope("one-as") acquire monotonic, align 8
  %54 = extractvalue { i64, i1 } %53, 1
  br i1 %54, label %65, label %55

55:                                               ; preds = %55, %43
  %56 = phi { i64, i1 } [ %63, %55 ], [ %53, %43 ]
  %57 = extractvalue { i64, i1 } %56, 0
  call void @llvm.amdgcn.s.sleep(i32 1)
  %58 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %46, align 8, !tbaa !19
  %59 = load i64, i64 addrspace(1)* %47, align 8, !tbaa !22
  %60 = and i64 %59, %57
  %61 = getelementptr inbounds %1, %1 addrspace(1)* %58, i64 %60, i32 0
  %62 = load atomic i64, i64 addrspace(1)* %61 syncscope("one-as") monotonic, align 8
  %63 = cmpxchg i64 addrspace(1)* %44, i64 %57, i64 %62 syncscope("one-as") acquire monotonic, align 8
  %64 = extractvalue { i64, i1 } %63, 1
  br i1 %64, label %65, label %55

65:                                               ; preds = %55, %43
  %66 = phi { i64, i1 } [ %53, %43 ], [ %63, %55 ]
  %67 = extractvalue { i64, i1 } %66, 0
  br label %68

68:                                               ; preds = %9, %65
  %69 = phi i64 [ %67, %65 ], [ 0, %9 ]
  %70 = trunc i64 %69 to i32
  %71 = lshr i64 %69, 32
  %72 = trunc i64 %71 to i32
  %73 = call i32 @llvm.amdgcn.readfirstlane(i32 %70)
  %74 = call i32 @llvm.amdgcn.readfirstlane(i32 %72)
  %75 = zext i32 %74 to i64
  %76 = shl nuw i64 %75, 32
  %77 = zext i32 %73 to i64
  %78 = or i64 %76, %77
  store i64 %78, i64 addrspace(5)* %23, align 8, !tbaa !4
  %79 = bitcast %1 addrspace(1)* addrspace(5)* %24 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %79) #6
  %80 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !14
  %81 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !4
  %82 = getelementptr %0, %0 addrspace(1)* %80, i64 0, i32 0
  %83 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %82, align 8, !tbaa !19
  %84 = getelementptr %0, %0 addrspace(1)* %80, i64 0, i32 5
  %85 = load i64, i64 addrspace(1)* %84, align 8, !tbaa !22
  %86 = and i64 %81, %85
  %87 = getelementptr inbounds %1, %1 addrspace(1)* %83, i64 %86
  store %1 addrspace(1)* %87, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !14
  %88 = bitcast %2 addrspace(1)* addrspace(5)* %25 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %88) #6
  %89 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !14
  %90 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !4
  %91 = getelementptr %0, %0 addrspace(1)* %89, i64 0, i32 1
  %92 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(1)* %91, align 8, !tbaa !23
  %93 = getelementptr %0, %0 addrspace(1)* %89, i64 0, i32 5
  %94 = load i64, i64 addrspace(1)* %93, align 8, !tbaa !22
  %95 = and i64 %90, %94
  %96 = getelementptr inbounds %2, %2 addrspace(1)* %92, i64 %95
  store %2 addrspace(1)* %96, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !14
  %97 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !14
  %98 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !14
  %99 = load i32, i32 addrspace(5)* %11, align 4, !tbaa !16
  %100 = load i64, i64 addrspace(5)* %12, align 8, !tbaa !4
  %101 = load i64, i64 addrspace(5)* %13, align 8, !tbaa !4
  %102 = load i64, i64 addrspace(5)* %14, align 8, !tbaa !4
  %103 = load i64, i64 addrspace(5)* %15, align 8, !tbaa !4
  %104 = load i64, i64 addrspace(5)* %16, align 8, !tbaa !4
  %105 = load i64, i64 addrspace(5)* %17, align 8, !tbaa !4
  %106 = load i64, i64 addrspace(5)* %18, align 8, !tbaa !4
  %107 = load i64, i64 addrspace(5)* %19, align 8, !tbaa !4
  %108 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !16
  %109 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !16
  %110 = call i64 @llvm.read_register.i64(metadata !24) #11
  %111 = icmp eq i32 %108, %109
  br i1 %111, label %112, label %116

112:                                              ; preds = %68
  %113 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 2
  store i32 %99, i32 addrspace(1)* %113, align 8, !tbaa !25
  %114 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 1
  store i64 %110, i64 addrspace(1)* %114, align 8, !tbaa !27
  %115 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 3
  store i32 1, i32 addrspace(1)* %115, align 4, !tbaa !28
  br label %116

116:                                              ; preds = %68, %112
  %117 = zext i32 %108 to i64
  %118 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 0
  store i64 %100, i64 addrspace(1)* %118, align 8, !tbaa !4
  %119 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 1
  store i64 %101, i64 addrspace(1)* %119, align 8, !tbaa !4
  %120 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 2
  store i64 %102, i64 addrspace(1)* %120, align 8, !tbaa !4
  %121 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 3
  store i64 %103, i64 addrspace(1)* %121, align 8, !tbaa !4
  %122 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 4
  store i64 %104, i64 addrspace(1)* %122, align 8, !tbaa !4
  %123 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 5
  store i64 %105, i64 addrspace(1)* %123, align 8, !tbaa !4
  %124 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 6
  store i64 %106, i64 addrspace(1)* %124, align 8, !tbaa !4
  %125 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 7
  store i64 %107, i64 addrspace(1)* %125, align 8, !tbaa !4
  %126 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !14
  %127 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !4
  %128 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !16
  %129 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !16
  %130 = icmp eq i32 %128, %129
  br i1 %130, label %131, label %163

131:                                              ; preds = %116
  %132 = getelementptr inbounds %0, %0 addrspace(1)* %126, i64 0, i32 4
  %133 = load atomic i64, i64 addrspace(1)* %132 syncscope("one-as") monotonic, align 8
  %134 = getelementptr %0, %0 addrspace(1)* %126, i64 0, i32 0
  %135 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %134, align 8, !tbaa !19
  %136 = getelementptr %0, %0 addrspace(1)* %126, i64 0, i32 5
  %137 = load i64, i64 addrspace(1)* %136, align 8, !tbaa !22
  %138 = and i64 %137, %127
  %139 = getelementptr inbounds %1, %1 addrspace(1)* %135, i64 %138, i32 0
  store i64 %133, i64 addrspace(1)* %139, align 8, !tbaa !29
  %140 = cmpxchg i64 addrspace(1)* %132, i64 %133, i64 %127 syncscope("one-as") release monotonic, align 8
  %141 = extractvalue { i64, i1 } %140, 1
  br i1 %141, label %147, label %142

142:                                              ; preds = %142, %131
  %143 = phi { i64, i1 } [ %145, %142 ], [ %140, %131 ]
  %144 = extractvalue { i64, i1 } %143, 0
  call void @llvm.amdgcn.s.sleep(i32 1)
  store i64 %144, i64 addrspace(1)* %139, align 8, !tbaa !29
  %145 = cmpxchg i64 addrspace(1)* %132, i64 %144, i64 %127 syncscope("one-as") release monotonic, align 8
  %146 = extractvalue { i64, i1 } %145, 1
  br i1 %146, label %147, label %142

147:                                              ; preds = %142, %131
  %148 = getelementptr inbounds %0, %0 addrspace(1)* %126, i64 0, i32 2, i32 0
  %149 = load i64, i64 addrspace(1)* %148, align 8
  %150 = inttoptr i64 %149 to %4 addrspace(1)*
  %151 = getelementptr inbounds %4, %4 addrspace(1)* %150, i64 0, i32 1, i32 0
  %152 = atomicrmw add i64 addrspace(1)* %151, i64 1 syncscope("one-as") release, align 8
  %153 = getelementptr inbounds %4, %4 addrspace(1)* %150, i64 0, i32 2
  %154 = load i64, i64 addrspace(1)* %153, align 16, !tbaa !30
  %155 = icmp eq i64 %154, 0
  br i1 %155, label %163, label %156

156:                                              ; preds = %147
  %157 = inttoptr i64 %154 to i64 addrspace(1)*
  %158 = getelementptr inbounds %4, %4 addrspace(1)* %150, i64 0, i32 3
  %159 = load i32, i32 addrspace(1)* %158, align 8, !tbaa !32
  %160 = zext i32 %159 to i64
  store atomic i64 %160, i64 addrspace(1)* %157 syncscope("one-as") release, align 8
  %161 = call i32 @llvm.amdgcn.readfirstlane(i32 %159)
  %162 = and i32 %161, 255
  call void @llvm.amdgcn.s.sendmsg(i32 1, i32 %162)
  br label %163

163:                                              ; preds = %116, %147, %156
  %164 = bitcast <2 x i64> addrspace(5)* %26 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 16, i8 addrspace(5)* %164) #6
  %165 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !14
  %166 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !14
  %167 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !16
  %168 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !16
  %169 = icmp eq i32 %167, %168
  %170 = getelementptr inbounds %1, %1 addrspace(1)* %165, i64 0, i32 3
  br label %171

171:                                              ; preds = %179, %163
  br i1 %169, label %172, label %175

172:                                              ; preds = %171
  %173 = load atomic i32, i32 addrspace(1)* %170 syncscope("one-as") acquire, align 4
  %174 = and i32 %173, 1
  br label %175

175:                                              ; preds = %172, %171
  %176 = phi i32 [ %174, %172 ], [ 1, %171 ]
  %177 = call i32 @llvm.amdgcn.readfirstlane(i32 %176)
  %178 = icmp eq i32 %177, 0
  br i1 %178, label %180, label %179

179:                                              ; preds = %175
  call void @llvm.amdgcn.s.sleep(i32 1)
  br label %171

180:                                              ; preds = %175
  %181 = zext i32 %167 to i64
  %182 = getelementptr inbounds %2, %2 addrspace(1)* %166, i64 0, i32 0, i64 %181, i64 0
  %183 = getelementptr inbounds %2, %2 addrspace(1)* %166, i64 0, i32 0, i64 %181, i64 1
  %184 = load i64, i64 addrspace(1)* %182, align 8, !tbaa !4
  %185 = load i64, i64 addrspace(1)* %183, align 8, !tbaa !4
  %186 = insertelement <2 x i64> undef, i64 %184, i64 0
  %187 = insertelement <2 x i64> %186, i64 %185, i64 1
  store <2 x i64> %187, <2 x i64> addrspace(5)* %26, align 16, !tbaa !8
  %188 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !14
  %189 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !4
  %190 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !16
  %191 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !16
  %192 = icmp eq i32 %190, %191
  br i1 %192, label %193, label %213

193:                                              ; preds = %180
  %194 = getelementptr inbounds %0, %0 addrspace(1)* %188, i64 0, i32 5
  %195 = load i64, i64 addrspace(1)* %194, align 8, !tbaa !22
  %196 = add i64 %195, 1
  %197 = add i64 %196, %189
  %198 = icmp eq i64 %197, 0
  %199 = select i1 %198, i64 %196, i64 %197
  %200 = getelementptr inbounds %0, %0 addrspace(1)* %188, i64 0, i32 3
  %201 = load atomic i64, i64 addrspace(1)* %200 syncscope("one-as") monotonic, align 8
  %202 = getelementptr %0, %0 addrspace(1)* %188, i64 0, i32 0
  %203 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %202, align 8, !tbaa !19
  %204 = and i64 %199, %195
  %205 = getelementptr inbounds %1, %1 addrspace(1)* %203, i64 %204, i32 0
  store i64 %201, i64 addrspace(1)* %205, align 8, !tbaa !29
  %206 = cmpxchg i64 addrspace(1)* %200, i64 %201, i64 %199 syncscope("one-as") release monotonic, align 8
  %207 = extractvalue { i64, i1 } %206, 1
  br i1 %207, label %213, label %208

208:                                              ; preds = %208, %193
  %209 = phi { i64, i1 } [ %211, %208 ], [ %206, %193 ]
  %210 = extractvalue { i64, i1 } %209, 0
  call void @llvm.amdgcn.s.sleep(i32 1)
  store i64 %210, i64 addrspace(1)* %205, align 8, !tbaa !29
  %211 = cmpxchg i64 addrspace(1)* %200, i64 %210, i64 %199 syncscope("one-as") release monotonic, align 8
  %212 = extractvalue { i64, i1 } %211, 1
  br i1 %212, label %213, label %208

213:                                              ; preds = %180, %193, %208
  %214 = load <2 x i64>, <2 x i64> addrspace(5)* %26, align 16, !tbaa !8
  %215 = bitcast <2 x i64> addrspace(5)* %26 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 16, i8 addrspace(5)* %215) #6
  %216 = bitcast %2 addrspace(1)* addrspace(5)* %25 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 8, i8 addrspace(5)* %216) #6
  %217 = bitcast %1 addrspace(1)* addrspace(5)* %24 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 8, i8 addrspace(5)* %217) #6
  %218 = bitcast i64 addrspace(5)* %23 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 8, i8 addrspace(5)* %218) #6
  %219 = bitcast %0 addrspace(1)* addrspace(5)* %22 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 8, i8 addrspace(5)* %219) #6
  %220 = bitcast i32 addrspace(5)* %21 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 4, i8 addrspace(5)* %220) #6
  %221 = bitcast i32 addrspace(5)* %20 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 4, i8 addrspace(5)* %221) #6
  ret <2 x i64> %214
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare i32 @llvm.amdgcn.readfirstlane(i32) #4

; Function Attrs: mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.sleep(i32 immarg) #5

; Function Attrs: nounwind
declare void @llvm.amdgcn.s.sendmsg(i32 immarg, i32) #6

; Function Attrs: nofree nounwind readonly
declare i64 @llvm.read_register.i64(metadata) #7

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare i32 @llvm.amdgcn.mbcnt.lo(i32, i32) #8

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare i32 @llvm.amdgcn.mbcnt.hi(i32, i32) #8

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.umin.i64(i64, i64) #9

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { argmemonly mustprogress nocallback nofree nosync nounwind willreturn }
attributes #1 = { convergent norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { convergent noinline norecurse nounwind optnone "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+16-bit-insts,+add-no-carry-insts,+aperture-regs,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+ds-src2-insts,+enable-ds128,+enable-prt-strict-null,+extended-image-insts,+fast-denormal-f32,+fast-fmaf,+flat-address-space,+flat-for-global,+flat-global-insts,+flat-inst-offsets,+flat-scratch-insts,+fma-mix-insts,+fp64,+gcn3-encoding,+gfx7-gfx8-gfx9-insts,+gfx8-insts,+gfx9,+gfx9-insts,+half-rate-64-ops,+image-gather4-d16-bug,+image-insts,+int-clamp-insts,+inv-2pi-inline-imm,+ldsbankcount32,+load-store-opt,+localmemorysize65536,+mad-mac-f32-insts,+negative-scratch-offset-bug,+promote-alloca,+r128-a16,+s-memrealtime,+s-memtime-inst,+scalar-atomics,+scalar-flat-scratch-insts,+scalar-stores,+sdwa,+sdwa-omod,+sdwa-scalar,+sdwa-sdst,+sramecc,+sramecc-support,+trap-handler,+unaligned-access-mode,+unaligned-buffer-access,+unaligned-ds-access,+vgpr-index-mode,+vop3p,-wavefrontsize16,-wavefrontsize32,+wavefrontsize64,+xnack-support" }
attributes #4 = { convergent mustprogress nofree nounwind readnone willreturn }
attributes #5 = { mustprogress nounwind willreturn }
attributes #6 = { nounwind }
attributes #7 = { nofree nounwind readonly }
attributes #8 = { mustprogress nofree nosync nounwind readnone willreturn }
attributes #9 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #10 = { convergent nounwind }
attributes #11 = { convergent }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"long", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = !{!6, !6, i64 0}
!9 = distinct !{!9, !10}
!10 = !{!"llvm.loop.unroll.disable"}
!11 = !{i32 0, i32 1024}
!12 = !{i16 1, i16 1025}
!13 = !{}
!14 = !{!15, !15, i64 0}
!15 = !{!"any pointer", !6, i64 0}
!16 = !{!17, !17, i64 0}
!17 = !{!"int", !6, i64 0}
!18 = !{i64 2662}
!19 = !{!20, !15, i64 0}
!20 = !{!"", !15, i64 0, !15, i64 8, !21, i64 16, !5, i64 24, !5, i64 32, !5, i64 40}
!21 = !{!"hsa_signal_s", !5, i64 0}
!22 = !{!20, !5, i64 40}
!23 = !{!20, !15, i64 8}
!24 = !{!"exec"}
!25 = !{!26, !17, i64 16}
!26 = !{!"", !5, i64 0, !5, i64 8, !17, i64 16, !17, i64 20}
!27 = !{!26, !5, i64 8}
!28 = !{!26, !17, i64 20}
!29 = !{!26, !5, i64 0}
!30 = !{!31, !5, i64 16}
!31 = !{!"amd_signal_s", !5, i64 0, !6, i64 8, !5, i64 16, !17, i64 24, !17, i64 28, !5, i64 32, !5, i64 40, !6, i64 48, !6, i64 56}
!32 = !{!31, !17, i64 24}
