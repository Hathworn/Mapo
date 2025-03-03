; ModuleID = '../data/hip_kernels/7222/14/main.cu'
source_filename = "../data/hip_kernels/7222/14/main.cu"
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

@.str = private unnamed_addr addrspace(4) constant [16 x i8] c"\0AGPU Error: %f\0A\00", align 1

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: convergent norecurse nounwind
define protected amdgpu_kernel void @_Z6updatePdS_S_S_S_S_S_(double addrspace(1)* nocapture %0, double addrspace(1)* nocapture %1, double addrspace(1)* nocapture %2, double addrspace(1)* nocapture %3, double addrspace(1)* nocapture %4, double addrspace(1)* nocapture %5, double addrspace(1)* nocapture %6) local_unnamed_addr #1 {
  %8 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %9 = icmp ult i32 %8, 20
  %10 = zext i32 %8 to i64
  br i1 %9, label %11, label %26

11:                                               ; preds = %7
  %12 = getelementptr inbounds double, double addrspace(1)* %3, i64 %10
  %13 = load double, double addrspace(1)* %12, align 8, !tbaa !5, !amdgpu.noclobber !9
  %14 = fmul contract double %13, 5.000000e-01
  %15 = fdiv contract double %14, 5.500000e+01
  %16 = getelementptr inbounds double, double addrspace(1)* %0, i64 %10
  %17 = load double, double addrspace(1)* %16, align 8, !tbaa !5, !amdgpu.noclobber !9
  %18 = fsub contract double %17, %15
  store double %18, double addrspace(1)* %16, align 8, !tbaa !5
  store double 0.000000e+00, double addrspace(1)* %12, align 8, !tbaa !5
  %19 = getelementptr inbounds double, double addrspace(1)* %4, i64 %10
  %20 = load double, double addrspace(1)* %19, align 8, !tbaa !5
  %21 = fmul contract double %20, 5.000000e-01
  %22 = fdiv contract double %21, 5.500000e+01
  %23 = getelementptr inbounds double, double addrspace(1)* %1, i64 %10
  %24 = load double, double addrspace(1)* %23, align 8, !tbaa !5
  %25 = fsub contract double %24, %22
  store double %25, double addrspace(1)* %23, align 8, !tbaa !5
  store double 0.000000e+00, double addrspace(1)* %19, align 8, !tbaa !5
  br label %26

26:                                               ; preds = %7, %11
  %27 = phi double addrspace(1)* [ %5, %11 ], [ %4, %7 ]
  %28 = phi double addrspace(1)* [ %2, %11 ], [ %1, %7 ]
  %29 = getelementptr inbounds double, double addrspace(1)* %27, i64 %10
  %30 = load double, double addrspace(1)* %29, align 8, !tbaa !5
  %31 = fmul contract double %30, 5.000000e-01
  %32 = fdiv contract double %31, 5.500000e+01
  %33 = getelementptr inbounds double, double addrspace(1)* %28, i64 %10
  %34 = load double, double addrspace(1)* %33, align 8, !tbaa !5
  %35 = fsub contract double %34, %32
  store double %35, double addrspace(1)* %33, align 8, !tbaa !5
  store double 0.000000e+00, double addrspace(1)* %29, align 8, !tbaa !5
  %36 = icmp eq i32 %8, 0
  br i1 %36, label %37, label %501

37:                                               ; preds = %26
  %38 = load double, double addrspace(1)* %6, align 8, !tbaa !5
  %39 = fmul contract double %38, 1.000000e+02
  %40 = fdiv contract double %39, 5.500000e+01
  store double %40, double addrspace(1)* %6, align 8, !tbaa !5
  %41 = tail call i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr()
  %42 = getelementptr inbounds i8, i8 addrspace(4)* %41, i64 24
  %43 = bitcast i8 addrspace(4)* %42 to i64 addrspace(4)*
  %44 = load i64, i64 addrspace(4)* %43, align 8, !tbaa !10
  %45 = inttoptr i64 %44 to i8 addrspace(1)*
  %46 = addrspacecast i8 addrspace(1)* %45 to i8*
  %47 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %46, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %48 = extractelement <2 x i64> %47, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([16 x i8], [16 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), label %49, label %53

49:                                               ; preds = %37
  %50 = and i64 %48, -225
  %51 = or i64 %50, 32
  %52 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %46, i64 noundef %51, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  br label %494

53:                                               ; preds = %37
  %54 = and i64 %48, 2
  %55 = and i64 %48, -3
  %56 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %55, i64 0
  br label %57

57:                                               ; preds = %483, %53
  %58 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([16 x i8], [16 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([16 x i8], [16 x i8] addrspace(4)* @.str, i64 0, i64 15) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([16 x i8]* addrspacecast ([16 x i8] addrspace(4)* @.str to [16 x i8]*) to i64)), i64 1))), %53 ], [ %491, %483 ]
  %59 = phi i8 addrspace(4)* [ getelementptr inbounds ([16 x i8], [16 x i8] addrspace(4)* @.str, i64 0, i64 0), %53 ], [ %492, %483 ]
  %60 = phi <2 x i64> [ %56, %53 ], [ %490, %483 ]
  %61 = icmp ugt i64 %58, 56
  %62 = extractelement <2 x i64> %60, i64 0
  %63 = or i64 %62, %54
  %64 = insertelement <2 x i64> poison, i64 %63, i64 0
  %65 = select i1 %61, <2 x i64> %60, <2 x i64> %64
  %66 = tail call i64 @llvm.umin.i64(i64 %58, i64 56)
  %67 = trunc i64 %66 to i32
  %68 = extractelement <2 x i64> %65, i64 0
  %69 = icmp ugt i32 %67, 7
  br i1 %69, label %72, label %70

70:                                               ; preds = %57
  %71 = icmp eq i32 %67, 0
  br i1 %71, label %125, label %112

72:                                               ; preds = %57
  %73 = load i8, i8 addrspace(4)* %59, align 1, !tbaa !14
  %74 = zext i8 %73 to i64
  %75 = getelementptr inbounds i8, i8 addrspace(4)* %59, i64 1
  %76 = load i8, i8 addrspace(4)* %75, align 1, !tbaa !14
  %77 = zext i8 %76 to i64
  %78 = shl nuw nsw i64 %77, 8
  %79 = or i64 %78, %74
  %80 = getelementptr inbounds i8, i8 addrspace(4)* %59, i64 2
  %81 = load i8, i8 addrspace(4)* %80, align 1, !tbaa !14
  %82 = zext i8 %81 to i64
  %83 = shl nuw nsw i64 %82, 16
  %84 = or i64 %79, %83
  %85 = getelementptr inbounds i8, i8 addrspace(4)* %59, i64 3
  %86 = load i8, i8 addrspace(4)* %85, align 1, !tbaa !14
  %87 = zext i8 %86 to i64
  %88 = shl nuw nsw i64 %87, 24
  %89 = or i64 %84, %88
  %90 = getelementptr inbounds i8, i8 addrspace(4)* %59, i64 4
  %91 = load i8, i8 addrspace(4)* %90, align 1, !tbaa !14
  %92 = zext i8 %91 to i64
  %93 = shl nuw nsw i64 %92, 32
  %94 = or i64 %89, %93
  %95 = getelementptr inbounds i8, i8 addrspace(4)* %59, i64 5
  %96 = load i8, i8 addrspace(4)* %95, align 1, !tbaa !14
  %97 = zext i8 %96 to i64
  %98 = shl nuw nsw i64 %97, 40
  %99 = or i64 %94, %98
  %100 = getelementptr inbounds i8, i8 addrspace(4)* %59, i64 6
  %101 = load i8, i8 addrspace(4)* %100, align 1, !tbaa !14
  %102 = zext i8 %101 to i64
  %103 = shl nuw nsw i64 %102, 48
  %104 = or i64 %99, %103
  %105 = getelementptr inbounds i8, i8 addrspace(4)* %59, i64 7
  %106 = load i8, i8 addrspace(4)* %105, align 1, !tbaa !14
  %107 = zext i8 %106 to i64
  %108 = shl nuw i64 %107, 56
  %109 = or i64 %104, %108
  %110 = add nsw i32 %67, -8
  %111 = getelementptr inbounds i8, i8 addrspace(4)* %59, i64 8
  br label %125

112:                                              ; preds = %70, %112
  %113 = phi i32 [ %123, %112 ], [ 0, %70 ]
  %114 = phi i64 [ %122, %112 ], [ 0, %70 ]
  %115 = zext i32 %113 to i64
  %116 = getelementptr inbounds i8, i8 addrspace(4)* %59, i64 %115
  %117 = load i8, i8 addrspace(4)* %116, align 1, !tbaa !14
  %118 = zext i8 %117 to i64
  %119 = shl i32 %113, 3
  %120 = zext i32 %119 to i64
  %121 = shl nuw i64 %118, %120
  %122 = or i64 %121, %114
  %123 = add nuw nsw i32 %113, 1
  %124 = icmp eq i32 %123, %67
  br i1 %124, label %125, label %112, !llvm.loop !15

125:                                              ; preds = %112, %72, %70
  %126 = phi i8 addrspace(4)* [ %111, %72 ], [ %59, %70 ], [ %59, %112 ]
  %127 = phi i32 [ %110, %72 ], [ 0, %70 ], [ 0, %112 ]
  %128 = phi i64 [ %109, %72 ], [ 0, %70 ], [ %122, %112 ]
  %129 = icmp ugt i32 %127, 7
  br i1 %129, label %132, label %130

130:                                              ; preds = %125
  %131 = icmp eq i32 %127, 0
  br i1 %131, label %185, label %172

132:                                              ; preds = %125
  %133 = load i8, i8 addrspace(4)* %126, align 1, !tbaa !14
  %134 = zext i8 %133 to i64
  %135 = getelementptr inbounds i8, i8 addrspace(4)* %126, i64 1
  %136 = load i8, i8 addrspace(4)* %135, align 1, !tbaa !14
  %137 = zext i8 %136 to i64
  %138 = shl nuw nsw i64 %137, 8
  %139 = or i64 %138, %134
  %140 = getelementptr inbounds i8, i8 addrspace(4)* %126, i64 2
  %141 = load i8, i8 addrspace(4)* %140, align 1, !tbaa !14
  %142 = zext i8 %141 to i64
  %143 = shl nuw nsw i64 %142, 16
  %144 = or i64 %139, %143
  %145 = getelementptr inbounds i8, i8 addrspace(4)* %126, i64 3
  %146 = load i8, i8 addrspace(4)* %145, align 1, !tbaa !14
  %147 = zext i8 %146 to i64
  %148 = shl nuw nsw i64 %147, 24
  %149 = or i64 %144, %148
  %150 = getelementptr inbounds i8, i8 addrspace(4)* %126, i64 4
  %151 = load i8, i8 addrspace(4)* %150, align 1, !tbaa !14
  %152 = zext i8 %151 to i64
  %153 = shl nuw nsw i64 %152, 32
  %154 = or i64 %149, %153
  %155 = getelementptr inbounds i8, i8 addrspace(4)* %126, i64 5
  %156 = load i8, i8 addrspace(4)* %155, align 1, !tbaa !14
  %157 = zext i8 %156 to i64
  %158 = shl nuw nsw i64 %157, 40
  %159 = or i64 %154, %158
  %160 = getelementptr inbounds i8, i8 addrspace(4)* %126, i64 6
  %161 = load i8, i8 addrspace(4)* %160, align 1, !tbaa !14
  %162 = zext i8 %161 to i64
  %163 = shl nuw nsw i64 %162, 48
  %164 = or i64 %159, %163
  %165 = getelementptr inbounds i8, i8 addrspace(4)* %126, i64 7
  %166 = load i8, i8 addrspace(4)* %165, align 1, !tbaa !14
  %167 = zext i8 %166 to i64
  %168 = shl nuw i64 %167, 56
  %169 = or i64 %164, %168
  %170 = add nsw i32 %127, -8
  %171 = getelementptr inbounds i8, i8 addrspace(4)* %126, i64 8
  br label %185

172:                                              ; preds = %130, %172
  %173 = phi i32 [ %183, %172 ], [ 0, %130 ]
  %174 = phi i64 [ %182, %172 ], [ 0, %130 ]
  %175 = zext i32 %173 to i64
  %176 = getelementptr inbounds i8, i8 addrspace(4)* %126, i64 %175
  %177 = load i8, i8 addrspace(4)* %176, align 1, !tbaa !14
  %178 = zext i8 %177 to i64
  %179 = shl i32 %173, 3
  %180 = zext i32 %179 to i64
  %181 = shl nuw i64 %178, %180
  %182 = or i64 %181, %174
  %183 = add nuw nsw i32 %173, 1
  %184 = icmp eq i32 %183, %127
  br i1 %184, label %185, label %172

185:                                              ; preds = %172, %132, %130
  %186 = phi i8 addrspace(4)* [ %171, %132 ], [ %126, %130 ], [ %126, %172 ]
  %187 = phi i32 [ %170, %132 ], [ 0, %130 ], [ 0, %172 ]
  %188 = phi i64 [ %169, %132 ], [ 0, %130 ], [ %182, %172 ]
  %189 = icmp ugt i32 %187, 7
  br i1 %189, label %192, label %190

190:                                              ; preds = %185
  %191 = icmp eq i32 %187, 0
  br i1 %191, label %245, label %232

192:                                              ; preds = %185
  %193 = load i8, i8 addrspace(4)* %186, align 1, !tbaa !14
  %194 = zext i8 %193 to i64
  %195 = getelementptr inbounds i8, i8 addrspace(4)* %186, i64 1
  %196 = load i8, i8 addrspace(4)* %195, align 1, !tbaa !14
  %197 = zext i8 %196 to i64
  %198 = shl nuw nsw i64 %197, 8
  %199 = or i64 %198, %194
  %200 = getelementptr inbounds i8, i8 addrspace(4)* %186, i64 2
  %201 = load i8, i8 addrspace(4)* %200, align 1, !tbaa !14
  %202 = zext i8 %201 to i64
  %203 = shl nuw nsw i64 %202, 16
  %204 = or i64 %199, %203
  %205 = getelementptr inbounds i8, i8 addrspace(4)* %186, i64 3
  %206 = load i8, i8 addrspace(4)* %205, align 1, !tbaa !14
  %207 = zext i8 %206 to i64
  %208 = shl nuw nsw i64 %207, 24
  %209 = or i64 %204, %208
  %210 = getelementptr inbounds i8, i8 addrspace(4)* %186, i64 4
  %211 = load i8, i8 addrspace(4)* %210, align 1, !tbaa !14
  %212 = zext i8 %211 to i64
  %213 = shl nuw nsw i64 %212, 32
  %214 = or i64 %209, %213
  %215 = getelementptr inbounds i8, i8 addrspace(4)* %186, i64 5
  %216 = load i8, i8 addrspace(4)* %215, align 1, !tbaa !14
  %217 = zext i8 %216 to i64
  %218 = shl nuw nsw i64 %217, 40
  %219 = or i64 %214, %218
  %220 = getelementptr inbounds i8, i8 addrspace(4)* %186, i64 6
  %221 = load i8, i8 addrspace(4)* %220, align 1, !tbaa !14
  %222 = zext i8 %221 to i64
  %223 = shl nuw nsw i64 %222, 48
  %224 = or i64 %219, %223
  %225 = getelementptr inbounds i8, i8 addrspace(4)* %186, i64 7
  %226 = load i8, i8 addrspace(4)* %225, align 1, !tbaa !14
  %227 = zext i8 %226 to i64
  %228 = shl nuw i64 %227, 56
  %229 = or i64 %224, %228
  %230 = add nsw i32 %187, -8
  %231 = getelementptr inbounds i8, i8 addrspace(4)* %186, i64 8
  br label %245

232:                                              ; preds = %190, %232
  %233 = phi i32 [ %243, %232 ], [ 0, %190 ]
  %234 = phi i64 [ %242, %232 ], [ 0, %190 ]
  %235 = zext i32 %233 to i64
  %236 = getelementptr inbounds i8, i8 addrspace(4)* %186, i64 %235
  %237 = load i8, i8 addrspace(4)* %236, align 1, !tbaa !14
  %238 = zext i8 %237 to i64
  %239 = shl i32 %233, 3
  %240 = zext i32 %239 to i64
  %241 = shl nuw i64 %238, %240
  %242 = or i64 %241, %234
  %243 = add nuw nsw i32 %233, 1
  %244 = icmp eq i32 %243, %187
  br i1 %244, label %245, label %232

245:                                              ; preds = %232, %192, %190
  %246 = phi i8 addrspace(4)* [ %231, %192 ], [ %186, %190 ], [ %186, %232 ]
  %247 = phi i32 [ %230, %192 ], [ 0, %190 ], [ 0, %232 ]
  %248 = phi i64 [ %229, %192 ], [ 0, %190 ], [ %242, %232 ]
  %249 = icmp ugt i32 %247, 7
  br i1 %249, label %252, label %250

250:                                              ; preds = %245
  %251 = icmp eq i32 %247, 0
  br i1 %251, label %305, label %292

252:                                              ; preds = %245
  %253 = load i8, i8 addrspace(4)* %246, align 1, !tbaa !14
  %254 = zext i8 %253 to i64
  %255 = getelementptr inbounds i8, i8 addrspace(4)* %246, i64 1
  %256 = load i8, i8 addrspace(4)* %255, align 1, !tbaa !14
  %257 = zext i8 %256 to i64
  %258 = shl nuw nsw i64 %257, 8
  %259 = or i64 %258, %254
  %260 = getelementptr inbounds i8, i8 addrspace(4)* %246, i64 2
  %261 = load i8, i8 addrspace(4)* %260, align 1, !tbaa !14
  %262 = zext i8 %261 to i64
  %263 = shl nuw nsw i64 %262, 16
  %264 = or i64 %259, %263
  %265 = getelementptr inbounds i8, i8 addrspace(4)* %246, i64 3
  %266 = load i8, i8 addrspace(4)* %265, align 1, !tbaa !14
  %267 = zext i8 %266 to i64
  %268 = shl nuw nsw i64 %267, 24
  %269 = or i64 %264, %268
  %270 = getelementptr inbounds i8, i8 addrspace(4)* %246, i64 4
  %271 = load i8, i8 addrspace(4)* %270, align 1, !tbaa !14
  %272 = zext i8 %271 to i64
  %273 = shl nuw nsw i64 %272, 32
  %274 = or i64 %269, %273
  %275 = getelementptr inbounds i8, i8 addrspace(4)* %246, i64 5
  %276 = load i8, i8 addrspace(4)* %275, align 1, !tbaa !14
  %277 = zext i8 %276 to i64
  %278 = shl nuw nsw i64 %277, 40
  %279 = or i64 %274, %278
  %280 = getelementptr inbounds i8, i8 addrspace(4)* %246, i64 6
  %281 = load i8, i8 addrspace(4)* %280, align 1, !tbaa !14
  %282 = zext i8 %281 to i64
  %283 = shl nuw nsw i64 %282, 48
  %284 = or i64 %279, %283
  %285 = getelementptr inbounds i8, i8 addrspace(4)* %246, i64 7
  %286 = load i8, i8 addrspace(4)* %285, align 1, !tbaa !14
  %287 = zext i8 %286 to i64
  %288 = shl nuw i64 %287, 56
  %289 = or i64 %284, %288
  %290 = add nsw i32 %247, -8
  %291 = getelementptr inbounds i8, i8 addrspace(4)* %246, i64 8
  br label %305

292:                                              ; preds = %250, %292
  %293 = phi i32 [ %303, %292 ], [ 0, %250 ]
  %294 = phi i64 [ %302, %292 ], [ 0, %250 ]
  %295 = zext i32 %293 to i64
  %296 = getelementptr inbounds i8, i8 addrspace(4)* %246, i64 %295
  %297 = load i8, i8 addrspace(4)* %296, align 1, !tbaa !14
  %298 = zext i8 %297 to i64
  %299 = shl i32 %293, 3
  %300 = zext i32 %299 to i64
  %301 = shl nuw i64 %298, %300
  %302 = or i64 %301, %294
  %303 = add nuw nsw i32 %293, 1
  %304 = icmp eq i32 %303, %247
  br i1 %304, label %305, label %292

305:                                              ; preds = %292, %252, %250
  %306 = phi i8 addrspace(4)* [ %291, %252 ], [ %246, %250 ], [ %246, %292 ]
  %307 = phi i32 [ %290, %252 ], [ 0, %250 ], [ 0, %292 ]
  %308 = phi i64 [ %289, %252 ], [ 0, %250 ], [ %302, %292 ]
  %309 = icmp ugt i32 %307, 7
  br i1 %309, label %312, label %310

310:                                              ; preds = %305
  %311 = icmp eq i32 %307, 0
  br i1 %311, label %365, label %352

312:                                              ; preds = %305
  %313 = load i8, i8 addrspace(4)* %306, align 1, !tbaa !14
  %314 = zext i8 %313 to i64
  %315 = getelementptr inbounds i8, i8 addrspace(4)* %306, i64 1
  %316 = load i8, i8 addrspace(4)* %315, align 1, !tbaa !14
  %317 = zext i8 %316 to i64
  %318 = shl nuw nsw i64 %317, 8
  %319 = or i64 %318, %314
  %320 = getelementptr inbounds i8, i8 addrspace(4)* %306, i64 2
  %321 = load i8, i8 addrspace(4)* %320, align 1, !tbaa !14
  %322 = zext i8 %321 to i64
  %323 = shl nuw nsw i64 %322, 16
  %324 = or i64 %319, %323
  %325 = getelementptr inbounds i8, i8 addrspace(4)* %306, i64 3
  %326 = load i8, i8 addrspace(4)* %325, align 1, !tbaa !14
  %327 = zext i8 %326 to i64
  %328 = shl nuw nsw i64 %327, 24
  %329 = or i64 %324, %328
  %330 = getelementptr inbounds i8, i8 addrspace(4)* %306, i64 4
  %331 = load i8, i8 addrspace(4)* %330, align 1, !tbaa !14
  %332 = zext i8 %331 to i64
  %333 = shl nuw nsw i64 %332, 32
  %334 = or i64 %329, %333
  %335 = getelementptr inbounds i8, i8 addrspace(4)* %306, i64 5
  %336 = load i8, i8 addrspace(4)* %335, align 1, !tbaa !14
  %337 = zext i8 %336 to i64
  %338 = shl nuw nsw i64 %337, 40
  %339 = or i64 %334, %338
  %340 = getelementptr inbounds i8, i8 addrspace(4)* %306, i64 6
  %341 = load i8, i8 addrspace(4)* %340, align 1, !tbaa !14
  %342 = zext i8 %341 to i64
  %343 = shl nuw nsw i64 %342, 48
  %344 = or i64 %339, %343
  %345 = getelementptr inbounds i8, i8 addrspace(4)* %306, i64 7
  %346 = load i8, i8 addrspace(4)* %345, align 1, !tbaa !14
  %347 = zext i8 %346 to i64
  %348 = shl nuw i64 %347, 56
  %349 = or i64 %344, %348
  %350 = add nsw i32 %307, -8
  %351 = getelementptr inbounds i8, i8 addrspace(4)* %306, i64 8
  br label %365

352:                                              ; preds = %310, %352
  %353 = phi i32 [ %363, %352 ], [ 0, %310 ]
  %354 = phi i64 [ %362, %352 ], [ 0, %310 ]
  %355 = zext i32 %353 to i64
  %356 = getelementptr inbounds i8, i8 addrspace(4)* %306, i64 %355
  %357 = load i8, i8 addrspace(4)* %356, align 1, !tbaa !14
  %358 = zext i8 %357 to i64
  %359 = shl i32 %353, 3
  %360 = zext i32 %359 to i64
  %361 = shl nuw i64 %358, %360
  %362 = or i64 %361, %354
  %363 = add nuw nsw i32 %353, 1
  %364 = icmp eq i32 %363, %307
  br i1 %364, label %365, label %352

365:                                              ; preds = %352, %312, %310
  %366 = phi i8 addrspace(4)* [ %351, %312 ], [ %306, %310 ], [ %306, %352 ]
  %367 = phi i32 [ %350, %312 ], [ 0, %310 ], [ 0, %352 ]
  %368 = phi i64 [ %349, %312 ], [ 0, %310 ], [ %362, %352 ]
  %369 = icmp ugt i32 %367, 7
  br i1 %369, label %372, label %370

370:                                              ; preds = %365
  %371 = icmp eq i32 %367, 0
  br i1 %371, label %425, label %412

372:                                              ; preds = %365
  %373 = load i8, i8 addrspace(4)* %366, align 1, !tbaa !14
  %374 = zext i8 %373 to i64
  %375 = getelementptr inbounds i8, i8 addrspace(4)* %366, i64 1
  %376 = load i8, i8 addrspace(4)* %375, align 1, !tbaa !14
  %377 = zext i8 %376 to i64
  %378 = shl nuw nsw i64 %377, 8
  %379 = or i64 %378, %374
  %380 = getelementptr inbounds i8, i8 addrspace(4)* %366, i64 2
  %381 = load i8, i8 addrspace(4)* %380, align 1, !tbaa !14
  %382 = zext i8 %381 to i64
  %383 = shl nuw nsw i64 %382, 16
  %384 = or i64 %379, %383
  %385 = getelementptr inbounds i8, i8 addrspace(4)* %366, i64 3
  %386 = load i8, i8 addrspace(4)* %385, align 1, !tbaa !14
  %387 = zext i8 %386 to i64
  %388 = shl nuw nsw i64 %387, 24
  %389 = or i64 %384, %388
  %390 = getelementptr inbounds i8, i8 addrspace(4)* %366, i64 4
  %391 = load i8, i8 addrspace(4)* %390, align 1, !tbaa !14
  %392 = zext i8 %391 to i64
  %393 = shl nuw nsw i64 %392, 32
  %394 = or i64 %389, %393
  %395 = getelementptr inbounds i8, i8 addrspace(4)* %366, i64 5
  %396 = load i8, i8 addrspace(4)* %395, align 1, !tbaa !14
  %397 = zext i8 %396 to i64
  %398 = shl nuw nsw i64 %397, 40
  %399 = or i64 %394, %398
  %400 = getelementptr inbounds i8, i8 addrspace(4)* %366, i64 6
  %401 = load i8, i8 addrspace(4)* %400, align 1, !tbaa !14
  %402 = zext i8 %401 to i64
  %403 = shl nuw nsw i64 %402, 48
  %404 = or i64 %399, %403
  %405 = getelementptr inbounds i8, i8 addrspace(4)* %366, i64 7
  %406 = load i8, i8 addrspace(4)* %405, align 1, !tbaa !14
  %407 = zext i8 %406 to i64
  %408 = shl nuw i64 %407, 56
  %409 = or i64 %404, %408
  %410 = add nsw i32 %367, -8
  %411 = getelementptr inbounds i8, i8 addrspace(4)* %366, i64 8
  br label %425

412:                                              ; preds = %370, %412
  %413 = phi i32 [ %423, %412 ], [ 0, %370 ]
  %414 = phi i64 [ %422, %412 ], [ 0, %370 ]
  %415 = zext i32 %413 to i64
  %416 = getelementptr inbounds i8, i8 addrspace(4)* %366, i64 %415
  %417 = load i8, i8 addrspace(4)* %416, align 1, !tbaa !14
  %418 = zext i8 %417 to i64
  %419 = shl i32 %413, 3
  %420 = zext i32 %419 to i64
  %421 = shl nuw i64 %418, %420
  %422 = or i64 %421, %414
  %423 = add nuw nsw i32 %413, 1
  %424 = icmp eq i32 %423, %367
  br i1 %424, label %425, label %412

425:                                              ; preds = %412, %372, %370
  %426 = phi i8 addrspace(4)* [ %411, %372 ], [ %366, %370 ], [ %366, %412 ]
  %427 = phi i32 [ %410, %372 ], [ 0, %370 ], [ 0, %412 ]
  %428 = phi i64 [ %409, %372 ], [ 0, %370 ], [ %422, %412 ]
  %429 = icmp ugt i32 %427, 7
  br i1 %429, label %432, label %430

430:                                              ; preds = %425
  %431 = icmp eq i32 %427, 0
  br i1 %431, label %483, label %470

432:                                              ; preds = %425
  %433 = load i8, i8 addrspace(4)* %426, align 1, !tbaa !14
  %434 = zext i8 %433 to i64
  %435 = getelementptr inbounds i8, i8 addrspace(4)* %426, i64 1
  %436 = load i8, i8 addrspace(4)* %435, align 1, !tbaa !14
  %437 = zext i8 %436 to i64
  %438 = shl nuw nsw i64 %437, 8
  %439 = or i64 %438, %434
  %440 = getelementptr inbounds i8, i8 addrspace(4)* %426, i64 2
  %441 = load i8, i8 addrspace(4)* %440, align 1, !tbaa !14
  %442 = zext i8 %441 to i64
  %443 = shl nuw nsw i64 %442, 16
  %444 = or i64 %439, %443
  %445 = getelementptr inbounds i8, i8 addrspace(4)* %426, i64 3
  %446 = load i8, i8 addrspace(4)* %445, align 1, !tbaa !14
  %447 = zext i8 %446 to i64
  %448 = shl nuw nsw i64 %447, 24
  %449 = or i64 %444, %448
  %450 = getelementptr inbounds i8, i8 addrspace(4)* %426, i64 4
  %451 = load i8, i8 addrspace(4)* %450, align 1, !tbaa !14
  %452 = zext i8 %451 to i64
  %453 = shl nuw nsw i64 %452, 32
  %454 = or i64 %449, %453
  %455 = getelementptr inbounds i8, i8 addrspace(4)* %426, i64 5
  %456 = load i8, i8 addrspace(4)* %455, align 1, !tbaa !14
  %457 = zext i8 %456 to i64
  %458 = shl nuw nsw i64 %457, 40
  %459 = or i64 %454, %458
  %460 = getelementptr inbounds i8, i8 addrspace(4)* %426, i64 6
  %461 = load i8, i8 addrspace(4)* %460, align 1, !tbaa !14
  %462 = zext i8 %461 to i64
  %463 = shl nuw nsw i64 %462, 48
  %464 = or i64 %459, %463
  %465 = getelementptr inbounds i8, i8 addrspace(4)* %426, i64 7
  %466 = load i8, i8 addrspace(4)* %465, align 1, !tbaa !14
  %467 = zext i8 %466 to i64
  %468 = shl nuw i64 %467, 56
  %469 = or i64 %464, %468
  br label %483

470:                                              ; preds = %430, %470
  %471 = phi i32 [ %481, %470 ], [ 0, %430 ]
  %472 = phi i64 [ %480, %470 ], [ 0, %430 ]
  %473 = zext i32 %471 to i64
  %474 = getelementptr inbounds i8, i8 addrspace(4)* %426, i64 %473
  %475 = load i8, i8 addrspace(4)* %474, align 1, !tbaa !14
  %476 = zext i8 %475 to i64
  %477 = shl i32 %471, 3
  %478 = zext i32 %477 to i64
  %479 = shl nuw i64 %476, %478
  %480 = or i64 %479, %472
  %481 = add nuw nsw i32 %471, 1
  %482 = icmp eq i32 %481, %427
  br i1 %482, label %483, label %470

483:                                              ; preds = %470, %432, %430
  %484 = phi i64 [ %469, %432 ], [ 0, %430 ], [ %480, %470 ]
  %485 = shl nuw nsw i64 %66, 2
  %486 = add nuw nsw i64 %485, 28
  %487 = and i64 %486, 480
  %488 = and i64 %68, -225
  %489 = or i64 %488, %487
  %490 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %46, i64 noundef %489, i64 noundef %128, i64 noundef %188, i64 noundef %248, i64 noundef %308, i64 noundef %368, i64 noundef %428, i64 noundef %484) #10
  %491 = sub i64 %58, %66
  %492 = getelementptr inbounds i8, i8 addrspace(4)* %59, i64 %66
  %493 = icmp eq i64 %491, 0
  br i1 %493, label %494, label %57

494:                                              ; preds = %483, %49
  %495 = phi <2 x i64> [ %52, %49 ], [ %490, %483 ]
  %496 = extractelement <2 x i64> %495, i64 0
  %497 = bitcast double %40 to i64
  %498 = and i64 %496, -227
  %499 = or i64 %498, 34
  %500 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %46, i64 noundef %499, i64 noundef %497, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  store double 0.000000e+00, double addrspace(1)* %6, align 8, !tbaa !5
  br label %501

501:                                              ; preds = %494, %26
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
  store i8* %0, i8* addrspace(5)* %10, align 8, !tbaa !17
  store i32 2, i32 addrspace(5)* %11, align 4, !tbaa !19
  store i64 %1, i64 addrspace(5)* %12, align 8, !tbaa !10
  store i64 %2, i64 addrspace(5)* %13, align 8, !tbaa !10
  store i64 %3, i64 addrspace(5)* %14, align 8, !tbaa !10
  store i64 %4, i64 addrspace(5)* %15, align 8, !tbaa !10
  store i64 %5, i64 addrspace(5)* %16, align 8, !tbaa !10
  store i64 %6, i64 addrspace(5)* %17, align 8, !tbaa !10
  store i64 %7, i64 addrspace(5)* %18, align 8, !tbaa !10
  store i64 %8, i64 addrspace(5)* %19, align 8, !tbaa !10
  %27 = bitcast i32 addrspace(5)* %20 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 4, i8 addrspace(5)* %27) #6
  %28 = call i32 @llvm.amdgcn.mbcnt.lo(i32 -1, i32 0)
  %29 = call i32 @llvm.amdgcn.mbcnt.hi(i32 -1, i32 %28)
  store i32 %29, i32 addrspace(5)* %20, align 4, !tbaa !19
  %30 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !19
  %31 = call i32 asm sideeffect "; ockl readfirstlane hoisting hack $0", "=v,0"(i32 %30) #10, !srcloc !21
  store i32 %31, i32 addrspace(5)* %20, align 4, !tbaa !19
  %32 = bitcast i32 addrspace(5)* %21 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 4, i8 addrspace(5)* %32) #6
  %33 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !19
  %34 = call i32 @llvm.amdgcn.readfirstlane(i32 %33)
  store i32 %34, i32 addrspace(5)* %21, align 4, !tbaa !19
  %35 = bitcast %0 addrspace(1)* addrspace(5)* %22 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %35) #6
  %36 = load i8*, i8* addrspace(5)* %10, align 8, !tbaa !17
  %37 = addrspacecast i8* %36 to %0 addrspace(1)*
  store %0 addrspace(1)* %37, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !17
  %38 = bitcast i64 addrspace(5)* %23 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %38) #6
  %39 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !17
  %40 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !19
  %41 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !19
  %42 = icmp eq i32 %40, %41
  br i1 %42, label %43, label %68

43:                                               ; preds = %9
  %44 = getelementptr inbounds %0, %0 addrspace(1)* %39, i64 0, i32 3
  %45 = load atomic i64, i64 addrspace(1)* %44 syncscope("one-as") acquire, align 8
  %46 = getelementptr %0, %0 addrspace(1)* %39, i64 0, i32 0
  %47 = getelementptr %0, %0 addrspace(1)* %39, i64 0, i32 5
  %48 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %46, align 8, !tbaa !22
  %49 = load i64, i64 addrspace(1)* %47, align 8, !tbaa !25
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
  %58 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %46, align 8, !tbaa !22
  %59 = load i64, i64 addrspace(1)* %47, align 8, !tbaa !25
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
  store i64 %78, i64 addrspace(5)* %23, align 8, !tbaa !10
  %79 = bitcast %1 addrspace(1)* addrspace(5)* %24 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %79) #6
  %80 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !17
  %81 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !10
  %82 = getelementptr %0, %0 addrspace(1)* %80, i64 0, i32 0
  %83 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %82, align 8, !tbaa !22
  %84 = getelementptr %0, %0 addrspace(1)* %80, i64 0, i32 5
  %85 = load i64, i64 addrspace(1)* %84, align 8, !tbaa !25
  %86 = and i64 %81, %85
  %87 = getelementptr inbounds %1, %1 addrspace(1)* %83, i64 %86
  store %1 addrspace(1)* %87, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !17
  %88 = bitcast %2 addrspace(1)* addrspace(5)* %25 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %88) #6
  %89 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !17
  %90 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !10
  %91 = getelementptr %0, %0 addrspace(1)* %89, i64 0, i32 1
  %92 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(1)* %91, align 8, !tbaa !26
  %93 = getelementptr %0, %0 addrspace(1)* %89, i64 0, i32 5
  %94 = load i64, i64 addrspace(1)* %93, align 8, !tbaa !25
  %95 = and i64 %90, %94
  %96 = getelementptr inbounds %2, %2 addrspace(1)* %92, i64 %95
  store %2 addrspace(1)* %96, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !17
  %97 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !17
  %98 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !17
  %99 = load i32, i32 addrspace(5)* %11, align 4, !tbaa !19
  %100 = load i64, i64 addrspace(5)* %12, align 8, !tbaa !10
  %101 = load i64, i64 addrspace(5)* %13, align 8, !tbaa !10
  %102 = load i64, i64 addrspace(5)* %14, align 8, !tbaa !10
  %103 = load i64, i64 addrspace(5)* %15, align 8, !tbaa !10
  %104 = load i64, i64 addrspace(5)* %16, align 8, !tbaa !10
  %105 = load i64, i64 addrspace(5)* %17, align 8, !tbaa !10
  %106 = load i64, i64 addrspace(5)* %18, align 8, !tbaa !10
  %107 = load i64, i64 addrspace(5)* %19, align 8, !tbaa !10
  %108 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !19
  %109 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !19
  %110 = call i64 @llvm.read_register.i64(metadata !27) #11
  %111 = icmp eq i32 %108, %109
  br i1 %111, label %112, label %116

112:                                              ; preds = %68
  %113 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 2
  store i32 %99, i32 addrspace(1)* %113, align 8, !tbaa !28
  %114 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 1
  store i64 %110, i64 addrspace(1)* %114, align 8, !tbaa !30
  %115 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 3
  store i32 1, i32 addrspace(1)* %115, align 4, !tbaa !31
  br label %116

116:                                              ; preds = %68, %112
  %117 = zext i32 %108 to i64
  %118 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 0
  store i64 %100, i64 addrspace(1)* %118, align 8, !tbaa !10
  %119 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 1
  store i64 %101, i64 addrspace(1)* %119, align 8, !tbaa !10
  %120 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 2
  store i64 %102, i64 addrspace(1)* %120, align 8, !tbaa !10
  %121 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 3
  store i64 %103, i64 addrspace(1)* %121, align 8, !tbaa !10
  %122 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 4
  store i64 %104, i64 addrspace(1)* %122, align 8, !tbaa !10
  %123 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 5
  store i64 %105, i64 addrspace(1)* %123, align 8, !tbaa !10
  %124 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 6
  store i64 %106, i64 addrspace(1)* %124, align 8, !tbaa !10
  %125 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 7
  store i64 %107, i64 addrspace(1)* %125, align 8, !tbaa !10
  %126 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !17
  %127 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !10
  %128 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !19
  %129 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !19
  %130 = icmp eq i32 %128, %129
  br i1 %130, label %131, label %163

131:                                              ; preds = %116
  %132 = getelementptr inbounds %0, %0 addrspace(1)* %126, i64 0, i32 4
  %133 = load atomic i64, i64 addrspace(1)* %132 syncscope("one-as") monotonic, align 8
  %134 = getelementptr %0, %0 addrspace(1)* %126, i64 0, i32 0
  %135 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %134, align 8, !tbaa !22
  %136 = getelementptr %0, %0 addrspace(1)* %126, i64 0, i32 5
  %137 = load i64, i64 addrspace(1)* %136, align 8, !tbaa !25
  %138 = and i64 %137, %127
  %139 = getelementptr inbounds %1, %1 addrspace(1)* %135, i64 %138, i32 0
  store i64 %133, i64 addrspace(1)* %139, align 8, !tbaa !32
  %140 = cmpxchg i64 addrspace(1)* %132, i64 %133, i64 %127 syncscope("one-as") release monotonic, align 8
  %141 = extractvalue { i64, i1 } %140, 1
  br i1 %141, label %147, label %142

142:                                              ; preds = %142, %131
  %143 = phi { i64, i1 } [ %145, %142 ], [ %140, %131 ]
  %144 = extractvalue { i64, i1 } %143, 0
  call void @llvm.amdgcn.s.sleep(i32 1)
  store i64 %144, i64 addrspace(1)* %139, align 8, !tbaa !32
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
  %154 = load i64, i64 addrspace(1)* %153, align 16, !tbaa !33
  %155 = icmp eq i64 %154, 0
  br i1 %155, label %163, label %156

156:                                              ; preds = %147
  %157 = inttoptr i64 %154 to i64 addrspace(1)*
  %158 = getelementptr inbounds %4, %4 addrspace(1)* %150, i64 0, i32 3
  %159 = load i32, i32 addrspace(1)* %158, align 8, !tbaa !35
  %160 = zext i32 %159 to i64
  store atomic i64 %160, i64 addrspace(1)* %157 syncscope("one-as") release, align 8
  %161 = call i32 @llvm.amdgcn.readfirstlane(i32 %159)
  %162 = and i32 %161, 255
  call void @llvm.amdgcn.s.sendmsg(i32 1, i32 %162)
  br label %163

163:                                              ; preds = %116, %147, %156
  %164 = bitcast <2 x i64> addrspace(5)* %26 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 16, i8 addrspace(5)* %164) #6
  %165 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !17
  %166 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !17
  %167 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !19
  %168 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !19
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
  %184 = load i64, i64 addrspace(1)* %182, align 8, !tbaa !10
  %185 = load i64, i64 addrspace(1)* %183, align 8, !tbaa !10
  %186 = insertelement <2 x i64> undef, i64 %184, i64 0
  %187 = insertelement <2 x i64> %186, i64 %185, i64 1
  store <2 x i64> %187, <2 x i64> addrspace(5)* %26, align 16, !tbaa !14
  %188 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !17
  %189 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !10
  %190 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !19
  %191 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !19
  %192 = icmp eq i32 %190, %191
  br i1 %192, label %193, label %213

193:                                              ; preds = %180
  %194 = getelementptr inbounds %0, %0 addrspace(1)* %188, i64 0, i32 5
  %195 = load i64, i64 addrspace(1)* %194, align 8, !tbaa !25
  %196 = add i64 %195, 1
  %197 = add i64 %196, %189
  %198 = icmp eq i64 %197, 0
  %199 = select i1 %198, i64 %196, i64 %197
  %200 = getelementptr inbounds %0, %0 addrspace(1)* %188, i64 0, i32 3
  %201 = load atomic i64, i64 addrspace(1)* %200 syncscope("one-as") monotonic, align 8
  %202 = getelementptr %0, %0 addrspace(1)* %188, i64 0, i32 0
  %203 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %202, align 8, !tbaa !22
  %204 = and i64 %199, %195
  %205 = getelementptr inbounds %1, %1 addrspace(1)* %203, i64 %204, i32 0
  store i64 %201, i64 addrspace(1)* %205, align 8, !tbaa !32
  %206 = cmpxchg i64 addrspace(1)* %200, i64 %201, i64 %199 syncscope("one-as") release monotonic, align 8
  %207 = extractvalue { i64, i1 } %206, 1
  br i1 %207, label %213, label %208

208:                                              ; preds = %208, %193
  %209 = phi { i64, i1 } [ %211, %208 ], [ %206, %193 ]
  %210 = extractvalue { i64, i1 } %209, 0
  call void @llvm.amdgcn.s.sleep(i32 1)
  store i64 %210, i64 addrspace(1)* %205, align 8, !tbaa !32
  %211 = cmpxchg i64 addrspace(1)* %200, i64 %210, i64 %199 syncscope("one-as") release monotonic, align 8
  %212 = extractvalue { i64, i1 } %211, 1
  br i1 %212, label %213, label %208

213:                                              ; preds = %180, %193, %208
  %214 = load <2 x i64>, <2 x i64> addrspace(5)* %26, align 16, !tbaa !14
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
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"double", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
!10 = !{!11, !11, i64 0}
!11 = !{!"long", !12, i64 0}
!12 = !{!"omnipotent char", !13, i64 0}
!13 = !{!"Simple C/C++ TBAA"}
!14 = !{!12, !12, i64 0}
!15 = distinct !{!15, !16}
!16 = !{!"llvm.loop.unroll.disable"}
!17 = !{!18, !18, i64 0}
!18 = !{!"any pointer", !12, i64 0}
!19 = !{!20, !20, i64 0}
!20 = !{!"int", !12, i64 0}
!21 = !{i64 2662}
!22 = !{!23, !18, i64 0}
!23 = !{!"", !18, i64 0, !18, i64 8, !24, i64 16, !11, i64 24, !11, i64 32, !11, i64 40}
!24 = !{!"hsa_signal_s", !11, i64 0}
!25 = !{!23, !11, i64 40}
!26 = !{!23, !18, i64 8}
!27 = !{!"exec"}
!28 = !{!29, !20, i64 16}
!29 = !{!"", !11, i64 0, !11, i64 8, !20, i64 16, !20, i64 20}
!30 = !{!29, !11, i64 8}
!31 = !{!29, !20, i64 20}
!32 = !{!29, !11, i64 0}
!33 = !{!34, !11, i64 16}
!34 = !{!"amd_signal_s", !11, i64 0, !12, i64 8, !11, i64 16, !20, i64 24, !20, i64 28, !11, i64 32, !11, i64 40, !12, i64 48, !12, i64 56}
!35 = !{!34, !20, i64 24}
