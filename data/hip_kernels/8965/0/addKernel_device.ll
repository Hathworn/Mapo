; ModuleID = '../data/hip_kernels/8965/0/main.cu'
source_filename = "../data/hip_kernels/8965/0/main.cu"
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

@seme = external hidden local_unnamed_addr addrspace(3) global [0 x i32], align 4
@.str = private unnamed_addr addrspace(4) constant [24 x i8] c"seme[d] * seme [d] %d \0A\00", align 1
@.str.1 = private unnamed_addr addrspace(4) constant [20 x i8] c"\E7\BB\99 seme \E8\B5\8B\E5\80\BC %d \00", align 1
@.str.2 = private unnamed_addr addrspace(4) constant [21 x i8] c"c[1] += seme[d] %d \0A\00", align 1
@.str.3 = private unnamed_addr addrspace(4) constant [21 x i8] c"c[2] *= seme[d] %d \0A\00", align 1

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: convergent norecurse nounwind
define protected amdgpu_kernel void @_Z9addKernelPiPKi(i32 addrspace(1)* nocapture %0, i32 addrspace(1)* nocapture readonly %1) local_unnamed_addr #1 {
  %3 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %4 = zext i32 %3 to i64
  %5 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %4
  %6 = load i32, i32 addrspace(1)* %5, align 4, !tbaa !5, !amdgpu.noclobber !9
  %7 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @seme, i32 0, i32 %3
  store i32 %6, i32 addrspace(3)* %7, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  switch i32 %3, label %8239 [
    i32 0, label %20
    i32 1, label %8
    i32 2, label %18
  ]

8:                                                ; preds = %2
  %9 = tail call i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr()
  %10 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 1
  store i32 0, i32 addrspace(1)* %10, align 4, !tbaa !5
  %11 = getelementptr inbounds i8, i8 addrspace(4)* %9, i64 24
  %12 = bitcast i8 addrspace(4)* %11 to i64 addrspace(4)*
  %13 = load i64, i64 addrspace(4)* %12, align 8, !tbaa !10
  %14 = inttoptr i64 %13 to i8 addrspace(1)*
  %15 = addrspacecast i8 addrspace(1)* %14 to i8*
  %16 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %15, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %17 = extractelement <2 x i64> %16, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([21 x i8], [21 x i8] addrspace(4)* @.str.2, i64 0, i64 0) to i8*), i8* null), label %2765, label %2769

18:                                               ; preds = %2
  %19 = tail call i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr()
  br label %5497

20:                                               ; preds = %2
  store i32 0, i32 addrspace(1)* %0, align 4, !tbaa !5
  %21 = tail call i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr()
  %22 = getelementptr inbounds i8, i8 addrspace(4)* %21, i64 24
  %23 = bitcast i8 addrspace(4)* %22 to i64 addrspace(4)*
  %24 = load i64, i64 addrspace(4)* %23, align 8, !tbaa !10
  %25 = inttoptr i64 %24 to i8 addrspace(1)*
  %26 = addrspacecast i8 addrspace(1)* %25 to i8*
  %27 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %26, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %28 = extractelement <2 x i64> %27, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([24 x i8], [24 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), label %29, label %33

29:                                               ; preds = %20
  %30 = and i64 %28, -225
  %31 = or i64 %30, 32
  %32 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %26, i64 noundef %31, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  br label %474

33:                                               ; preds = %20
  %34 = and i64 %28, 2
  %35 = and i64 %28, -3
  %36 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %35, i64 0
  br label %37

37:                                               ; preds = %463, %33
  %38 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([24 x i8], [24 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([24 x i8], [24 x i8] addrspace(4)* @.str, i64 0, i64 23) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([24 x i8]* addrspacecast ([24 x i8] addrspace(4)* @.str to [24 x i8]*) to i64)), i64 1))), %33 ], [ %471, %463 ]
  %39 = phi i8 addrspace(4)* [ getelementptr inbounds ([24 x i8], [24 x i8] addrspace(4)* @.str, i64 0, i64 0), %33 ], [ %472, %463 ]
  %40 = phi <2 x i64> [ %36, %33 ], [ %470, %463 ]
  %41 = icmp ugt i64 %38, 56
  %42 = extractelement <2 x i64> %40, i64 0
  %43 = or i64 %42, %34
  %44 = insertelement <2 x i64> poison, i64 %43, i64 0
  %45 = select i1 %41, <2 x i64> %40, <2 x i64> %44
  %46 = tail call i64 @llvm.umin.i64(i64 %38, i64 56)
  %47 = trunc i64 %46 to i32
  %48 = extractelement <2 x i64> %45, i64 0
  %49 = icmp ugt i32 %47, 7
  br i1 %49, label %52, label %50

50:                                               ; preds = %37
  %51 = icmp eq i32 %47, 0
  br i1 %51, label %105, label %92

52:                                               ; preds = %37
  %53 = load i8, i8 addrspace(4)* %39, align 1, !tbaa !14
  %54 = zext i8 %53 to i64
  %55 = getelementptr inbounds i8, i8 addrspace(4)* %39, i64 1
  %56 = load i8, i8 addrspace(4)* %55, align 1, !tbaa !14
  %57 = zext i8 %56 to i64
  %58 = shl nuw nsw i64 %57, 8
  %59 = or i64 %58, %54
  %60 = getelementptr inbounds i8, i8 addrspace(4)* %39, i64 2
  %61 = load i8, i8 addrspace(4)* %60, align 1, !tbaa !14
  %62 = zext i8 %61 to i64
  %63 = shl nuw nsw i64 %62, 16
  %64 = or i64 %59, %63
  %65 = getelementptr inbounds i8, i8 addrspace(4)* %39, i64 3
  %66 = load i8, i8 addrspace(4)* %65, align 1, !tbaa !14
  %67 = zext i8 %66 to i64
  %68 = shl nuw nsw i64 %67, 24
  %69 = or i64 %64, %68
  %70 = getelementptr inbounds i8, i8 addrspace(4)* %39, i64 4
  %71 = load i8, i8 addrspace(4)* %70, align 1, !tbaa !14
  %72 = zext i8 %71 to i64
  %73 = shl nuw nsw i64 %72, 32
  %74 = or i64 %69, %73
  %75 = getelementptr inbounds i8, i8 addrspace(4)* %39, i64 5
  %76 = load i8, i8 addrspace(4)* %75, align 1, !tbaa !14
  %77 = zext i8 %76 to i64
  %78 = shl nuw nsw i64 %77, 40
  %79 = or i64 %74, %78
  %80 = getelementptr inbounds i8, i8 addrspace(4)* %39, i64 6
  %81 = load i8, i8 addrspace(4)* %80, align 1, !tbaa !14
  %82 = zext i8 %81 to i64
  %83 = shl nuw nsw i64 %82, 48
  %84 = or i64 %79, %83
  %85 = getelementptr inbounds i8, i8 addrspace(4)* %39, i64 7
  %86 = load i8, i8 addrspace(4)* %85, align 1, !tbaa !14
  %87 = zext i8 %86 to i64
  %88 = shl nuw i64 %87, 56
  %89 = or i64 %84, %88
  %90 = add nsw i32 %47, -8
  %91 = getelementptr inbounds i8, i8 addrspace(4)* %39, i64 8
  br label %105

92:                                               ; preds = %50, %92
  %93 = phi i32 [ %103, %92 ], [ 0, %50 ]
  %94 = phi i64 [ %102, %92 ], [ 0, %50 ]
  %95 = zext i32 %93 to i64
  %96 = getelementptr inbounds i8, i8 addrspace(4)* %39, i64 %95
  %97 = load i8, i8 addrspace(4)* %96, align 1, !tbaa !14
  %98 = zext i8 %97 to i64
  %99 = shl i32 %93, 3
  %100 = zext i32 %99 to i64
  %101 = shl nuw i64 %98, %100
  %102 = or i64 %101, %94
  %103 = add nuw nsw i32 %93, 1
  %104 = icmp eq i32 %103, %47
  br i1 %104, label %105, label %92, !llvm.loop !15

105:                                              ; preds = %92, %52, %50
  %106 = phi i8 addrspace(4)* [ %91, %52 ], [ %39, %50 ], [ %39, %92 ]
  %107 = phi i32 [ %90, %52 ], [ 0, %50 ], [ 0, %92 ]
  %108 = phi i64 [ %89, %52 ], [ 0, %50 ], [ %102, %92 ]
  %109 = icmp ugt i32 %107, 7
  br i1 %109, label %112, label %110

110:                                              ; preds = %105
  %111 = icmp eq i32 %107, 0
  br i1 %111, label %165, label %152

112:                                              ; preds = %105
  %113 = load i8, i8 addrspace(4)* %106, align 1, !tbaa !14
  %114 = zext i8 %113 to i64
  %115 = getelementptr inbounds i8, i8 addrspace(4)* %106, i64 1
  %116 = load i8, i8 addrspace(4)* %115, align 1, !tbaa !14
  %117 = zext i8 %116 to i64
  %118 = shl nuw nsw i64 %117, 8
  %119 = or i64 %118, %114
  %120 = getelementptr inbounds i8, i8 addrspace(4)* %106, i64 2
  %121 = load i8, i8 addrspace(4)* %120, align 1, !tbaa !14
  %122 = zext i8 %121 to i64
  %123 = shl nuw nsw i64 %122, 16
  %124 = or i64 %119, %123
  %125 = getelementptr inbounds i8, i8 addrspace(4)* %106, i64 3
  %126 = load i8, i8 addrspace(4)* %125, align 1, !tbaa !14
  %127 = zext i8 %126 to i64
  %128 = shl nuw nsw i64 %127, 24
  %129 = or i64 %124, %128
  %130 = getelementptr inbounds i8, i8 addrspace(4)* %106, i64 4
  %131 = load i8, i8 addrspace(4)* %130, align 1, !tbaa !14
  %132 = zext i8 %131 to i64
  %133 = shl nuw nsw i64 %132, 32
  %134 = or i64 %129, %133
  %135 = getelementptr inbounds i8, i8 addrspace(4)* %106, i64 5
  %136 = load i8, i8 addrspace(4)* %135, align 1, !tbaa !14
  %137 = zext i8 %136 to i64
  %138 = shl nuw nsw i64 %137, 40
  %139 = or i64 %134, %138
  %140 = getelementptr inbounds i8, i8 addrspace(4)* %106, i64 6
  %141 = load i8, i8 addrspace(4)* %140, align 1, !tbaa !14
  %142 = zext i8 %141 to i64
  %143 = shl nuw nsw i64 %142, 48
  %144 = or i64 %139, %143
  %145 = getelementptr inbounds i8, i8 addrspace(4)* %106, i64 7
  %146 = load i8, i8 addrspace(4)* %145, align 1, !tbaa !14
  %147 = zext i8 %146 to i64
  %148 = shl nuw i64 %147, 56
  %149 = or i64 %144, %148
  %150 = add nsw i32 %107, -8
  %151 = getelementptr inbounds i8, i8 addrspace(4)* %106, i64 8
  br label %165

152:                                              ; preds = %110, %152
  %153 = phi i32 [ %163, %152 ], [ 0, %110 ]
  %154 = phi i64 [ %162, %152 ], [ 0, %110 ]
  %155 = zext i32 %153 to i64
  %156 = getelementptr inbounds i8, i8 addrspace(4)* %106, i64 %155
  %157 = load i8, i8 addrspace(4)* %156, align 1, !tbaa !14
  %158 = zext i8 %157 to i64
  %159 = shl i32 %153, 3
  %160 = zext i32 %159 to i64
  %161 = shl nuw i64 %158, %160
  %162 = or i64 %161, %154
  %163 = add nuw nsw i32 %153, 1
  %164 = icmp eq i32 %163, %107
  br i1 %164, label %165, label %152

165:                                              ; preds = %152, %112, %110
  %166 = phi i8 addrspace(4)* [ %151, %112 ], [ %106, %110 ], [ %106, %152 ]
  %167 = phi i32 [ %150, %112 ], [ 0, %110 ], [ 0, %152 ]
  %168 = phi i64 [ %149, %112 ], [ 0, %110 ], [ %162, %152 ]
  %169 = icmp ugt i32 %167, 7
  br i1 %169, label %172, label %170

170:                                              ; preds = %165
  %171 = icmp eq i32 %167, 0
  br i1 %171, label %225, label %212

172:                                              ; preds = %165
  %173 = load i8, i8 addrspace(4)* %166, align 1, !tbaa !14
  %174 = zext i8 %173 to i64
  %175 = getelementptr inbounds i8, i8 addrspace(4)* %166, i64 1
  %176 = load i8, i8 addrspace(4)* %175, align 1, !tbaa !14
  %177 = zext i8 %176 to i64
  %178 = shl nuw nsw i64 %177, 8
  %179 = or i64 %178, %174
  %180 = getelementptr inbounds i8, i8 addrspace(4)* %166, i64 2
  %181 = load i8, i8 addrspace(4)* %180, align 1, !tbaa !14
  %182 = zext i8 %181 to i64
  %183 = shl nuw nsw i64 %182, 16
  %184 = or i64 %179, %183
  %185 = getelementptr inbounds i8, i8 addrspace(4)* %166, i64 3
  %186 = load i8, i8 addrspace(4)* %185, align 1, !tbaa !14
  %187 = zext i8 %186 to i64
  %188 = shl nuw nsw i64 %187, 24
  %189 = or i64 %184, %188
  %190 = getelementptr inbounds i8, i8 addrspace(4)* %166, i64 4
  %191 = load i8, i8 addrspace(4)* %190, align 1, !tbaa !14
  %192 = zext i8 %191 to i64
  %193 = shl nuw nsw i64 %192, 32
  %194 = or i64 %189, %193
  %195 = getelementptr inbounds i8, i8 addrspace(4)* %166, i64 5
  %196 = load i8, i8 addrspace(4)* %195, align 1, !tbaa !14
  %197 = zext i8 %196 to i64
  %198 = shl nuw nsw i64 %197, 40
  %199 = or i64 %194, %198
  %200 = getelementptr inbounds i8, i8 addrspace(4)* %166, i64 6
  %201 = load i8, i8 addrspace(4)* %200, align 1, !tbaa !14
  %202 = zext i8 %201 to i64
  %203 = shl nuw nsw i64 %202, 48
  %204 = or i64 %199, %203
  %205 = getelementptr inbounds i8, i8 addrspace(4)* %166, i64 7
  %206 = load i8, i8 addrspace(4)* %205, align 1, !tbaa !14
  %207 = zext i8 %206 to i64
  %208 = shl nuw i64 %207, 56
  %209 = or i64 %204, %208
  %210 = add nsw i32 %167, -8
  %211 = getelementptr inbounds i8, i8 addrspace(4)* %166, i64 8
  br label %225

212:                                              ; preds = %170, %212
  %213 = phi i32 [ %223, %212 ], [ 0, %170 ]
  %214 = phi i64 [ %222, %212 ], [ 0, %170 ]
  %215 = zext i32 %213 to i64
  %216 = getelementptr inbounds i8, i8 addrspace(4)* %166, i64 %215
  %217 = load i8, i8 addrspace(4)* %216, align 1, !tbaa !14
  %218 = zext i8 %217 to i64
  %219 = shl i32 %213, 3
  %220 = zext i32 %219 to i64
  %221 = shl nuw i64 %218, %220
  %222 = or i64 %221, %214
  %223 = add nuw nsw i32 %213, 1
  %224 = icmp eq i32 %223, %167
  br i1 %224, label %225, label %212

225:                                              ; preds = %212, %172, %170
  %226 = phi i8 addrspace(4)* [ %211, %172 ], [ %166, %170 ], [ %166, %212 ]
  %227 = phi i32 [ %210, %172 ], [ 0, %170 ], [ 0, %212 ]
  %228 = phi i64 [ %209, %172 ], [ 0, %170 ], [ %222, %212 ]
  %229 = icmp ugt i32 %227, 7
  br i1 %229, label %232, label %230

230:                                              ; preds = %225
  %231 = icmp eq i32 %227, 0
  br i1 %231, label %285, label %272

232:                                              ; preds = %225
  %233 = load i8, i8 addrspace(4)* %226, align 1, !tbaa !14
  %234 = zext i8 %233 to i64
  %235 = getelementptr inbounds i8, i8 addrspace(4)* %226, i64 1
  %236 = load i8, i8 addrspace(4)* %235, align 1, !tbaa !14
  %237 = zext i8 %236 to i64
  %238 = shl nuw nsw i64 %237, 8
  %239 = or i64 %238, %234
  %240 = getelementptr inbounds i8, i8 addrspace(4)* %226, i64 2
  %241 = load i8, i8 addrspace(4)* %240, align 1, !tbaa !14
  %242 = zext i8 %241 to i64
  %243 = shl nuw nsw i64 %242, 16
  %244 = or i64 %239, %243
  %245 = getelementptr inbounds i8, i8 addrspace(4)* %226, i64 3
  %246 = load i8, i8 addrspace(4)* %245, align 1, !tbaa !14
  %247 = zext i8 %246 to i64
  %248 = shl nuw nsw i64 %247, 24
  %249 = or i64 %244, %248
  %250 = getelementptr inbounds i8, i8 addrspace(4)* %226, i64 4
  %251 = load i8, i8 addrspace(4)* %250, align 1, !tbaa !14
  %252 = zext i8 %251 to i64
  %253 = shl nuw nsw i64 %252, 32
  %254 = or i64 %249, %253
  %255 = getelementptr inbounds i8, i8 addrspace(4)* %226, i64 5
  %256 = load i8, i8 addrspace(4)* %255, align 1, !tbaa !14
  %257 = zext i8 %256 to i64
  %258 = shl nuw nsw i64 %257, 40
  %259 = or i64 %254, %258
  %260 = getelementptr inbounds i8, i8 addrspace(4)* %226, i64 6
  %261 = load i8, i8 addrspace(4)* %260, align 1, !tbaa !14
  %262 = zext i8 %261 to i64
  %263 = shl nuw nsw i64 %262, 48
  %264 = or i64 %259, %263
  %265 = getelementptr inbounds i8, i8 addrspace(4)* %226, i64 7
  %266 = load i8, i8 addrspace(4)* %265, align 1, !tbaa !14
  %267 = zext i8 %266 to i64
  %268 = shl nuw i64 %267, 56
  %269 = or i64 %264, %268
  %270 = add nsw i32 %227, -8
  %271 = getelementptr inbounds i8, i8 addrspace(4)* %226, i64 8
  br label %285

272:                                              ; preds = %230, %272
  %273 = phi i32 [ %283, %272 ], [ 0, %230 ]
  %274 = phi i64 [ %282, %272 ], [ 0, %230 ]
  %275 = zext i32 %273 to i64
  %276 = getelementptr inbounds i8, i8 addrspace(4)* %226, i64 %275
  %277 = load i8, i8 addrspace(4)* %276, align 1, !tbaa !14
  %278 = zext i8 %277 to i64
  %279 = shl i32 %273, 3
  %280 = zext i32 %279 to i64
  %281 = shl nuw i64 %278, %280
  %282 = or i64 %281, %274
  %283 = add nuw nsw i32 %273, 1
  %284 = icmp eq i32 %283, %227
  br i1 %284, label %285, label %272

285:                                              ; preds = %272, %232, %230
  %286 = phi i8 addrspace(4)* [ %271, %232 ], [ %226, %230 ], [ %226, %272 ]
  %287 = phi i32 [ %270, %232 ], [ 0, %230 ], [ 0, %272 ]
  %288 = phi i64 [ %269, %232 ], [ 0, %230 ], [ %282, %272 ]
  %289 = icmp ugt i32 %287, 7
  br i1 %289, label %292, label %290

290:                                              ; preds = %285
  %291 = icmp eq i32 %287, 0
  br i1 %291, label %345, label %332

292:                                              ; preds = %285
  %293 = load i8, i8 addrspace(4)* %286, align 1, !tbaa !14
  %294 = zext i8 %293 to i64
  %295 = getelementptr inbounds i8, i8 addrspace(4)* %286, i64 1
  %296 = load i8, i8 addrspace(4)* %295, align 1, !tbaa !14
  %297 = zext i8 %296 to i64
  %298 = shl nuw nsw i64 %297, 8
  %299 = or i64 %298, %294
  %300 = getelementptr inbounds i8, i8 addrspace(4)* %286, i64 2
  %301 = load i8, i8 addrspace(4)* %300, align 1, !tbaa !14
  %302 = zext i8 %301 to i64
  %303 = shl nuw nsw i64 %302, 16
  %304 = or i64 %299, %303
  %305 = getelementptr inbounds i8, i8 addrspace(4)* %286, i64 3
  %306 = load i8, i8 addrspace(4)* %305, align 1, !tbaa !14
  %307 = zext i8 %306 to i64
  %308 = shl nuw nsw i64 %307, 24
  %309 = or i64 %304, %308
  %310 = getelementptr inbounds i8, i8 addrspace(4)* %286, i64 4
  %311 = load i8, i8 addrspace(4)* %310, align 1, !tbaa !14
  %312 = zext i8 %311 to i64
  %313 = shl nuw nsw i64 %312, 32
  %314 = or i64 %309, %313
  %315 = getelementptr inbounds i8, i8 addrspace(4)* %286, i64 5
  %316 = load i8, i8 addrspace(4)* %315, align 1, !tbaa !14
  %317 = zext i8 %316 to i64
  %318 = shl nuw nsw i64 %317, 40
  %319 = or i64 %314, %318
  %320 = getelementptr inbounds i8, i8 addrspace(4)* %286, i64 6
  %321 = load i8, i8 addrspace(4)* %320, align 1, !tbaa !14
  %322 = zext i8 %321 to i64
  %323 = shl nuw nsw i64 %322, 48
  %324 = or i64 %319, %323
  %325 = getelementptr inbounds i8, i8 addrspace(4)* %286, i64 7
  %326 = load i8, i8 addrspace(4)* %325, align 1, !tbaa !14
  %327 = zext i8 %326 to i64
  %328 = shl nuw i64 %327, 56
  %329 = or i64 %324, %328
  %330 = add nsw i32 %287, -8
  %331 = getelementptr inbounds i8, i8 addrspace(4)* %286, i64 8
  br label %345

332:                                              ; preds = %290, %332
  %333 = phi i32 [ %343, %332 ], [ 0, %290 ]
  %334 = phi i64 [ %342, %332 ], [ 0, %290 ]
  %335 = zext i32 %333 to i64
  %336 = getelementptr inbounds i8, i8 addrspace(4)* %286, i64 %335
  %337 = load i8, i8 addrspace(4)* %336, align 1, !tbaa !14
  %338 = zext i8 %337 to i64
  %339 = shl i32 %333, 3
  %340 = zext i32 %339 to i64
  %341 = shl nuw i64 %338, %340
  %342 = or i64 %341, %334
  %343 = add nuw nsw i32 %333, 1
  %344 = icmp eq i32 %343, %287
  br i1 %344, label %345, label %332

345:                                              ; preds = %332, %292, %290
  %346 = phi i8 addrspace(4)* [ %331, %292 ], [ %286, %290 ], [ %286, %332 ]
  %347 = phi i32 [ %330, %292 ], [ 0, %290 ], [ 0, %332 ]
  %348 = phi i64 [ %329, %292 ], [ 0, %290 ], [ %342, %332 ]
  %349 = icmp ugt i32 %347, 7
  br i1 %349, label %352, label %350

350:                                              ; preds = %345
  %351 = icmp eq i32 %347, 0
  br i1 %351, label %405, label %392

352:                                              ; preds = %345
  %353 = load i8, i8 addrspace(4)* %346, align 1, !tbaa !14
  %354 = zext i8 %353 to i64
  %355 = getelementptr inbounds i8, i8 addrspace(4)* %346, i64 1
  %356 = load i8, i8 addrspace(4)* %355, align 1, !tbaa !14
  %357 = zext i8 %356 to i64
  %358 = shl nuw nsw i64 %357, 8
  %359 = or i64 %358, %354
  %360 = getelementptr inbounds i8, i8 addrspace(4)* %346, i64 2
  %361 = load i8, i8 addrspace(4)* %360, align 1, !tbaa !14
  %362 = zext i8 %361 to i64
  %363 = shl nuw nsw i64 %362, 16
  %364 = or i64 %359, %363
  %365 = getelementptr inbounds i8, i8 addrspace(4)* %346, i64 3
  %366 = load i8, i8 addrspace(4)* %365, align 1, !tbaa !14
  %367 = zext i8 %366 to i64
  %368 = shl nuw nsw i64 %367, 24
  %369 = or i64 %364, %368
  %370 = getelementptr inbounds i8, i8 addrspace(4)* %346, i64 4
  %371 = load i8, i8 addrspace(4)* %370, align 1, !tbaa !14
  %372 = zext i8 %371 to i64
  %373 = shl nuw nsw i64 %372, 32
  %374 = or i64 %369, %373
  %375 = getelementptr inbounds i8, i8 addrspace(4)* %346, i64 5
  %376 = load i8, i8 addrspace(4)* %375, align 1, !tbaa !14
  %377 = zext i8 %376 to i64
  %378 = shl nuw nsw i64 %377, 40
  %379 = or i64 %374, %378
  %380 = getelementptr inbounds i8, i8 addrspace(4)* %346, i64 6
  %381 = load i8, i8 addrspace(4)* %380, align 1, !tbaa !14
  %382 = zext i8 %381 to i64
  %383 = shl nuw nsw i64 %382, 48
  %384 = or i64 %379, %383
  %385 = getelementptr inbounds i8, i8 addrspace(4)* %346, i64 7
  %386 = load i8, i8 addrspace(4)* %385, align 1, !tbaa !14
  %387 = zext i8 %386 to i64
  %388 = shl nuw i64 %387, 56
  %389 = or i64 %384, %388
  %390 = add nsw i32 %347, -8
  %391 = getelementptr inbounds i8, i8 addrspace(4)* %346, i64 8
  br label %405

392:                                              ; preds = %350, %392
  %393 = phi i32 [ %403, %392 ], [ 0, %350 ]
  %394 = phi i64 [ %402, %392 ], [ 0, %350 ]
  %395 = zext i32 %393 to i64
  %396 = getelementptr inbounds i8, i8 addrspace(4)* %346, i64 %395
  %397 = load i8, i8 addrspace(4)* %396, align 1, !tbaa !14
  %398 = zext i8 %397 to i64
  %399 = shl i32 %393, 3
  %400 = zext i32 %399 to i64
  %401 = shl nuw i64 %398, %400
  %402 = or i64 %401, %394
  %403 = add nuw nsw i32 %393, 1
  %404 = icmp eq i32 %403, %347
  br i1 %404, label %405, label %392

405:                                              ; preds = %392, %352, %350
  %406 = phi i8 addrspace(4)* [ %391, %352 ], [ %346, %350 ], [ %346, %392 ]
  %407 = phi i32 [ %390, %352 ], [ 0, %350 ], [ 0, %392 ]
  %408 = phi i64 [ %389, %352 ], [ 0, %350 ], [ %402, %392 ]
  %409 = icmp ugt i32 %407, 7
  br i1 %409, label %412, label %410

410:                                              ; preds = %405
  %411 = icmp eq i32 %407, 0
  br i1 %411, label %463, label %450

412:                                              ; preds = %405
  %413 = load i8, i8 addrspace(4)* %406, align 1, !tbaa !14
  %414 = zext i8 %413 to i64
  %415 = getelementptr inbounds i8, i8 addrspace(4)* %406, i64 1
  %416 = load i8, i8 addrspace(4)* %415, align 1, !tbaa !14
  %417 = zext i8 %416 to i64
  %418 = shl nuw nsw i64 %417, 8
  %419 = or i64 %418, %414
  %420 = getelementptr inbounds i8, i8 addrspace(4)* %406, i64 2
  %421 = load i8, i8 addrspace(4)* %420, align 1, !tbaa !14
  %422 = zext i8 %421 to i64
  %423 = shl nuw nsw i64 %422, 16
  %424 = or i64 %419, %423
  %425 = getelementptr inbounds i8, i8 addrspace(4)* %406, i64 3
  %426 = load i8, i8 addrspace(4)* %425, align 1, !tbaa !14
  %427 = zext i8 %426 to i64
  %428 = shl nuw nsw i64 %427, 24
  %429 = or i64 %424, %428
  %430 = getelementptr inbounds i8, i8 addrspace(4)* %406, i64 4
  %431 = load i8, i8 addrspace(4)* %430, align 1, !tbaa !14
  %432 = zext i8 %431 to i64
  %433 = shl nuw nsw i64 %432, 32
  %434 = or i64 %429, %433
  %435 = getelementptr inbounds i8, i8 addrspace(4)* %406, i64 5
  %436 = load i8, i8 addrspace(4)* %435, align 1, !tbaa !14
  %437 = zext i8 %436 to i64
  %438 = shl nuw nsw i64 %437, 40
  %439 = or i64 %434, %438
  %440 = getelementptr inbounds i8, i8 addrspace(4)* %406, i64 6
  %441 = load i8, i8 addrspace(4)* %440, align 1, !tbaa !14
  %442 = zext i8 %441 to i64
  %443 = shl nuw nsw i64 %442, 48
  %444 = or i64 %439, %443
  %445 = getelementptr inbounds i8, i8 addrspace(4)* %406, i64 7
  %446 = load i8, i8 addrspace(4)* %445, align 1, !tbaa !14
  %447 = zext i8 %446 to i64
  %448 = shl nuw i64 %447, 56
  %449 = or i64 %444, %448
  br label %463

450:                                              ; preds = %410, %450
  %451 = phi i32 [ %461, %450 ], [ 0, %410 ]
  %452 = phi i64 [ %460, %450 ], [ 0, %410 ]
  %453 = zext i32 %451 to i64
  %454 = getelementptr inbounds i8, i8 addrspace(4)* %406, i64 %453
  %455 = load i8, i8 addrspace(4)* %454, align 1, !tbaa !14
  %456 = zext i8 %455 to i64
  %457 = shl i32 %451, 3
  %458 = zext i32 %457 to i64
  %459 = shl nuw i64 %456, %458
  %460 = or i64 %459, %452
  %461 = add nuw nsw i32 %451, 1
  %462 = icmp eq i32 %461, %407
  br i1 %462, label %463, label %450

463:                                              ; preds = %450, %412, %410
  %464 = phi i64 [ %449, %412 ], [ 0, %410 ], [ %460, %450 ]
  %465 = shl nuw nsw i64 %46, 2
  %466 = add nuw nsw i64 %465, 28
  %467 = and i64 %466, 480
  %468 = and i64 %48, -225
  %469 = or i64 %468, %467
  %470 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %26, i64 noundef %469, i64 noundef %108, i64 noundef %168, i64 noundef %228, i64 noundef %288, i64 noundef %348, i64 noundef %408, i64 noundef %464) #11
  %471 = sub i64 %38, %46
  %472 = getelementptr inbounds i8, i8 addrspace(4)* %39, i64 %46
  %473 = icmp eq i64 %471, 0
  br i1 %473, label %474, label %37

474:                                              ; preds = %463, %29
  %475 = phi <2 x i64> [ %32, %29 ], [ %470, %463 ]
  %476 = extractelement <2 x i64> %475, i64 0
  %477 = and i64 %476, -227
  %478 = or i64 %477, 34
  %479 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %26, i64 noundef %478, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %480 = load i32, i32 addrspace(3)* getelementptr inbounds ([0 x i32], [0 x i32] addrspace(3)* @seme, i32 0, i32 0), align 4, !tbaa !5
  %481 = mul nsw i32 %480, %480
  %482 = load i32, i32 addrspace(1)* %0, align 4, !tbaa !5
  %483 = add nsw i32 %482, %481
  store i32 %483, i32 addrspace(1)* %0, align 4, !tbaa !5
  %484 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %26, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %485 = extractelement <2 x i64> %484, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([24 x i8], [24 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), label %927, label %486

486:                                              ; preds = %474
  %487 = and i64 %485, 2
  %488 = and i64 %485, -3
  %489 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %488, i64 0
  br label %490

490:                                              ; preds = %916, %486
  %491 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([24 x i8], [24 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([24 x i8], [24 x i8] addrspace(4)* @.str, i64 0, i64 23) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([24 x i8]* addrspacecast ([24 x i8] addrspace(4)* @.str to [24 x i8]*) to i64)), i64 1))), %486 ], [ %924, %916 ]
  %492 = phi i8 addrspace(4)* [ getelementptr inbounds ([24 x i8], [24 x i8] addrspace(4)* @.str, i64 0, i64 0), %486 ], [ %925, %916 ]
  %493 = phi <2 x i64> [ %489, %486 ], [ %923, %916 ]
  %494 = icmp ugt i64 %491, 56
  %495 = extractelement <2 x i64> %493, i64 0
  %496 = or i64 %495, %487
  %497 = insertelement <2 x i64> poison, i64 %496, i64 0
  %498 = select i1 %494, <2 x i64> %493, <2 x i64> %497
  %499 = tail call i64 @llvm.umin.i64(i64 %491, i64 56)
  %500 = trunc i64 %499 to i32
  %501 = extractelement <2 x i64> %498, i64 0
  %502 = icmp ugt i32 %500, 7
  br i1 %502, label %518, label %503

503:                                              ; preds = %490
  %504 = icmp eq i32 %500, 0
  br i1 %504, label %558, label %505

505:                                              ; preds = %503, %505
  %506 = phi i32 [ %516, %505 ], [ 0, %503 ]
  %507 = phi i64 [ %515, %505 ], [ 0, %503 ]
  %508 = zext i32 %506 to i64
  %509 = getelementptr inbounds i8, i8 addrspace(4)* %492, i64 %508
  %510 = load i8, i8 addrspace(4)* %509, align 1, !tbaa !14
  %511 = zext i8 %510 to i64
  %512 = shl i32 %506, 3
  %513 = zext i32 %512 to i64
  %514 = shl nuw i64 %511, %513
  %515 = or i64 %514, %507
  %516 = add nuw nsw i32 %506, 1
  %517 = icmp eq i32 %516, %500
  br i1 %517, label %558, label %505, !llvm.loop !15

518:                                              ; preds = %490
  %519 = load i8, i8 addrspace(4)* %492, align 1, !tbaa !14
  %520 = zext i8 %519 to i64
  %521 = getelementptr inbounds i8, i8 addrspace(4)* %492, i64 1
  %522 = load i8, i8 addrspace(4)* %521, align 1, !tbaa !14
  %523 = zext i8 %522 to i64
  %524 = shl nuw nsw i64 %523, 8
  %525 = or i64 %524, %520
  %526 = getelementptr inbounds i8, i8 addrspace(4)* %492, i64 2
  %527 = load i8, i8 addrspace(4)* %526, align 1, !tbaa !14
  %528 = zext i8 %527 to i64
  %529 = shl nuw nsw i64 %528, 16
  %530 = or i64 %525, %529
  %531 = getelementptr inbounds i8, i8 addrspace(4)* %492, i64 3
  %532 = load i8, i8 addrspace(4)* %531, align 1, !tbaa !14
  %533 = zext i8 %532 to i64
  %534 = shl nuw nsw i64 %533, 24
  %535 = or i64 %530, %534
  %536 = getelementptr inbounds i8, i8 addrspace(4)* %492, i64 4
  %537 = load i8, i8 addrspace(4)* %536, align 1, !tbaa !14
  %538 = zext i8 %537 to i64
  %539 = shl nuw nsw i64 %538, 32
  %540 = or i64 %535, %539
  %541 = getelementptr inbounds i8, i8 addrspace(4)* %492, i64 5
  %542 = load i8, i8 addrspace(4)* %541, align 1, !tbaa !14
  %543 = zext i8 %542 to i64
  %544 = shl nuw nsw i64 %543, 40
  %545 = or i64 %540, %544
  %546 = getelementptr inbounds i8, i8 addrspace(4)* %492, i64 6
  %547 = load i8, i8 addrspace(4)* %546, align 1, !tbaa !14
  %548 = zext i8 %547 to i64
  %549 = shl nuw nsw i64 %548, 48
  %550 = or i64 %545, %549
  %551 = getelementptr inbounds i8, i8 addrspace(4)* %492, i64 7
  %552 = load i8, i8 addrspace(4)* %551, align 1, !tbaa !14
  %553 = zext i8 %552 to i64
  %554 = shl nuw i64 %553, 56
  %555 = or i64 %550, %554
  %556 = add nsw i32 %500, -8
  %557 = getelementptr inbounds i8, i8 addrspace(4)* %492, i64 8
  br label %558

558:                                              ; preds = %505, %518, %503
  %559 = phi i8 addrspace(4)* [ %557, %518 ], [ %492, %503 ], [ %492, %505 ]
  %560 = phi i32 [ %556, %518 ], [ 0, %503 ], [ 0, %505 ]
  %561 = phi i64 [ %555, %518 ], [ 0, %503 ], [ %515, %505 ]
  %562 = icmp ugt i32 %560, 7
  br i1 %562, label %578, label %563

563:                                              ; preds = %558
  %564 = icmp eq i32 %560, 0
  br i1 %564, label %618, label %565

565:                                              ; preds = %563, %565
  %566 = phi i32 [ %576, %565 ], [ 0, %563 ]
  %567 = phi i64 [ %575, %565 ], [ 0, %563 ]
  %568 = zext i32 %566 to i64
  %569 = getelementptr inbounds i8, i8 addrspace(4)* %559, i64 %568
  %570 = load i8, i8 addrspace(4)* %569, align 1, !tbaa !14
  %571 = zext i8 %570 to i64
  %572 = shl i32 %566, 3
  %573 = zext i32 %572 to i64
  %574 = shl nuw i64 %571, %573
  %575 = or i64 %574, %567
  %576 = add nuw nsw i32 %566, 1
  %577 = icmp eq i32 %576, %560
  br i1 %577, label %618, label %565

578:                                              ; preds = %558
  %579 = load i8, i8 addrspace(4)* %559, align 1, !tbaa !14
  %580 = zext i8 %579 to i64
  %581 = getelementptr inbounds i8, i8 addrspace(4)* %559, i64 1
  %582 = load i8, i8 addrspace(4)* %581, align 1, !tbaa !14
  %583 = zext i8 %582 to i64
  %584 = shl nuw nsw i64 %583, 8
  %585 = or i64 %584, %580
  %586 = getelementptr inbounds i8, i8 addrspace(4)* %559, i64 2
  %587 = load i8, i8 addrspace(4)* %586, align 1, !tbaa !14
  %588 = zext i8 %587 to i64
  %589 = shl nuw nsw i64 %588, 16
  %590 = or i64 %585, %589
  %591 = getelementptr inbounds i8, i8 addrspace(4)* %559, i64 3
  %592 = load i8, i8 addrspace(4)* %591, align 1, !tbaa !14
  %593 = zext i8 %592 to i64
  %594 = shl nuw nsw i64 %593, 24
  %595 = or i64 %590, %594
  %596 = getelementptr inbounds i8, i8 addrspace(4)* %559, i64 4
  %597 = load i8, i8 addrspace(4)* %596, align 1, !tbaa !14
  %598 = zext i8 %597 to i64
  %599 = shl nuw nsw i64 %598, 32
  %600 = or i64 %595, %599
  %601 = getelementptr inbounds i8, i8 addrspace(4)* %559, i64 5
  %602 = load i8, i8 addrspace(4)* %601, align 1, !tbaa !14
  %603 = zext i8 %602 to i64
  %604 = shl nuw nsw i64 %603, 40
  %605 = or i64 %600, %604
  %606 = getelementptr inbounds i8, i8 addrspace(4)* %559, i64 6
  %607 = load i8, i8 addrspace(4)* %606, align 1, !tbaa !14
  %608 = zext i8 %607 to i64
  %609 = shl nuw nsw i64 %608, 48
  %610 = or i64 %605, %609
  %611 = getelementptr inbounds i8, i8 addrspace(4)* %559, i64 7
  %612 = load i8, i8 addrspace(4)* %611, align 1, !tbaa !14
  %613 = zext i8 %612 to i64
  %614 = shl nuw i64 %613, 56
  %615 = or i64 %610, %614
  %616 = add nsw i32 %560, -8
  %617 = getelementptr inbounds i8, i8 addrspace(4)* %559, i64 8
  br label %618

618:                                              ; preds = %565, %578, %563
  %619 = phi i8 addrspace(4)* [ %617, %578 ], [ %559, %563 ], [ %559, %565 ]
  %620 = phi i32 [ %616, %578 ], [ 0, %563 ], [ 0, %565 ]
  %621 = phi i64 [ %615, %578 ], [ 0, %563 ], [ %575, %565 ]
  %622 = icmp ugt i32 %620, 7
  br i1 %622, label %638, label %623

623:                                              ; preds = %618
  %624 = icmp eq i32 %620, 0
  br i1 %624, label %678, label %625

625:                                              ; preds = %623, %625
  %626 = phi i32 [ %636, %625 ], [ 0, %623 ]
  %627 = phi i64 [ %635, %625 ], [ 0, %623 ]
  %628 = zext i32 %626 to i64
  %629 = getelementptr inbounds i8, i8 addrspace(4)* %619, i64 %628
  %630 = load i8, i8 addrspace(4)* %629, align 1, !tbaa !14
  %631 = zext i8 %630 to i64
  %632 = shl i32 %626, 3
  %633 = zext i32 %632 to i64
  %634 = shl nuw i64 %631, %633
  %635 = or i64 %634, %627
  %636 = add nuw nsw i32 %626, 1
  %637 = icmp eq i32 %636, %620
  br i1 %637, label %678, label %625

638:                                              ; preds = %618
  %639 = load i8, i8 addrspace(4)* %619, align 1, !tbaa !14
  %640 = zext i8 %639 to i64
  %641 = getelementptr inbounds i8, i8 addrspace(4)* %619, i64 1
  %642 = load i8, i8 addrspace(4)* %641, align 1, !tbaa !14
  %643 = zext i8 %642 to i64
  %644 = shl nuw nsw i64 %643, 8
  %645 = or i64 %644, %640
  %646 = getelementptr inbounds i8, i8 addrspace(4)* %619, i64 2
  %647 = load i8, i8 addrspace(4)* %646, align 1, !tbaa !14
  %648 = zext i8 %647 to i64
  %649 = shl nuw nsw i64 %648, 16
  %650 = or i64 %645, %649
  %651 = getelementptr inbounds i8, i8 addrspace(4)* %619, i64 3
  %652 = load i8, i8 addrspace(4)* %651, align 1, !tbaa !14
  %653 = zext i8 %652 to i64
  %654 = shl nuw nsw i64 %653, 24
  %655 = or i64 %650, %654
  %656 = getelementptr inbounds i8, i8 addrspace(4)* %619, i64 4
  %657 = load i8, i8 addrspace(4)* %656, align 1, !tbaa !14
  %658 = zext i8 %657 to i64
  %659 = shl nuw nsw i64 %658, 32
  %660 = or i64 %655, %659
  %661 = getelementptr inbounds i8, i8 addrspace(4)* %619, i64 5
  %662 = load i8, i8 addrspace(4)* %661, align 1, !tbaa !14
  %663 = zext i8 %662 to i64
  %664 = shl nuw nsw i64 %663, 40
  %665 = or i64 %660, %664
  %666 = getelementptr inbounds i8, i8 addrspace(4)* %619, i64 6
  %667 = load i8, i8 addrspace(4)* %666, align 1, !tbaa !14
  %668 = zext i8 %667 to i64
  %669 = shl nuw nsw i64 %668, 48
  %670 = or i64 %665, %669
  %671 = getelementptr inbounds i8, i8 addrspace(4)* %619, i64 7
  %672 = load i8, i8 addrspace(4)* %671, align 1, !tbaa !14
  %673 = zext i8 %672 to i64
  %674 = shl nuw i64 %673, 56
  %675 = or i64 %670, %674
  %676 = add nsw i32 %620, -8
  %677 = getelementptr inbounds i8, i8 addrspace(4)* %619, i64 8
  br label %678

678:                                              ; preds = %625, %638, %623
  %679 = phi i8 addrspace(4)* [ %677, %638 ], [ %619, %623 ], [ %619, %625 ]
  %680 = phi i32 [ %676, %638 ], [ 0, %623 ], [ 0, %625 ]
  %681 = phi i64 [ %675, %638 ], [ 0, %623 ], [ %635, %625 ]
  %682 = icmp ugt i32 %680, 7
  br i1 %682, label %698, label %683

683:                                              ; preds = %678
  %684 = icmp eq i32 %680, 0
  br i1 %684, label %738, label %685

685:                                              ; preds = %683, %685
  %686 = phi i32 [ %696, %685 ], [ 0, %683 ]
  %687 = phi i64 [ %695, %685 ], [ 0, %683 ]
  %688 = zext i32 %686 to i64
  %689 = getelementptr inbounds i8, i8 addrspace(4)* %679, i64 %688
  %690 = load i8, i8 addrspace(4)* %689, align 1, !tbaa !14
  %691 = zext i8 %690 to i64
  %692 = shl i32 %686, 3
  %693 = zext i32 %692 to i64
  %694 = shl nuw i64 %691, %693
  %695 = or i64 %694, %687
  %696 = add nuw nsw i32 %686, 1
  %697 = icmp eq i32 %696, %680
  br i1 %697, label %738, label %685

698:                                              ; preds = %678
  %699 = load i8, i8 addrspace(4)* %679, align 1, !tbaa !14
  %700 = zext i8 %699 to i64
  %701 = getelementptr inbounds i8, i8 addrspace(4)* %679, i64 1
  %702 = load i8, i8 addrspace(4)* %701, align 1, !tbaa !14
  %703 = zext i8 %702 to i64
  %704 = shl nuw nsw i64 %703, 8
  %705 = or i64 %704, %700
  %706 = getelementptr inbounds i8, i8 addrspace(4)* %679, i64 2
  %707 = load i8, i8 addrspace(4)* %706, align 1, !tbaa !14
  %708 = zext i8 %707 to i64
  %709 = shl nuw nsw i64 %708, 16
  %710 = or i64 %705, %709
  %711 = getelementptr inbounds i8, i8 addrspace(4)* %679, i64 3
  %712 = load i8, i8 addrspace(4)* %711, align 1, !tbaa !14
  %713 = zext i8 %712 to i64
  %714 = shl nuw nsw i64 %713, 24
  %715 = or i64 %710, %714
  %716 = getelementptr inbounds i8, i8 addrspace(4)* %679, i64 4
  %717 = load i8, i8 addrspace(4)* %716, align 1, !tbaa !14
  %718 = zext i8 %717 to i64
  %719 = shl nuw nsw i64 %718, 32
  %720 = or i64 %715, %719
  %721 = getelementptr inbounds i8, i8 addrspace(4)* %679, i64 5
  %722 = load i8, i8 addrspace(4)* %721, align 1, !tbaa !14
  %723 = zext i8 %722 to i64
  %724 = shl nuw nsw i64 %723, 40
  %725 = or i64 %720, %724
  %726 = getelementptr inbounds i8, i8 addrspace(4)* %679, i64 6
  %727 = load i8, i8 addrspace(4)* %726, align 1, !tbaa !14
  %728 = zext i8 %727 to i64
  %729 = shl nuw nsw i64 %728, 48
  %730 = or i64 %725, %729
  %731 = getelementptr inbounds i8, i8 addrspace(4)* %679, i64 7
  %732 = load i8, i8 addrspace(4)* %731, align 1, !tbaa !14
  %733 = zext i8 %732 to i64
  %734 = shl nuw i64 %733, 56
  %735 = or i64 %730, %734
  %736 = add nsw i32 %680, -8
  %737 = getelementptr inbounds i8, i8 addrspace(4)* %679, i64 8
  br label %738

738:                                              ; preds = %685, %698, %683
  %739 = phi i8 addrspace(4)* [ %737, %698 ], [ %679, %683 ], [ %679, %685 ]
  %740 = phi i32 [ %736, %698 ], [ 0, %683 ], [ 0, %685 ]
  %741 = phi i64 [ %735, %698 ], [ 0, %683 ], [ %695, %685 ]
  %742 = icmp ugt i32 %740, 7
  br i1 %742, label %758, label %743

743:                                              ; preds = %738
  %744 = icmp eq i32 %740, 0
  br i1 %744, label %798, label %745

745:                                              ; preds = %743, %745
  %746 = phi i32 [ %756, %745 ], [ 0, %743 ]
  %747 = phi i64 [ %755, %745 ], [ 0, %743 ]
  %748 = zext i32 %746 to i64
  %749 = getelementptr inbounds i8, i8 addrspace(4)* %739, i64 %748
  %750 = load i8, i8 addrspace(4)* %749, align 1, !tbaa !14
  %751 = zext i8 %750 to i64
  %752 = shl i32 %746, 3
  %753 = zext i32 %752 to i64
  %754 = shl nuw i64 %751, %753
  %755 = or i64 %754, %747
  %756 = add nuw nsw i32 %746, 1
  %757 = icmp eq i32 %756, %740
  br i1 %757, label %798, label %745

758:                                              ; preds = %738
  %759 = load i8, i8 addrspace(4)* %739, align 1, !tbaa !14
  %760 = zext i8 %759 to i64
  %761 = getelementptr inbounds i8, i8 addrspace(4)* %739, i64 1
  %762 = load i8, i8 addrspace(4)* %761, align 1, !tbaa !14
  %763 = zext i8 %762 to i64
  %764 = shl nuw nsw i64 %763, 8
  %765 = or i64 %764, %760
  %766 = getelementptr inbounds i8, i8 addrspace(4)* %739, i64 2
  %767 = load i8, i8 addrspace(4)* %766, align 1, !tbaa !14
  %768 = zext i8 %767 to i64
  %769 = shl nuw nsw i64 %768, 16
  %770 = or i64 %765, %769
  %771 = getelementptr inbounds i8, i8 addrspace(4)* %739, i64 3
  %772 = load i8, i8 addrspace(4)* %771, align 1, !tbaa !14
  %773 = zext i8 %772 to i64
  %774 = shl nuw nsw i64 %773, 24
  %775 = or i64 %770, %774
  %776 = getelementptr inbounds i8, i8 addrspace(4)* %739, i64 4
  %777 = load i8, i8 addrspace(4)* %776, align 1, !tbaa !14
  %778 = zext i8 %777 to i64
  %779 = shl nuw nsw i64 %778, 32
  %780 = or i64 %775, %779
  %781 = getelementptr inbounds i8, i8 addrspace(4)* %739, i64 5
  %782 = load i8, i8 addrspace(4)* %781, align 1, !tbaa !14
  %783 = zext i8 %782 to i64
  %784 = shl nuw nsw i64 %783, 40
  %785 = or i64 %780, %784
  %786 = getelementptr inbounds i8, i8 addrspace(4)* %739, i64 6
  %787 = load i8, i8 addrspace(4)* %786, align 1, !tbaa !14
  %788 = zext i8 %787 to i64
  %789 = shl nuw nsw i64 %788, 48
  %790 = or i64 %785, %789
  %791 = getelementptr inbounds i8, i8 addrspace(4)* %739, i64 7
  %792 = load i8, i8 addrspace(4)* %791, align 1, !tbaa !14
  %793 = zext i8 %792 to i64
  %794 = shl nuw i64 %793, 56
  %795 = or i64 %790, %794
  %796 = add nsw i32 %740, -8
  %797 = getelementptr inbounds i8, i8 addrspace(4)* %739, i64 8
  br label %798

798:                                              ; preds = %745, %758, %743
  %799 = phi i8 addrspace(4)* [ %797, %758 ], [ %739, %743 ], [ %739, %745 ]
  %800 = phi i32 [ %796, %758 ], [ 0, %743 ], [ 0, %745 ]
  %801 = phi i64 [ %795, %758 ], [ 0, %743 ], [ %755, %745 ]
  %802 = icmp ugt i32 %800, 7
  br i1 %802, label %818, label %803

803:                                              ; preds = %798
  %804 = icmp eq i32 %800, 0
  br i1 %804, label %858, label %805

805:                                              ; preds = %803, %805
  %806 = phi i32 [ %816, %805 ], [ 0, %803 ]
  %807 = phi i64 [ %815, %805 ], [ 0, %803 ]
  %808 = zext i32 %806 to i64
  %809 = getelementptr inbounds i8, i8 addrspace(4)* %799, i64 %808
  %810 = load i8, i8 addrspace(4)* %809, align 1, !tbaa !14
  %811 = zext i8 %810 to i64
  %812 = shl i32 %806, 3
  %813 = zext i32 %812 to i64
  %814 = shl nuw i64 %811, %813
  %815 = or i64 %814, %807
  %816 = add nuw nsw i32 %806, 1
  %817 = icmp eq i32 %816, %800
  br i1 %817, label %858, label %805

818:                                              ; preds = %798
  %819 = load i8, i8 addrspace(4)* %799, align 1, !tbaa !14
  %820 = zext i8 %819 to i64
  %821 = getelementptr inbounds i8, i8 addrspace(4)* %799, i64 1
  %822 = load i8, i8 addrspace(4)* %821, align 1, !tbaa !14
  %823 = zext i8 %822 to i64
  %824 = shl nuw nsw i64 %823, 8
  %825 = or i64 %824, %820
  %826 = getelementptr inbounds i8, i8 addrspace(4)* %799, i64 2
  %827 = load i8, i8 addrspace(4)* %826, align 1, !tbaa !14
  %828 = zext i8 %827 to i64
  %829 = shl nuw nsw i64 %828, 16
  %830 = or i64 %825, %829
  %831 = getelementptr inbounds i8, i8 addrspace(4)* %799, i64 3
  %832 = load i8, i8 addrspace(4)* %831, align 1, !tbaa !14
  %833 = zext i8 %832 to i64
  %834 = shl nuw nsw i64 %833, 24
  %835 = or i64 %830, %834
  %836 = getelementptr inbounds i8, i8 addrspace(4)* %799, i64 4
  %837 = load i8, i8 addrspace(4)* %836, align 1, !tbaa !14
  %838 = zext i8 %837 to i64
  %839 = shl nuw nsw i64 %838, 32
  %840 = or i64 %835, %839
  %841 = getelementptr inbounds i8, i8 addrspace(4)* %799, i64 5
  %842 = load i8, i8 addrspace(4)* %841, align 1, !tbaa !14
  %843 = zext i8 %842 to i64
  %844 = shl nuw nsw i64 %843, 40
  %845 = or i64 %840, %844
  %846 = getelementptr inbounds i8, i8 addrspace(4)* %799, i64 6
  %847 = load i8, i8 addrspace(4)* %846, align 1, !tbaa !14
  %848 = zext i8 %847 to i64
  %849 = shl nuw nsw i64 %848, 48
  %850 = or i64 %845, %849
  %851 = getelementptr inbounds i8, i8 addrspace(4)* %799, i64 7
  %852 = load i8, i8 addrspace(4)* %851, align 1, !tbaa !14
  %853 = zext i8 %852 to i64
  %854 = shl nuw i64 %853, 56
  %855 = or i64 %850, %854
  %856 = add nsw i32 %800, -8
  %857 = getelementptr inbounds i8, i8 addrspace(4)* %799, i64 8
  br label %858

858:                                              ; preds = %805, %818, %803
  %859 = phi i8 addrspace(4)* [ %857, %818 ], [ %799, %803 ], [ %799, %805 ]
  %860 = phi i32 [ %856, %818 ], [ 0, %803 ], [ 0, %805 ]
  %861 = phi i64 [ %855, %818 ], [ 0, %803 ], [ %815, %805 ]
  %862 = icmp ugt i32 %860, 7
  br i1 %862, label %878, label %863

863:                                              ; preds = %858
  %864 = icmp eq i32 %860, 0
  br i1 %864, label %916, label %865

865:                                              ; preds = %863, %865
  %866 = phi i32 [ %876, %865 ], [ 0, %863 ]
  %867 = phi i64 [ %875, %865 ], [ 0, %863 ]
  %868 = zext i32 %866 to i64
  %869 = getelementptr inbounds i8, i8 addrspace(4)* %859, i64 %868
  %870 = load i8, i8 addrspace(4)* %869, align 1, !tbaa !14
  %871 = zext i8 %870 to i64
  %872 = shl i32 %866, 3
  %873 = zext i32 %872 to i64
  %874 = shl nuw i64 %871, %873
  %875 = or i64 %874, %867
  %876 = add nuw nsw i32 %866, 1
  %877 = icmp eq i32 %876, %860
  br i1 %877, label %916, label %865

878:                                              ; preds = %858
  %879 = load i8, i8 addrspace(4)* %859, align 1, !tbaa !14
  %880 = zext i8 %879 to i64
  %881 = getelementptr inbounds i8, i8 addrspace(4)* %859, i64 1
  %882 = load i8, i8 addrspace(4)* %881, align 1, !tbaa !14
  %883 = zext i8 %882 to i64
  %884 = shl nuw nsw i64 %883, 8
  %885 = or i64 %884, %880
  %886 = getelementptr inbounds i8, i8 addrspace(4)* %859, i64 2
  %887 = load i8, i8 addrspace(4)* %886, align 1, !tbaa !14
  %888 = zext i8 %887 to i64
  %889 = shl nuw nsw i64 %888, 16
  %890 = or i64 %885, %889
  %891 = getelementptr inbounds i8, i8 addrspace(4)* %859, i64 3
  %892 = load i8, i8 addrspace(4)* %891, align 1, !tbaa !14
  %893 = zext i8 %892 to i64
  %894 = shl nuw nsw i64 %893, 24
  %895 = or i64 %890, %894
  %896 = getelementptr inbounds i8, i8 addrspace(4)* %859, i64 4
  %897 = load i8, i8 addrspace(4)* %896, align 1, !tbaa !14
  %898 = zext i8 %897 to i64
  %899 = shl nuw nsw i64 %898, 32
  %900 = or i64 %895, %899
  %901 = getelementptr inbounds i8, i8 addrspace(4)* %859, i64 5
  %902 = load i8, i8 addrspace(4)* %901, align 1, !tbaa !14
  %903 = zext i8 %902 to i64
  %904 = shl nuw nsw i64 %903, 40
  %905 = or i64 %900, %904
  %906 = getelementptr inbounds i8, i8 addrspace(4)* %859, i64 6
  %907 = load i8, i8 addrspace(4)* %906, align 1, !tbaa !14
  %908 = zext i8 %907 to i64
  %909 = shl nuw nsw i64 %908, 48
  %910 = or i64 %905, %909
  %911 = getelementptr inbounds i8, i8 addrspace(4)* %859, i64 7
  %912 = load i8, i8 addrspace(4)* %911, align 1, !tbaa !14
  %913 = zext i8 %912 to i64
  %914 = shl nuw i64 %913, 56
  %915 = or i64 %910, %914
  br label %916

916:                                              ; preds = %865, %878, %863
  %917 = phi i64 [ %915, %878 ], [ 0, %863 ], [ %875, %865 ]
  %918 = shl nuw nsw i64 %499, 2
  %919 = add nuw nsw i64 %918, 28
  %920 = and i64 %919, 480
  %921 = and i64 %501, -225
  %922 = or i64 %921, %920
  %923 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %26, i64 noundef %922, i64 noundef %561, i64 noundef %621, i64 noundef %681, i64 noundef %741, i64 noundef %801, i64 noundef %861, i64 noundef %917) #11
  %924 = sub i64 %491, %499
  %925 = getelementptr inbounds i8, i8 addrspace(4)* %492, i64 %499
  %926 = icmp eq i64 %924, 0
  br i1 %926, label %931, label %490

927:                                              ; preds = %474
  %928 = and i64 %485, -225
  %929 = or i64 %928, 32
  %930 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %26, i64 noundef %929, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  br label %931

931:                                              ; preds = %916, %927
  %932 = phi <2 x i64> [ %930, %927 ], [ %923, %916 ]
  %933 = extractelement <2 x i64> %932, i64 0
  %934 = and i64 %933, -227
  %935 = or i64 %934, 34
  %936 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %26, i64 noundef %935, i64 noundef 1, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %937 = load i32, i32 addrspace(3)* getelementptr inbounds ([0 x i32], [0 x i32] addrspace(3)* @seme, i32 0, i32 1), align 4, !tbaa !5
  %938 = mul nsw i32 %937, %937
  %939 = load i32, i32 addrspace(1)* %0, align 4, !tbaa !5
  %940 = add nsw i32 %939, %938
  store i32 %940, i32 addrspace(1)* %0, align 4, !tbaa !5
  %941 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %26, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %942 = extractelement <2 x i64> %941, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([24 x i8], [24 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), label %1384, label %943

943:                                              ; preds = %931
  %944 = and i64 %942, 2
  %945 = and i64 %942, -3
  %946 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %945, i64 0
  br label %947

947:                                              ; preds = %1373, %943
  %948 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([24 x i8], [24 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([24 x i8], [24 x i8] addrspace(4)* @.str, i64 0, i64 23) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([24 x i8]* addrspacecast ([24 x i8] addrspace(4)* @.str to [24 x i8]*) to i64)), i64 1))), %943 ], [ %1381, %1373 ]
  %949 = phi i8 addrspace(4)* [ getelementptr inbounds ([24 x i8], [24 x i8] addrspace(4)* @.str, i64 0, i64 0), %943 ], [ %1382, %1373 ]
  %950 = phi <2 x i64> [ %946, %943 ], [ %1380, %1373 ]
  %951 = icmp ugt i64 %948, 56
  %952 = extractelement <2 x i64> %950, i64 0
  %953 = or i64 %952, %944
  %954 = insertelement <2 x i64> poison, i64 %953, i64 0
  %955 = select i1 %951, <2 x i64> %950, <2 x i64> %954
  %956 = tail call i64 @llvm.umin.i64(i64 %948, i64 56)
  %957 = trunc i64 %956 to i32
  %958 = extractelement <2 x i64> %955, i64 0
  %959 = icmp ugt i32 %957, 7
  br i1 %959, label %975, label %960

960:                                              ; preds = %947
  %961 = icmp eq i32 %957, 0
  br i1 %961, label %1015, label %962

962:                                              ; preds = %960, %962
  %963 = phi i32 [ %973, %962 ], [ 0, %960 ]
  %964 = phi i64 [ %972, %962 ], [ 0, %960 ]
  %965 = zext i32 %963 to i64
  %966 = getelementptr inbounds i8, i8 addrspace(4)* %949, i64 %965
  %967 = load i8, i8 addrspace(4)* %966, align 1, !tbaa !14
  %968 = zext i8 %967 to i64
  %969 = shl i32 %963, 3
  %970 = zext i32 %969 to i64
  %971 = shl nuw i64 %968, %970
  %972 = or i64 %971, %964
  %973 = add nuw nsw i32 %963, 1
  %974 = icmp eq i32 %973, %957
  br i1 %974, label %1015, label %962, !llvm.loop !15

975:                                              ; preds = %947
  %976 = load i8, i8 addrspace(4)* %949, align 1, !tbaa !14
  %977 = zext i8 %976 to i64
  %978 = getelementptr inbounds i8, i8 addrspace(4)* %949, i64 1
  %979 = load i8, i8 addrspace(4)* %978, align 1, !tbaa !14
  %980 = zext i8 %979 to i64
  %981 = shl nuw nsw i64 %980, 8
  %982 = or i64 %981, %977
  %983 = getelementptr inbounds i8, i8 addrspace(4)* %949, i64 2
  %984 = load i8, i8 addrspace(4)* %983, align 1, !tbaa !14
  %985 = zext i8 %984 to i64
  %986 = shl nuw nsw i64 %985, 16
  %987 = or i64 %982, %986
  %988 = getelementptr inbounds i8, i8 addrspace(4)* %949, i64 3
  %989 = load i8, i8 addrspace(4)* %988, align 1, !tbaa !14
  %990 = zext i8 %989 to i64
  %991 = shl nuw nsw i64 %990, 24
  %992 = or i64 %987, %991
  %993 = getelementptr inbounds i8, i8 addrspace(4)* %949, i64 4
  %994 = load i8, i8 addrspace(4)* %993, align 1, !tbaa !14
  %995 = zext i8 %994 to i64
  %996 = shl nuw nsw i64 %995, 32
  %997 = or i64 %992, %996
  %998 = getelementptr inbounds i8, i8 addrspace(4)* %949, i64 5
  %999 = load i8, i8 addrspace(4)* %998, align 1, !tbaa !14
  %1000 = zext i8 %999 to i64
  %1001 = shl nuw nsw i64 %1000, 40
  %1002 = or i64 %997, %1001
  %1003 = getelementptr inbounds i8, i8 addrspace(4)* %949, i64 6
  %1004 = load i8, i8 addrspace(4)* %1003, align 1, !tbaa !14
  %1005 = zext i8 %1004 to i64
  %1006 = shl nuw nsw i64 %1005, 48
  %1007 = or i64 %1002, %1006
  %1008 = getelementptr inbounds i8, i8 addrspace(4)* %949, i64 7
  %1009 = load i8, i8 addrspace(4)* %1008, align 1, !tbaa !14
  %1010 = zext i8 %1009 to i64
  %1011 = shl nuw i64 %1010, 56
  %1012 = or i64 %1007, %1011
  %1013 = add nsw i32 %957, -8
  %1014 = getelementptr inbounds i8, i8 addrspace(4)* %949, i64 8
  br label %1015

1015:                                             ; preds = %962, %975, %960
  %1016 = phi i8 addrspace(4)* [ %1014, %975 ], [ %949, %960 ], [ %949, %962 ]
  %1017 = phi i32 [ %1013, %975 ], [ 0, %960 ], [ 0, %962 ]
  %1018 = phi i64 [ %1012, %975 ], [ 0, %960 ], [ %972, %962 ]
  %1019 = icmp ugt i32 %1017, 7
  br i1 %1019, label %1035, label %1020

1020:                                             ; preds = %1015
  %1021 = icmp eq i32 %1017, 0
  br i1 %1021, label %1075, label %1022

1022:                                             ; preds = %1020, %1022
  %1023 = phi i32 [ %1033, %1022 ], [ 0, %1020 ]
  %1024 = phi i64 [ %1032, %1022 ], [ 0, %1020 ]
  %1025 = zext i32 %1023 to i64
  %1026 = getelementptr inbounds i8, i8 addrspace(4)* %1016, i64 %1025
  %1027 = load i8, i8 addrspace(4)* %1026, align 1, !tbaa !14
  %1028 = zext i8 %1027 to i64
  %1029 = shl i32 %1023, 3
  %1030 = zext i32 %1029 to i64
  %1031 = shl nuw i64 %1028, %1030
  %1032 = or i64 %1031, %1024
  %1033 = add nuw nsw i32 %1023, 1
  %1034 = icmp eq i32 %1033, %1017
  br i1 %1034, label %1075, label %1022

1035:                                             ; preds = %1015
  %1036 = load i8, i8 addrspace(4)* %1016, align 1, !tbaa !14
  %1037 = zext i8 %1036 to i64
  %1038 = getelementptr inbounds i8, i8 addrspace(4)* %1016, i64 1
  %1039 = load i8, i8 addrspace(4)* %1038, align 1, !tbaa !14
  %1040 = zext i8 %1039 to i64
  %1041 = shl nuw nsw i64 %1040, 8
  %1042 = or i64 %1041, %1037
  %1043 = getelementptr inbounds i8, i8 addrspace(4)* %1016, i64 2
  %1044 = load i8, i8 addrspace(4)* %1043, align 1, !tbaa !14
  %1045 = zext i8 %1044 to i64
  %1046 = shl nuw nsw i64 %1045, 16
  %1047 = or i64 %1042, %1046
  %1048 = getelementptr inbounds i8, i8 addrspace(4)* %1016, i64 3
  %1049 = load i8, i8 addrspace(4)* %1048, align 1, !tbaa !14
  %1050 = zext i8 %1049 to i64
  %1051 = shl nuw nsw i64 %1050, 24
  %1052 = or i64 %1047, %1051
  %1053 = getelementptr inbounds i8, i8 addrspace(4)* %1016, i64 4
  %1054 = load i8, i8 addrspace(4)* %1053, align 1, !tbaa !14
  %1055 = zext i8 %1054 to i64
  %1056 = shl nuw nsw i64 %1055, 32
  %1057 = or i64 %1052, %1056
  %1058 = getelementptr inbounds i8, i8 addrspace(4)* %1016, i64 5
  %1059 = load i8, i8 addrspace(4)* %1058, align 1, !tbaa !14
  %1060 = zext i8 %1059 to i64
  %1061 = shl nuw nsw i64 %1060, 40
  %1062 = or i64 %1057, %1061
  %1063 = getelementptr inbounds i8, i8 addrspace(4)* %1016, i64 6
  %1064 = load i8, i8 addrspace(4)* %1063, align 1, !tbaa !14
  %1065 = zext i8 %1064 to i64
  %1066 = shl nuw nsw i64 %1065, 48
  %1067 = or i64 %1062, %1066
  %1068 = getelementptr inbounds i8, i8 addrspace(4)* %1016, i64 7
  %1069 = load i8, i8 addrspace(4)* %1068, align 1, !tbaa !14
  %1070 = zext i8 %1069 to i64
  %1071 = shl nuw i64 %1070, 56
  %1072 = or i64 %1067, %1071
  %1073 = add nsw i32 %1017, -8
  %1074 = getelementptr inbounds i8, i8 addrspace(4)* %1016, i64 8
  br label %1075

1075:                                             ; preds = %1022, %1035, %1020
  %1076 = phi i8 addrspace(4)* [ %1074, %1035 ], [ %1016, %1020 ], [ %1016, %1022 ]
  %1077 = phi i32 [ %1073, %1035 ], [ 0, %1020 ], [ 0, %1022 ]
  %1078 = phi i64 [ %1072, %1035 ], [ 0, %1020 ], [ %1032, %1022 ]
  %1079 = icmp ugt i32 %1077, 7
  br i1 %1079, label %1095, label %1080

1080:                                             ; preds = %1075
  %1081 = icmp eq i32 %1077, 0
  br i1 %1081, label %1135, label %1082

1082:                                             ; preds = %1080, %1082
  %1083 = phi i32 [ %1093, %1082 ], [ 0, %1080 ]
  %1084 = phi i64 [ %1092, %1082 ], [ 0, %1080 ]
  %1085 = zext i32 %1083 to i64
  %1086 = getelementptr inbounds i8, i8 addrspace(4)* %1076, i64 %1085
  %1087 = load i8, i8 addrspace(4)* %1086, align 1, !tbaa !14
  %1088 = zext i8 %1087 to i64
  %1089 = shl i32 %1083, 3
  %1090 = zext i32 %1089 to i64
  %1091 = shl nuw i64 %1088, %1090
  %1092 = or i64 %1091, %1084
  %1093 = add nuw nsw i32 %1083, 1
  %1094 = icmp eq i32 %1093, %1077
  br i1 %1094, label %1135, label %1082

1095:                                             ; preds = %1075
  %1096 = load i8, i8 addrspace(4)* %1076, align 1, !tbaa !14
  %1097 = zext i8 %1096 to i64
  %1098 = getelementptr inbounds i8, i8 addrspace(4)* %1076, i64 1
  %1099 = load i8, i8 addrspace(4)* %1098, align 1, !tbaa !14
  %1100 = zext i8 %1099 to i64
  %1101 = shl nuw nsw i64 %1100, 8
  %1102 = or i64 %1101, %1097
  %1103 = getelementptr inbounds i8, i8 addrspace(4)* %1076, i64 2
  %1104 = load i8, i8 addrspace(4)* %1103, align 1, !tbaa !14
  %1105 = zext i8 %1104 to i64
  %1106 = shl nuw nsw i64 %1105, 16
  %1107 = or i64 %1102, %1106
  %1108 = getelementptr inbounds i8, i8 addrspace(4)* %1076, i64 3
  %1109 = load i8, i8 addrspace(4)* %1108, align 1, !tbaa !14
  %1110 = zext i8 %1109 to i64
  %1111 = shl nuw nsw i64 %1110, 24
  %1112 = or i64 %1107, %1111
  %1113 = getelementptr inbounds i8, i8 addrspace(4)* %1076, i64 4
  %1114 = load i8, i8 addrspace(4)* %1113, align 1, !tbaa !14
  %1115 = zext i8 %1114 to i64
  %1116 = shl nuw nsw i64 %1115, 32
  %1117 = or i64 %1112, %1116
  %1118 = getelementptr inbounds i8, i8 addrspace(4)* %1076, i64 5
  %1119 = load i8, i8 addrspace(4)* %1118, align 1, !tbaa !14
  %1120 = zext i8 %1119 to i64
  %1121 = shl nuw nsw i64 %1120, 40
  %1122 = or i64 %1117, %1121
  %1123 = getelementptr inbounds i8, i8 addrspace(4)* %1076, i64 6
  %1124 = load i8, i8 addrspace(4)* %1123, align 1, !tbaa !14
  %1125 = zext i8 %1124 to i64
  %1126 = shl nuw nsw i64 %1125, 48
  %1127 = or i64 %1122, %1126
  %1128 = getelementptr inbounds i8, i8 addrspace(4)* %1076, i64 7
  %1129 = load i8, i8 addrspace(4)* %1128, align 1, !tbaa !14
  %1130 = zext i8 %1129 to i64
  %1131 = shl nuw i64 %1130, 56
  %1132 = or i64 %1127, %1131
  %1133 = add nsw i32 %1077, -8
  %1134 = getelementptr inbounds i8, i8 addrspace(4)* %1076, i64 8
  br label %1135

1135:                                             ; preds = %1082, %1095, %1080
  %1136 = phi i8 addrspace(4)* [ %1134, %1095 ], [ %1076, %1080 ], [ %1076, %1082 ]
  %1137 = phi i32 [ %1133, %1095 ], [ 0, %1080 ], [ 0, %1082 ]
  %1138 = phi i64 [ %1132, %1095 ], [ 0, %1080 ], [ %1092, %1082 ]
  %1139 = icmp ugt i32 %1137, 7
  br i1 %1139, label %1155, label %1140

1140:                                             ; preds = %1135
  %1141 = icmp eq i32 %1137, 0
  br i1 %1141, label %1195, label %1142

1142:                                             ; preds = %1140, %1142
  %1143 = phi i32 [ %1153, %1142 ], [ 0, %1140 ]
  %1144 = phi i64 [ %1152, %1142 ], [ 0, %1140 ]
  %1145 = zext i32 %1143 to i64
  %1146 = getelementptr inbounds i8, i8 addrspace(4)* %1136, i64 %1145
  %1147 = load i8, i8 addrspace(4)* %1146, align 1, !tbaa !14
  %1148 = zext i8 %1147 to i64
  %1149 = shl i32 %1143, 3
  %1150 = zext i32 %1149 to i64
  %1151 = shl nuw i64 %1148, %1150
  %1152 = or i64 %1151, %1144
  %1153 = add nuw nsw i32 %1143, 1
  %1154 = icmp eq i32 %1153, %1137
  br i1 %1154, label %1195, label %1142

1155:                                             ; preds = %1135
  %1156 = load i8, i8 addrspace(4)* %1136, align 1, !tbaa !14
  %1157 = zext i8 %1156 to i64
  %1158 = getelementptr inbounds i8, i8 addrspace(4)* %1136, i64 1
  %1159 = load i8, i8 addrspace(4)* %1158, align 1, !tbaa !14
  %1160 = zext i8 %1159 to i64
  %1161 = shl nuw nsw i64 %1160, 8
  %1162 = or i64 %1161, %1157
  %1163 = getelementptr inbounds i8, i8 addrspace(4)* %1136, i64 2
  %1164 = load i8, i8 addrspace(4)* %1163, align 1, !tbaa !14
  %1165 = zext i8 %1164 to i64
  %1166 = shl nuw nsw i64 %1165, 16
  %1167 = or i64 %1162, %1166
  %1168 = getelementptr inbounds i8, i8 addrspace(4)* %1136, i64 3
  %1169 = load i8, i8 addrspace(4)* %1168, align 1, !tbaa !14
  %1170 = zext i8 %1169 to i64
  %1171 = shl nuw nsw i64 %1170, 24
  %1172 = or i64 %1167, %1171
  %1173 = getelementptr inbounds i8, i8 addrspace(4)* %1136, i64 4
  %1174 = load i8, i8 addrspace(4)* %1173, align 1, !tbaa !14
  %1175 = zext i8 %1174 to i64
  %1176 = shl nuw nsw i64 %1175, 32
  %1177 = or i64 %1172, %1176
  %1178 = getelementptr inbounds i8, i8 addrspace(4)* %1136, i64 5
  %1179 = load i8, i8 addrspace(4)* %1178, align 1, !tbaa !14
  %1180 = zext i8 %1179 to i64
  %1181 = shl nuw nsw i64 %1180, 40
  %1182 = or i64 %1177, %1181
  %1183 = getelementptr inbounds i8, i8 addrspace(4)* %1136, i64 6
  %1184 = load i8, i8 addrspace(4)* %1183, align 1, !tbaa !14
  %1185 = zext i8 %1184 to i64
  %1186 = shl nuw nsw i64 %1185, 48
  %1187 = or i64 %1182, %1186
  %1188 = getelementptr inbounds i8, i8 addrspace(4)* %1136, i64 7
  %1189 = load i8, i8 addrspace(4)* %1188, align 1, !tbaa !14
  %1190 = zext i8 %1189 to i64
  %1191 = shl nuw i64 %1190, 56
  %1192 = or i64 %1187, %1191
  %1193 = add nsw i32 %1137, -8
  %1194 = getelementptr inbounds i8, i8 addrspace(4)* %1136, i64 8
  br label %1195

1195:                                             ; preds = %1142, %1155, %1140
  %1196 = phi i8 addrspace(4)* [ %1194, %1155 ], [ %1136, %1140 ], [ %1136, %1142 ]
  %1197 = phi i32 [ %1193, %1155 ], [ 0, %1140 ], [ 0, %1142 ]
  %1198 = phi i64 [ %1192, %1155 ], [ 0, %1140 ], [ %1152, %1142 ]
  %1199 = icmp ugt i32 %1197, 7
  br i1 %1199, label %1215, label %1200

1200:                                             ; preds = %1195
  %1201 = icmp eq i32 %1197, 0
  br i1 %1201, label %1255, label %1202

1202:                                             ; preds = %1200, %1202
  %1203 = phi i32 [ %1213, %1202 ], [ 0, %1200 ]
  %1204 = phi i64 [ %1212, %1202 ], [ 0, %1200 ]
  %1205 = zext i32 %1203 to i64
  %1206 = getelementptr inbounds i8, i8 addrspace(4)* %1196, i64 %1205
  %1207 = load i8, i8 addrspace(4)* %1206, align 1, !tbaa !14
  %1208 = zext i8 %1207 to i64
  %1209 = shl i32 %1203, 3
  %1210 = zext i32 %1209 to i64
  %1211 = shl nuw i64 %1208, %1210
  %1212 = or i64 %1211, %1204
  %1213 = add nuw nsw i32 %1203, 1
  %1214 = icmp eq i32 %1213, %1197
  br i1 %1214, label %1255, label %1202

1215:                                             ; preds = %1195
  %1216 = load i8, i8 addrspace(4)* %1196, align 1, !tbaa !14
  %1217 = zext i8 %1216 to i64
  %1218 = getelementptr inbounds i8, i8 addrspace(4)* %1196, i64 1
  %1219 = load i8, i8 addrspace(4)* %1218, align 1, !tbaa !14
  %1220 = zext i8 %1219 to i64
  %1221 = shl nuw nsw i64 %1220, 8
  %1222 = or i64 %1221, %1217
  %1223 = getelementptr inbounds i8, i8 addrspace(4)* %1196, i64 2
  %1224 = load i8, i8 addrspace(4)* %1223, align 1, !tbaa !14
  %1225 = zext i8 %1224 to i64
  %1226 = shl nuw nsw i64 %1225, 16
  %1227 = or i64 %1222, %1226
  %1228 = getelementptr inbounds i8, i8 addrspace(4)* %1196, i64 3
  %1229 = load i8, i8 addrspace(4)* %1228, align 1, !tbaa !14
  %1230 = zext i8 %1229 to i64
  %1231 = shl nuw nsw i64 %1230, 24
  %1232 = or i64 %1227, %1231
  %1233 = getelementptr inbounds i8, i8 addrspace(4)* %1196, i64 4
  %1234 = load i8, i8 addrspace(4)* %1233, align 1, !tbaa !14
  %1235 = zext i8 %1234 to i64
  %1236 = shl nuw nsw i64 %1235, 32
  %1237 = or i64 %1232, %1236
  %1238 = getelementptr inbounds i8, i8 addrspace(4)* %1196, i64 5
  %1239 = load i8, i8 addrspace(4)* %1238, align 1, !tbaa !14
  %1240 = zext i8 %1239 to i64
  %1241 = shl nuw nsw i64 %1240, 40
  %1242 = or i64 %1237, %1241
  %1243 = getelementptr inbounds i8, i8 addrspace(4)* %1196, i64 6
  %1244 = load i8, i8 addrspace(4)* %1243, align 1, !tbaa !14
  %1245 = zext i8 %1244 to i64
  %1246 = shl nuw nsw i64 %1245, 48
  %1247 = or i64 %1242, %1246
  %1248 = getelementptr inbounds i8, i8 addrspace(4)* %1196, i64 7
  %1249 = load i8, i8 addrspace(4)* %1248, align 1, !tbaa !14
  %1250 = zext i8 %1249 to i64
  %1251 = shl nuw i64 %1250, 56
  %1252 = or i64 %1247, %1251
  %1253 = add nsw i32 %1197, -8
  %1254 = getelementptr inbounds i8, i8 addrspace(4)* %1196, i64 8
  br label %1255

1255:                                             ; preds = %1202, %1215, %1200
  %1256 = phi i8 addrspace(4)* [ %1254, %1215 ], [ %1196, %1200 ], [ %1196, %1202 ]
  %1257 = phi i32 [ %1253, %1215 ], [ 0, %1200 ], [ 0, %1202 ]
  %1258 = phi i64 [ %1252, %1215 ], [ 0, %1200 ], [ %1212, %1202 ]
  %1259 = icmp ugt i32 %1257, 7
  br i1 %1259, label %1275, label %1260

1260:                                             ; preds = %1255
  %1261 = icmp eq i32 %1257, 0
  br i1 %1261, label %1315, label %1262

1262:                                             ; preds = %1260, %1262
  %1263 = phi i32 [ %1273, %1262 ], [ 0, %1260 ]
  %1264 = phi i64 [ %1272, %1262 ], [ 0, %1260 ]
  %1265 = zext i32 %1263 to i64
  %1266 = getelementptr inbounds i8, i8 addrspace(4)* %1256, i64 %1265
  %1267 = load i8, i8 addrspace(4)* %1266, align 1, !tbaa !14
  %1268 = zext i8 %1267 to i64
  %1269 = shl i32 %1263, 3
  %1270 = zext i32 %1269 to i64
  %1271 = shl nuw i64 %1268, %1270
  %1272 = or i64 %1271, %1264
  %1273 = add nuw nsw i32 %1263, 1
  %1274 = icmp eq i32 %1273, %1257
  br i1 %1274, label %1315, label %1262

1275:                                             ; preds = %1255
  %1276 = load i8, i8 addrspace(4)* %1256, align 1, !tbaa !14
  %1277 = zext i8 %1276 to i64
  %1278 = getelementptr inbounds i8, i8 addrspace(4)* %1256, i64 1
  %1279 = load i8, i8 addrspace(4)* %1278, align 1, !tbaa !14
  %1280 = zext i8 %1279 to i64
  %1281 = shl nuw nsw i64 %1280, 8
  %1282 = or i64 %1281, %1277
  %1283 = getelementptr inbounds i8, i8 addrspace(4)* %1256, i64 2
  %1284 = load i8, i8 addrspace(4)* %1283, align 1, !tbaa !14
  %1285 = zext i8 %1284 to i64
  %1286 = shl nuw nsw i64 %1285, 16
  %1287 = or i64 %1282, %1286
  %1288 = getelementptr inbounds i8, i8 addrspace(4)* %1256, i64 3
  %1289 = load i8, i8 addrspace(4)* %1288, align 1, !tbaa !14
  %1290 = zext i8 %1289 to i64
  %1291 = shl nuw nsw i64 %1290, 24
  %1292 = or i64 %1287, %1291
  %1293 = getelementptr inbounds i8, i8 addrspace(4)* %1256, i64 4
  %1294 = load i8, i8 addrspace(4)* %1293, align 1, !tbaa !14
  %1295 = zext i8 %1294 to i64
  %1296 = shl nuw nsw i64 %1295, 32
  %1297 = or i64 %1292, %1296
  %1298 = getelementptr inbounds i8, i8 addrspace(4)* %1256, i64 5
  %1299 = load i8, i8 addrspace(4)* %1298, align 1, !tbaa !14
  %1300 = zext i8 %1299 to i64
  %1301 = shl nuw nsw i64 %1300, 40
  %1302 = or i64 %1297, %1301
  %1303 = getelementptr inbounds i8, i8 addrspace(4)* %1256, i64 6
  %1304 = load i8, i8 addrspace(4)* %1303, align 1, !tbaa !14
  %1305 = zext i8 %1304 to i64
  %1306 = shl nuw nsw i64 %1305, 48
  %1307 = or i64 %1302, %1306
  %1308 = getelementptr inbounds i8, i8 addrspace(4)* %1256, i64 7
  %1309 = load i8, i8 addrspace(4)* %1308, align 1, !tbaa !14
  %1310 = zext i8 %1309 to i64
  %1311 = shl nuw i64 %1310, 56
  %1312 = or i64 %1307, %1311
  %1313 = add nsw i32 %1257, -8
  %1314 = getelementptr inbounds i8, i8 addrspace(4)* %1256, i64 8
  br label %1315

1315:                                             ; preds = %1262, %1275, %1260
  %1316 = phi i8 addrspace(4)* [ %1314, %1275 ], [ %1256, %1260 ], [ %1256, %1262 ]
  %1317 = phi i32 [ %1313, %1275 ], [ 0, %1260 ], [ 0, %1262 ]
  %1318 = phi i64 [ %1312, %1275 ], [ 0, %1260 ], [ %1272, %1262 ]
  %1319 = icmp ugt i32 %1317, 7
  br i1 %1319, label %1335, label %1320

1320:                                             ; preds = %1315
  %1321 = icmp eq i32 %1317, 0
  br i1 %1321, label %1373, label %1322

1322:                                             ; preds = %1320, %1322
  %1323 = phi i32 [ %1333, %1322 ], [ 0, %1320 ]
  %1324 = phi i64 [ %1332, %1322 ], [ 0, %1320 ]
  %1325 = zext i32 %1323 to i64
  %1326 = getelementptr inbounds i8, i8 addrspace(4)* %1316, i64 %1325
  %1327 = load i8, i8 addrspace(4)* %1326, align 1, !tbaa !14
  %1328 = zext i8 %1327 to i64
  %1329 = shl i32 %1323, 3
  %1330 = zext i32 %1329 to i64
  %1331 = shl nuw i64 %1328, %1330
  %1332 = or i64 %1331, %1324
  %1333 = add nuw nsw i32 %1323, 1
  %1334 = icmp eq i32 %1333, %1317
  br i1 %1334, label %1373, label %1322

1335:                                             ; preds = %1315
  %1336 = load i8, i8 addrspace(4)* %1316, align 1, !tbaa !14
  %1337 = zext i8 %1336 to i64
  %1338 = getelementptr inbounds i8, i8 addrspace(4)* %1316, i64 1
  %1339 = load i8, i8 addrspace(4)* %1338, align 1, !tbaa !14
  %1340 = zext i8 %1339 to i64
  %1341 = shl nuw nsw i64 %1340, 8
  %1342 = or i64 %1341, %1337
  %1343 = getelementptr inbounds i8, i8 addrspace(4)* %1316, i64 2
  %1344 = load i8, i8 addrspace(4)* %1343, align 1, !tbaa !14
  %1345 = zext i8 %1344 to i64
  %1346 = shl nuw nsw i64 %1345, 16
  %1347 = or i64 %1342, %1346
  %1348 = getelementptr inbounds i8, i8 addrspace(4)* %1316, i64 3
  %1349 = load i8, i8 addrspace(4)* %1348, align 1, !tbaa !14
  %1350 = zext i8 %1349 to i64
  %1351 = shl nuw nsw i64 %1350, 24
  %1352 = or i64 %1347, %1351
  %1353 = getelementptr inbounds i8, i8 addrspace(4)* %1316, i64 4
  %1354 = load i8, i8 addrspace(4)* %1353, align 1, !tbaa !14
  %1355 = zext i8 %1354 to i64
  %1356 = shl nuw nsw i64 %1355, 32
  %1357 = or i64 %1352, %1356
  %1358 = getelementptr inbounds i8, i8 addrspace(4)* %1316, i64 5
  %1359 = load i8, i8 addrspace(4)* %1358, align 1, !tbaa !14
  %1360 = zext i8 %1359 to i64
  %1361 = shl nuw nsw i64 %1360, 40
  %1362 = or i64 %1357, %1361
  %1363 = getelementptr inbounds i8, i8 addrspace(4)* %1316, i64 6
  %1364 = load i8, i8 addrspace(4)* %1363, align 1, !tbaa !14
  %1365 = zext i8 %1364 to i64
  %1366 = shl nuw nsw i64 %1365, 48
  %1367 = or i64 %1362, %1366
  %1368 = getelementptr inbounds i8, i8 addrspace(4)* %1316, i64 7
  %1369 = load i8, i8 addrspace(4)* %1368, align 1, !tbaa !14
  %1370 = zext i8 %1369 to i64
  %1371 = shl nuw i64 %1370, 56
  %1372 = or i64 %1367, %1371
  br label %1373

1373:                                             ; preds = %1322, %1335, %1320
  %1374 = phi i64 [ %1372, %1335 ], [ 0, %1320 ], [ %1332, %1322 ]
  %1375 = shl nuw nsw i64 %956, 2
  %1376 = add nuw nsw i64 %1375, 28
  %1377 = and i64 %1376, 480
  %1378 = and i64 %958, -225
  %1379 = or i64 %1378, %1377
  %1380 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %26, i64 noundef %1379, i64 noundef %1018, i64 noundef %1078, i64 noundef %1138, i64 noundef %1198, i64 noundef %1258, i64 noundef %1318, i64 noundef %1374) #11
  %1381 = sub i64 %948, %956
  %1382 = getelementptr inbounds i8, i8 addrspace(4)* %949, i64 %956
  %1383 = icmp eq i64 %1381, 0
  br i1 %1383, label %1388, label %947

1384:                                             ; preds = %931
  %1385 = and i64 %942, -225
  %1386 = or i64 %1385, 32
  %1387 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %26, i64 noundef %1386, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  br label %1388

1388:                                             ; preds = %1373, %1384
  %1389 = phi <2 x i64> [ %1387, %1384 ], [ %1380, %1373 ]
  %1390 = extractelement <2 x i64> %1389, i64 0
  %1391 = and i64 %1390, -227
  %1392 = or i64 %1391, 34
  %1393 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %26, i64 noundef %1392, i64 noundef 2, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %1394 = load i32, i32 addrspace(3)* getelementptr inbounds ([0 x i32], [0 x i32] addrspace(3)* @seme, i32 0, i32 2), align 4, !tbaa !5
  %1395 = mul nsw i32 %1394, %1394
  %1396 = load i32, i32 addrspace(1)* %0, align 4, !tbaa !5
  %1397 = add nsw i32 %1396, %1395
  store i32 %1397, i32 addrspace(1)* %0, align 4, !tbaa !5
  %1398 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %26, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %1399 = extractelement <2 x i64> %1398, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([24 x i8], [24 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), label %1841, label %1400

1400:                                             ; preds = %1388
  %1401 = and i64 %1399, 2
  %1402 = and i64 %1399, -3
  %1403 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %1402, i64 0
  br label %1404

1404:                                             ; preds = %1830, %1400
  %1405 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([24 x i8], [24 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([24 x i8], [24 x i8] addrspace(4)* @.str, i64 0, i64 23) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([24 x i8]* addrspacecast ([24 x i8] addrspace(4)* @.str to [24 x i8]*) to i64)), i64 1))), %1400 ], [ %1838, %1830 ]
  %1406 = phi i8 addrspace(4)* [ getelementptr inbounds ([24 x i8], [24 x i8] addrspace(4)* @.str, i64 0, i64 0), %1400 ], [ %1839, %1830 ]
  %1407 = phi <2 x i64> [ %1403, %1400 ], [ %1837, %1830 ]
  %1408 = icmp ugt i64 %1405, 56
  %1409 = extractelement <2 x i64> %1407, i64 0
  %1410 = or i64 %1409, %1401
  %1411 = insertelement <2 x i64> poison, i64 %1410, i64 0
  %1412 = select i1 %1408, <2 x i64> %1407, <2 x i64> %1411
  %1413 = tail call i64 @llvm.umin.i64(i64 %1405, i64 56)
  %1414 = trunc i64 %1413 to i32
  %1415 = extractelement <2 x i64> %1412, i64 0
  %1416 = icmp ugt i32 %1414, 7
  br i1 %1416, label %1432, label %1417

1417:                                             ; preds = %1404
  %1418 = icmp eq i32 %1414, 0
  br i1 %1418, label %1472, label %1419

1419:                                             ; preds = %1417, %1419
  %1420 = phi i32 [ %1430, %1419 ], [ 0, %1417 ]
  %1421 = phi i64 [ %1429, %1419 ], [ 0, %1417 ]
  %1422 = zext i32 %1420 to i64
  %1423 = getelementptr inbounds i8, i8 addrspace(4)* %1406, i64 %1422
  %1424 = load i8, i8 addrspace(4)* %1423, align 1, !tbaa !14
  %1425 = zext i8 %1424 to i64
  %1426 = shl i32 %1420, 3
  %1427 = zext i32 %1426 to i64
  %1428 = shl nuw i64 %1425, %1427
  %1429 = or i64 %1428, %1421
  %1430 = add nuw nsw i32 %1420, 1
  %1431 = icmp eq i32 %1430, %1414
  br i1 %1431, label %1472, label %1419, !llvm.loop !15

1432:                                             ; preds = %1404
  %1433 = load i8, i8 addrspace(4)* %1406, align 1, !tbaa !14
  %1434 = zext i8 %1433 to i64
  %1435 = getelementptr inbounds i8, i8 addrspace(4)* %1406, i64 1
  %1436 = load i8, i8 addrspace(4)* %1435, align 1, !tbaa !14
  %1437 = zext i8 %1436 to i64
  %1438 = shl nuw nsw i64 %1437, 8
  %1439 = or i64 %1438, %1434
  %1440 = getelementptr inbounds i8, i8 addrspace(4)* %1406, i64 2
  %1441 = load i8, i8 addrspace(4)* %1440, align 1, !tbaa !14
  %1442 = zext i8 %1441 to i64
  %1443 = shl nuw nsw i64 %1442, 16
  %1444 = or i64 %1439, %1443
  %1445 = getelementptr inbounds i8, i8 addrspace(4)* %1406, i64 3
  %1446 = load i8, i8 addrspace(4)* %1445, align 1, !tbaa !14
  %1447 = zext i8 %1446 to i64
  %1448 = shl nuw nsw i64 %1447, 24
  %1449 = or i64 %1444, %1448
  %1450 = getelementptr inbounds i8, i8 addrspace(4)* %1406, i64 4
  %1451 = load i8, i8 addrspace(4)* %1450, align 1, !tbaa !14
  %1452 = zext i8 %1451 to i64
  %1453 = shl nuw nsw i64 %1452, 32
  %1454 = or i64 %1449, %1453
  %1455 = getelementptr inbounds i8, i8 addrspace(4)* %1406, i64 5
  %1456 = load i8, i8 addrspace(4)* %1455, align 1, !tbaa !14
  %1457 = zext i8 %1456 to i64
  %1458 = shl nuw nsw i64 %1457, 40
  %1459 = or i64 %1454, %1458
  %1460 = getelementptr inbounds i8, i8 addrspace(4)* %1406, i64 6
  %1461 = load i8, i8 addrspace(4)* %1460, align 1, !tbaa !14
  %1462 = zext i8 %1461 to i64
  %1463 = shl nuw nsw i64 %1462, 48
  %1464 = or i64 %1459, %1463
  %1465 = getelementptr inbounds i8, i8 addrspace(4)* %1406, i64 7
  %1466 = load i8, i8 addrspace(4)* %1465, align 1, !tbaa !14
  %1467 = zext i8 %1466 to i64
  %1468 = shl nuw i64 %1467, 56
  %1469 = or i64 %1464, %1468
  %1470 = add nsw i32 %1414, -8
  %1471 = getelementptr inbounds i8, i8 addrspace(4)* %1406, i64 8
  br label %1472

1472:                                             ; preds = %1419, %1432, %1417
  %1473 = phi i8 addrspace(4)* [ %1471, %1432 ], [ %1406, %1417 ], [ %1406, %1419 ]
  %1474 = phi i32 [ %1470, %1432 ], [ 0, %1417 ], [ 0, %1419 ]
  %1475 = phi i64 [ %1469, %1432 ], [ 0, %1417 ], [ %1429, %1419 ]
  %1476 = icmp ugt i32 %1474, 7
  br i1 %1476, label %1492, label %1477

1477:                                             ; preds = %1472
  %1478 = icmp eq i32 %1474, 0
  br i1 %1478, label %1532, label %1479

1479:                                             ; preds = %1477, %1479
  %1480 = phi i32 [ %1490, %1479 ], [ 0, %1477 ]
  %1481 = phi i64 [ %1489, %1479 ], [ 0, %1477 ]
  %1482 = zext i32 %1480 to i64
  %1483 = getelementptr inbounds i8, i8 addrspace(4)* %1473, i64 %1482
  %1484 = load i8, i8 addrspace(4)* %1483, align 1, !tbaa !14
  %1485 = zext i8 %1484 to i64
  %1486 = shl i32 %1480, 3
  %1487 = zext i32 %1486 to i64
  %1488 = shl nuw i64 %1485, %1487
  %1489 = or i64 %1488, %1481
  %1490 = add nuw nsw i32 %1480, 1
  %1491 = icmp eq i32 %1490, %1474
  br i1 %1491, label %1532, label %1479

1492:                                             ; preds = %1472
  %1493 = load i8, i8 addrspace(4)* %1473, align 1, !tbaa !14
  %1494 = zext i8 %1493 to i64
  %1495 = getelementptr inbounds i8, i8 addrspace(4)* %1473, i64 1
  %1496 = load i8, i8 addrspace(4)* %1495, align 1, !tbaa !14
  %1497 = zext i8 %1496 to i64
  %1498 = shl nuw nsw i64 %1497, 8
  %1499 = or i64 %1498, %1494
  %1500 = getelementptr inbounds i8, i8 addrspace(4)* %1473, i64 2
  %1501 = load i8, i8 addrspace(4)* %1500, align 1, !tbaa !14
  %1502 = zext i8 %1501 to i64
  %1503 = shl nuw nsw i64 %1502, 16
  %1504 = or i64 %1499, %1503
  %1505 = getelementptr inbounds i8, i8 addrspace(4)* %1473, i64 3
  %1506 = load i8, i8 addrspace(4)* %1505, align 1, !tbaa !14
  %1507 = zext i8 %1506 to i64
  %1508 = shl nuw nsw i64 %1507, 24
  %1509 = or i64 %1504, %1508
  %1510 = getelementptr inbounds i8, i8 addrspace(4)* %1473, i64 4
  %1511 = load i8, i8 addrspace(4)* %1510, align 1, !tbaa !14
  %1512 = zext i8 %1511 to i64
  %1513 = shl nuw nsw i64 %1512, 32
  %1514 = or i64 %1509, %1513
  %1515 = getelementptr inbounds i8, i8 addrspace(4)* %1473, i64 5
  %1516 = load i8, i8 addrspace(4)* %1515, align 1, !tbaa !14
  %1517 = zext i8 %1516 to i64
  %1518 = shl nuw nsw i64 %1517, 40
  %1519 = or i64 %1514, %1518
  %1520 = getelementptr inbounds i8, i8 addrspace(4)* %1473, i64 6
  %1521 = load i8, i8 addrspace(4)* %1520, align 1, !tbaa !14
  %1522 = zext i8 %1521 to i64
  %1523 = shl nuw nsw i64 %1522, 48
  %1524 = or i64 %1519, %1523
  %1525 = getelementptr inbounds i8, i8 addrspace(4)* %1473, i64 7
  %1526 = load i8, i8 addrspace(4)* %1525, align 1, !tbaa !14
  %1527 = zext i8 %1526 to i64
  %1528 = shl nuw i64 %1527, 56
  %1529 = or i64 %1524, %1528
  %1530 = add nsw i32 %1474, -8
  %1531 = getelementptr inbounds i8, i8 addrspace(4)* %1473, i64 8
  br label %1532

1532:                                             ; preds = %1479, %1492, %1477
  %1533 = phi i8 addrspace(4)* [ %1531, %1492 ], [ %1473, %1477 ], [ %1473, %1479 ]
  %1534 = phi i32 [ %1530, %1492 ], [ 0, %1477 ], [ 0, %1479 ]
  %1535 = phi i64 [ %1529, %1492 ], [ 0, %1477 ], [ %1489, %1479 ]
  %1536 = icmp ugt i32 %1534, 7
  br i1 %1536, label %1552, label %1537

1537:                                             ; preds = %1532
  %1538 = icmp eq i32 %1534, 0
  br i1 %1538, label %1592, label %1539

1539:                                             ; preds = %1537, %1539
  %1540 = phi i32 [ %1550, %1539 ], [ 0, %1537 ]
  %1541 = phi i64 [ %1549, %1539 ], [ 0, %1537 ]
  %1542 = zext i32 %1540 to i64
  %1543 = getelementptr inbounds i8, i8 addrspace(4)* %1533, i64 %1542
  %1544 = load i8, i8 addrspace(4)* %1543, align 1, !tbaa !14
  %1545 = zext i8 %1544 to i64
  %1546 = shl i32 %1540, 3
  %1547 = zext i32 %1546 to i64
  %1548 = shl nuw i64 %1545, %1547
  %1549 = or i64 %1548, %1541
  %1550 = add nuw nsw i32 %1540, 1
  %1551 = icmp eq i32 %1550, %1534
  br i1 %1551, label %1592, label %1539

1552:                                             ; preds = %1532
  %1553 = load i8, i8 addrspace(4)* %1533, align 1, !tbaa !14
  %1554 = zext i8 %1553 to i64
  %1555 = getelementptr inbounds i8, i8 addrspace(4)* %1533, i64 1
  %1556 = load i8, i8 addrspace(4)* %1555, align 1, !tbaa !14
  %1557 = zext i8 %1556 to i64
  %1558 = shl nuw nsw i64 %1557, 8
  %1559 = or i64 %1558, %1554
  %1560 = getelementptr inbounds i8, i8 addrspace(4)* %1533, i64 2
  %1561 = load i8, i8 addrspace(4)* %1560, align 1, !tbaa !14
  %1562 = zext i8 %1561 to i64
  %1563 = shl nuw nsw i64 %1562, 16
  %1564 = or i64 %1559, %1563
  %1565 = getelementptr inbounds i8, i8 addrspace(4)* %1533, i64 3
  %1566 = load i8, i8 addrspace(4)* %1565, align 1, !tbaa !14
  %1567 = zext i8 %1566 to i64
  %1568 = shl nuw nsw i64 %1567, 24
  %1569 = or i64 %1564, %1568
  %1570 = getelementptr inbounds i8, i8 addrspace(4)* %1533, i64 4
  %1571 = load i8, i8 addrspace(4)* %1570, align 1, !tbaa !14
  %1572 = zext i8 %1571 to i64
  %1573 = shl nuw nsw i64 %1572, 32
  %1574 = or i64 %1569, %1573
  %1575 = getelementptr inbounds i8, i8 addrspace(4)* %1533, i64 5
  %1576 = load i8, i8 addrspace(4)* %1575, align 1, !tbaa !14
  %1577 = zext i8 %1576 to i64
  %1578 = shl nuw nsw i64 %1577, 40
  %1579 = or i64 %1574, %1578
  %1580 = getelementptr inbounds i8, i8 addrspace(4)* %1533, i64 6
  %1581 = load i8, i8 addrspace(4)* %1580, align 1, !tbaa !14
  %1582 = zext i8 %1581 to i64
  %1583 = shl nuw nsw i64 %1582, 48
  %1584 = or i64 %1579, %1583
  %1585 = getelementptr inbounds i8, i8 addrspace(4)* %1533, i64 7
  %1586 = load i8, i8 addrspace(4)* %1585, align 1, !tbaa !14
  %1587 = zext i8 %1586 to i64
  %1588 = shl nuw i64 %1587, 56
  %1589 = or i64 %1584, %1588
  %1590 = add nsw i32 %1534, -8
  %1591 = getelementptr inbounds i8, i8 addrspace(4)* %1533, i64 8
  br label %1592

1592:                                             ; preds = %1539, %1552, %1537
  %1593 = phi i8 addrspace(4)* [ %1591, %1552 ], [ %1533, %1537 ], [ %1533, %1539 ]
  %1594 = phi i32 [ %1590, %1552 ], [ 0, %1537 ], [ 0, %1539 ]
  %1595 = phi i64 [ %1589, %1552 ], [ 0, %1537 ], [ %1549, %1539 ]
  %1596 = icmp ugt i32 %1594, 7
  br i1 %1596, label %1612, label %1597

1597:                                             ; preds = %1592
  %1598 = icmp eq i32 %1594, 0
  br i1 %1598, label %1652, label %1599

1599:                                             ; preds = %1597, %1599
  %1600 = phi i32 [ %1610, %1599 ], [ 0, %1597 ]
  %1601 = phi i64 [ %1609, %1599 ], [ 0, %1597 ]
  %1602 = zext i32 %1600 to i64
  %1603 = getelementptr inbounds i8, i8 addrspace(4)* %1593, i64 %1602
  %1604 = load i8, i8 addrspace(4)* %1603, align 1, !tbaa !14
  %1605 = zext i8 %1604 to i64
  %1606 = shl i32 %1600, 3
  %1607 = zext i32 %1606 to i64
  %1608 = shl nuw i64 %1605, %1607
  %1609 = or i64 %1608, %1601
  %1610 = add nuw nsw i32 %1600, 1
  %1611 = icmp eq i32 %1610, %1594
  br i1 %1611, label %1652, label %1599

1612:                                             ; preds = %1592
  %1613 = load i8, i8 addrspace(4)* %1593, align 1, !tbaa !14
  %1614 = zext i8 %1613 to i64
  %1615 = getelementptr inbounds i8, i8 addrspace(4)* %1593, i64 1
  %1616 = load i8, i8 addrspace(4)* %1615, align 1, !tbaa !14
  %1617 = zext i8 %1616 to i64
  %1618 = shl nuw nsw i64 %1617, 8
  %1619 = or i64 %1618, %1614
  %1620 = getelementptr inbounds i8, i8 addrspace(4)* %1593, i64 2
  %1621 = load i8, i8 addrspace(4)* %1620, align 1, !tbaa !14
  %1622 = zext i8 %1621 to i64
  %1623 = shl nuw nsw i64 %1622, 16
  %1624 = or i64 %1619, %1623
  %1625 = getelementptr inbounds i8, i8 addrspace(4)* %1593, i64 3
  %1626 = load i8, i8 addrspace(4)* %1625, align 1, !tbaa !14
  %1627 = zext i8 %1626 to i64
  %1628 = shl nuw nsw i64 %1627, 24
  %1629 = or i64 %1624, %1628
  %1630 = getelementptr inbounds i8, i8 addrspace(4)* %1593, i64 4
  %1631 = load i8, i8 addrspace(4)* %1630, align 1, !tbaa !14
  %1632 = zext i8 %1631 to i64
  %1633 = shl nuw nsw i64 %1632, 32
  %1634 = or i64 %1629, %1633
  %1635 = getelementptr inbounds i8, i8 addrspace(4)* %1593, i64 5
  %1636 = load i8, i8 addrspace(4)* %1635, align 1, !tbaa !14
  %1637 = zext i8 %1636 to i64
  %1638 = shl nuw nsw i64 %1637, 40
  %1639 = or i64 %1634, %1638
  %1640 = getelementptr inbounds i8, i8 addrspace(4)* %1593, i64 6
  %1641 = load i8, i8 addrspace(4)* %1640, align 1, !tbaa !14
  %1642 = zext i8 %1641 to i64
  %1643 = shl nuw nsw i64 %1642, 48
  %1644 = or i64 %1639, %1643
  %1645 = getelementptr inbounds i8, i8 addrspace(4)* %1593, i64 7
  %1646 = load i8, i8 addrspace(4)* %1645, align 1, !tbaa !14
  %1647 = zext i8 %1646 to i64
  %1648 = shl nuw i64 %1647, 56
  %1649 = or i64 %1644, %1648
  %1650 = add nsw i32 %1594, -8
  %1651 = getelementptr inbounds i8, i8 addrspace(4)* %1593, i64 8
  br label %1652

1652:                                             ; preds = %1599, %1612, %1597
  %1653 = phi i8 addrspace(4)* [ %1651, %1612 ], [ %1593, %1597 ], [ %1593, %1599 ]
  %1654 = phi i32 [ %1650, %1612 ], [ 0, %1597 ], [ 0, %1599 ]
  %1655 = phi i64 [ %1649, %1612 ], [ 0, %1597 ], [ %1609, %1599 ]
  %1656 = icmp ugt i32 %1654, 7
  br i1 %1656, label %1672, label %1657

1657:                                             ; preds = %1652
  %1658 = icmp eq i32 %1654, 0
  br i1 %1658, label %1712, label %1659

1659:                                             ; preds = %1657, %1659
  %1660 = phi i32 [ %1670, %1659 ], [ 0, %1657 ]
  %1661 = phi i64 [ %1669, %1659 ], [ 0, %1657 ]
  %1662 = zext i32 %1660 to i64
  %1663 = getelementptr inbounds i8, i8 addrspace(4)* %1653, i64 %1662
  %1664 = load i8, i8 addrspace(4)* %1663, align 1, !tbaa !14
  %1665 = zext i8 %1664 to i64
  %1666 = shl i32 %1660, 3
  %1667 = zext i32 %1666 to i64
  %1668 = shl nuw i64 %1665, %1667
  %1669 = or i64 %1668, %1661
  %1670 = add nuw nsw i32 %1660, 1
  %1671 = icmp eq i32 %1670, %1654
  br i1 %1671, label %1712, label %1659

1672:                                             ; preds = %1652
  %1673 = load i8, i8 addrspace(4)* %1653, align 1, !tbaa !14
  %1674 = zext i8 %1673 to i64
  %1675 = getelementptr inbounds i8, i8 addrspace(4)* %1653, i64 1
  %1676 = load i8, i8 addrspace(4)* %1675, align 1, !tbaa !14
  %1677 = zext i8 %1676 to i64
  %1678 = shl nuw nsw i64 %1677, 8
  %1679 = or i64 %1678, %1674
  %1680 = getelementptr inbounds i8, i8 addrspace(4)* %1653, i64 2
  %1681 = load i8, i8 addrspace(4)* %1680, align 1, !tbaa !14
  %1682 = zext i8 %1681 to i64
  %1683 = shl nuw nsw i64 %1682, 16
  %1684 = or i64 %1679, %1683
  %1685 = getelementptr inbounds i8, i8 addrspace(4)* %1653, i64 3
  %1686 = load i8, i8 addrspace(4)* %1685, align 1, !tbaa !14
  %1687 = zext i8 %1686 to i64
  %1688 = shl nuw nsw i64 %1687, 24
  %1689 = or i64 %1684, %1688
  %1690 = getelementptr inbounds i8, i8 addrspace(4)* %1653, i64 4
  %1691 = load i8, i8 addrspace(4)* %1690, align 1, !tbaa !14
  %1692 = zext i8 %1691 to i64
  %1693 = shl nuw nsw i64 %1692, 32
  %1694 = or i64 %1689, %1693
  %1695 = getelementptr inbounds i8, i8 addrspace(4)* %1653, i64 5
  %1696 = load i8, i8 addrspace(4)* %1695, align 1, !tbaa !14
  %1697 = zext i8 %1696 to i64
  %1698 = shl nuw nsw i64 %1697, 40
  %1699 = or i64 %1694, %1698
  %1700 = getelementptr inbounds i8, i8 addrspace(4)* %1653, i64 6
  %1701 = load i8, i8 addrspace(4)* %1700, align 1, !tbaa !14
  %1702 = zext i8 %1701 to i64
  %1703 = shl nuw nsw i64 %1702, 48
  %1704 = or i64 %1699, %1703
  %1705 = getelementptr inbounds i8, i8 addrspace(4)* %1653, i64 7
  %1706 = load i8, i8 addrspace(4)* %1705, align 1, !tbaa !14
  %1707 = zext i8 %1706 to i64
  %1708 = shl nuw i64 %1707, 56
  %1709 = or i64 %1704, %1708
  %1710 = add nsw i32 %1654, -8
  %1711 = getelementptr inbounds i8, i8 addrspace(4)* %1653, i64 8
  br label %1712

1712:                                             ; preds = %1659, %1672, %1657
  %1713 = phi i8 addrspace(4)* [ %1711, %1672 ], [ %1653, %1657 ], [ %1653, %1659 ]
  %1714 = phi i32 [ %1710, %1672 ], [ 0, %1657 ], [ 0, %1659 ]
  %1715 = phi i64 [ %1709, %1672 ], [ 0, %1657 ], [ %1669, %1659 ]
  %1716 = icmp ugt i32 %1714, 7
  br i1 %1716, label %1732, label %1717

1717:                                             ; preds = %1712
  %1718 = icmp eq i32 %1714, 0
  br i1 %1718, label %1772, label %1719

1719:                                             ; preds = %1717, %1719
  %1720 = phi i32 [ %1730, %1719 ], [ 0, %1717 ]
  %1721 = phi i64 [ %1729, %1719 ], [ 0, %1717 ]
  %1722 = zext i32 %1720 to i64
  %1723 = getelementptr inbounds i8, i8 addrspace(4)* %1713, i64 %1722
  %1724 = load i8, i8 addrspace(4)* %1723, align 1, !tbaa !14
  %1725 = zext i8 %1724 to i64
  %1726 = shl i32 %1720, 3
  %1727 = zext i32 %1726 to i64
  %1728 = shl nuw i64 %1725, %1727
  %1729 = or i64 %1728, %1721
  %1730 = add nuw nsw i32 %1720, 1
  %1731 = icmp eq i32 %1730, %1714
  br i1 %1731, label %1772, label %1719

1732:                                             ; preds = %1712
  %1733 = load i8, i8 addrspace(4)* %1713, align 1, !tbaa !14
  %1734 = zext i8 %1733 to i64
  %1735 = getelementptr inbounds i8, i8 addrspace(4)* %1713, i64 1
  %1736 = load i8, i8 addrspace(4)* %1735, align 1, !tbaa !14
  %1737 = zext i8 %1736 to i64
  %1738 = shl nuw nsw i64 %1737, 8
  %1739 = or i64 %1738, %1734
  %1740 = getelementptr inbounds i8, i8 addrspace(4)* %1713, i64 2
  %1741 = load i8, i8 addrspace(4)* %1740, align 1, !tbaa !14
  %1742 = zext i8 %1741 to i64
  %1743 = shl nuw nsw i64 %1742, 16
  %1744 = or i64 %1739, %1743
  %1745 = getelementptr inbounds i8, i8 addrspace(4)* %1713, i64 3
  %1746 = load i8, i8 addrspace(4)* %1745, align 1, !tbaa !14
  %1747 = zext i8 %1746 to i64
  %1748 = shl nuw nsw i64 %1747, 24
  %1749 = or i64 %1744, %1748
  %1750 = getelementptr inbounds i8, i8 addrspace(4)* %1713, i64 4
  %1751 = load i8, i8 addrspace(4)* %1750, align 1, !tbaa !14
  %1752 = zext i8 %1751 to i64
  %1753 = shl nuw nsw i64 %1752, 32
  %1754 = or i64 %1749, %1753
  %1755 = getelementptr inbounds i8, i8 addrspace(4)* %1713, i64 5
  %1756 = load i8, i8 addrspace(4)* %1755, align 1, !tbaa !14
  %1757 = zext i8 %1756 to i64
  %1758 = shl nuw nsw i64 %1757, 40
  %1759 = or i64 %1754, %1758
  %1760 = getelementptr inbounds i8, i8 addrspace(4)* %1713, i64 6
  %1761 = load i8, i8 addrspace(4)* %1760, align 1, !tbaa !14
  %1762 = zext i8 %1761 to i64
  %1763 = shl nuw nsw i64 %1762, 48
  %1764 = or i64 %1759, %1763
  %1765 = getelementptr inbounds i8, i8 addrspace(4)* %1713, i64 7
  %1766 = load i8, i8 addrspace(4)* %1765, align 1, !tbaa !14
  %1767 = zext i8 %1766 to i64
  %1768 = shl nuw i64 %1767, 56
  %1769 = or i64 %1764, %1768
  %1770 = add nsw i32 %1714, -8
  %1771 = getelementptr inbounds i8, i8 addrspace(4)* %1713, i64 8
  br label %1772

1772:                                             ; preds = %1719, %1732, %1717
  %1773 = phi i8 addrspace(4)* [ %1771, %1732 ], [ %1713, %1717 ], [ %1713, %1719 ]
  %1774 = phi i32 [ %1770, %1732 ], [ 0, %1717 ], [ 0, %1719 ]
  %1775 = phi i64 [ %1769, %1732 ], [ 0, %1717 ], [ %1729, %1719 ]
  %1776 = icmp ugt i32 %1774, 7
  br i1 %1776, label %1792, label %1777

1777:                                             ; preds = %1772
  %1778 = icmp eq i32 %1774, 0
  br i1 %1778, label %1830, label %1779

1779:                                             ; preds = %1777, %1779
  %1780 = phi i32 [ %1790, %1779 ], [ 0, %1777 ]
  %1781 = phi i64 [ %1789, %1779 ], [ 0, %1777 ]
  %1782 = zext i32 %1780 to i64
  %1783 = getelementptr inbounds i8, i8 addrspace(4)* %1773, i64 %1782
  %1784 = load i8, i8 addrspace(4)* %1783, align 1, !tbaa !14
  %1785 = zext i8 %1784 to i64
  %1786 = shl i32 %1780, 3
  %1787 = zext i32 %1786 to i64
  %1788 = shl nuw i64 %1785, %1787
  %1789 = or i64 %1788, %1781
  %1790 = add nuw nsw i32 %1780, 1
  %1791 = icmp eq i32 %1790, %1774
  br i1 %1791, label %1830, label %1779

1792:                                             ; preds = %1772
  %1793 = load i8, i8 addrspace(4)* %1773, align 1, !tbaa !14
  %1794 = zext i8 %1793 to i64
  %1795 = getelementptr inbounds i8, i8 addrspace(4)* %1773, i64 1
  %1796 = load i8, i8 addrspace(4)* %1795, align 1, !tbaa !14
  %1797 = zext i8 %1796 to i64
  %1798 = shl nuw nsw i64 %1797, 8
  %1799 = or i64 %1798, %1794
  %1800 = getelementptr inbounds i8, i8 addrspace(4)* %1773, i64 2
  %1801 = load i8, i8 addrspace(4)* %1800, align 1, !tbaa !14
  %1802 = zext i8 %1801 to i64
  %1803 = shl nuw nsw i64 %1802, 16
  %1804 = or i64 %1799, %1803
  %1805 = getelementptr inbounds i8, i8 addrspace(4)* %1773, i64 3
  %1806 = load i8, i8 addrspace(4)* %1805, align 1, !tbaa !14
  %1807 = zext i8 %1806 to i64
  %1808 = shl nuw nsw i64 %1807, 24
  %1809 = or i64 %1804, %1808
  %1810 = getelementptr inbounds i8, i8 addrspace(4)* %1773, i64 4
  %1811 = load i8, i8 addrspace(4)* %1810, align 1, !tbaa !14
  %1812 = zext i8 %1811 to i64
  %1813 = shl nuw nsw i64 %1812, 32
  %1814 = or i64 %1809, %1813
  %1815 = getelementptr inbounds i8, i8 addrspace(4)* %1773, i64 5
  %1816 = load i8, i8 addrspace(4)* %1815, align 1, !tbaa !14
  %1817 = zext i8 %1816 to i64
  %1818 = shl nuw nsw i64 %1817, 40
  %1819 = or i64 %1814, %1818
  %1820 = getelementptr inbounds i8, i8 addrspace(4)* %1773, i64 6
  %1821 = load i8, i8 addrspace(4)* %1820, align 1, !tbaa !14
  %1822 = zext i8 %1821 to i64
  %1823 = shl nuw nsw i64 %1822, 48
  %1824 = or i64 %1819, %1823
  %1825 = getelementptr inbounds i8, i8 addrspace(4)* %1773, i64 7
  %1826 = load i8, i8 addrspace(4)* %1825, align 1, !tbaa !14
  %1827 = zext i8 %1826 to i64
  %1828 = shl nuw i64 %1827, 56
  %1829 = or i64 %1824, %1828
  br label %1830

1830:                                             ; preds = %1779, %1792, %1777
  %1831 = phi i64 [ %1829, %1792 ], [ 0, %1777 ], [ %1789, %1779 ]
  %1832 = shl nuw nsw i64 %1413, 2
  %1833 = add nuw nsw i64 %1832, 28
  %1834 = and i64 %1833, 480
  %1835 = and i64 %1415, -225
  %1836 = or i64 %1835, %1834
  %1837 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %26, i64 noundef %1836, i64 noundef %1475, i64 noundef %1535, i64 noundef %1595, i64 noundef %1655, i64 noundef %1715, i64 noundef %1775, i64 noundef %1831) #11
  %1838 = sub i64 %1405, %1413
  %1839 = getelementptr inbounds i8, i8 addrspace(4)* %1406, i64 %1413
  %1840 = icmp eq i64 %1838, 0
  br i1 %1840, label %1845, label %1404

1841:                                             ; preds = %1388
  %1842 = and i64 %1399, -225
  %1843 = or i64 %1842, 32
  %1844 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %26, i64 noundef %1843, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  br label %1845

1845:                                             ; preds = %1830, %1841
  %1846 = phi <2 x i64> [ %1844, %1841 ], [ %1837, %1830 ]
  %1847 = extractelement <2 x i64> %1846, i64 0
  %1848 = and i64 %1847, -227
  %1849 = or i64 %1848, 34
  %1850 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %26, i64 noundef %1849, i64 noundef 3, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %1851 = load i32, i32 addrspace(3)* getelementptr inbounds ([0 x i32], [0 x i32] addrspace(3)* @seme, i32 0, i32 3), align 4, !tbaa !5
  %1852 = mul nsw i32 %1851, %1851
  %1853 = load i32, i32 addrspace(1)* %0, align 4, !tbaa !5
  %1854 = add nsw i32 %1853, %1852
  store i32 %1854, i32 addrspace(1)* %0, align 4, !tbaa !5
  %1855 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %26, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %1856 = extractelement <2 x i64> %1855, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([24 x i8], [24 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), label %2298, label %1857

1857:                                             ; preds = %1845
  %1858 = and i64 %1856, 2
  %1859 = and i64 %1856, -3
  %1860 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %1859, i64 0
  br label %1861

1861:                                             ; preds = %2287, %1857
  %1862 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([24 x i8], [24 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([24 x i8], [24 x i8] addrspace(4)* @.str, i64 0, i64 23) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([24 x i8]* addrspacecast ([24 x i8] addrspace(4)* @.str to [24 x i8]*) to i64)), i64 1))), %1857 ], [ %2295, %2287 ]
  %1863 = phi i8 addrspace(4)* [ getelementptr inbounds ([24 x i8], [24 x i8] addrspace(4)* @.str, i64 0, i64 0), %1857 ], [ %2296, %2287 ]
  %1864 = phi <2 x i64> [ %1860, %1857 ], [ %2294, %2287 ]
  %1865 = icmp ugt i64 %1862, 56
  %1866 = extractelement <2 x i64> %1864, i64 0
  %1867 = or i64 %1866, %1858
  %1868 = insertelement <2 x i64> poison, i64 %1867, i64 0
  %1869 = select i1 %1865, <2 x i64> %1864, <2 x i64> %1868
  %1870 = tail call i64 @llvm.umin.i64(i64 %1862, i64 56)
  %1871 = trunc i64 %1870 to i32
  %1872 = extractelement <2 x i64> %1869, i64 0
  %1873 = icmp ugt i32 %1871, 7
  br i1 %1873, label %1889, label %1874

1874:                                             ; preds = %1861
  %1875 = icmp eq i32 %1871, 0
  br i1 %1875, label %1929, label %1876

1876:                                             ; preds = %1874, %1876
  %1877 = phi i32 [ %1887, %1876 ], [ 0, %1874 ]
  %1878 = phi i64 [ %1886, %1876 ], [ 0, %1874 ]
  %1879 = zext i32 %1877 to i64
  %1880 = getelementptr inbounds i8, i8 addrspace(4)* %1863, i64 %1879
  %1881 = load i8, i8 addrspace(4)* %1880, align 1, !tbaa !14
  %1882 = zext i8 %1881 to i64
  %1883 = shl i32 %1877, 3
  %1884 = zext i32 %1883 to i64
  %1885 = shl nuw i64 %1882, %1884
  %1886 = or i64 %1885, %1878
  %1887 = add nuw nsw i32 %1877, 1
  %1888 = icmp eq i32 %1887, %1871
  br i1 %1888, label %1929, label %1876, !llvm.loop !15

1889:                                             ; preds = %1861
  %1890 = load i8, i8 addrspace(4)* %1863, align 1, !tbaa !14
  %1891 = zext i8 %1890 to i64
  %1892 = getelementptr inbounds i8, i8 addrspace(4)* %1863, i64 1
  %1893 = load i8, i8 addrspace(4)* %1892, align 1, !tbaa !14
  %1894 = zext i8 %1893 to i64
  %1895 = shl nuw nsw i64 %1894, 8
  %1896 = or i64 %1895, %1891
  %1897 = getelementptr inbounds i8, i8 addrspace(4)* %1863, i64 2
  %1898 = load i8, i8 addrspace(4)* %1897, align 1, !tbaa !14
  %1899 = zext i8 %1898 to i64
  %1900 = shl nuw nsw i64 %1899, 16
  %1901 = or i64 %1896, %1900
  %1902 = getelementptr inbounds i8, i8 addrspace(4)* %1863, i64 3
  %1903 = load i8, i8 addrspace(4)* %1902, align 1, !tbaa !14
  %1904 = zext i8 %1903 to i64
  %1905 = shl nuw nsw i64 %1904, 24
  %1906 = or i64 %1901, %1905
  %1907 = getelementptr inbounds i8, i8 addrspace(4)* %1863, i64 4
  %1908 = load i8, i8 addrspace(4)* %1907, align 1, !tbaa !14
  %1909 = zext i8 %1908 to i64
  %1910 = shl nuw nsw i64 %1909, 32
  %1911 = or i64 %1906, %1910
  %1912 = getelementptr inbounds i8, i8 addrspace(4)* %1863, i64 5
  %1913 = load i8, i8 addrspace(4)* %1912, align 1, !tbaa !14
  %1914 = zext i8 %1913 to i64
  %1915 = shl nuw nsw i64 %1914, 40
  %1916 = or i64 %1911, %1915
  %1917 = getelementptr inbounds i8, i8 addrspace(4)* %1863, i64 6
  %1918 = load i8, i8 addrspace(4)* %1917, align 1, !tbaa !14
  %1919 = zext i8 %1918 to i64
  %1920 = shl nuw nsw i64 %1919, 48
  %1921 = or i64 %1916, %1920
  %1922 = getelementptr inbounds i8, i8 addrspace(4)* %1863, i64 7
  %1923 = load i8, i8 addrspace(4)* %1922, align 1, !tbaa !14
  %1924 = zext i8 %1923 to i64
  %1925 = shl nuw i64 %1924, 56
  %1926 = or i64 %1921, %1925
  %1927 = add nsw i32 %1871, -8
  %1928 = getelementptr inbounds i8, i8 addrspace(4)* %1863, i64 8
  br label %1929

1929:                                             ; preds = %1876, %1889, %1874
  %1930 = phi i8 addrspace(4)* [ %1928, %1889 ], [ %1863, %1874 ], [ %1863, %1876 ]
  %1931 = phi i32 [ %1927, %1889 ], [ 0, %1874 ], [ 0, %1876 ]
  %1932 = phi i64 [ %1926, %1889 ], [ 0, %1874 ], [ %1886, %1876 ]
  %1933 = icmp ugt i32 %1931, 7
  br i1 %1933, label %1949, label %1934

1934:                                             ; preds = %1929
  %1935 = icmp eq i32 %1931, 0
  br i1 %1935, label %1989, label %1936

1936:                                             ; preds = %1934, %1936
  %1937 = phi i32 [ %1947, %1936 ], [ 0, %1934 ]
  %1938 = phi i64 [ %1946, %1936 ], [ 0, %1934 ]
  %1939 = zext i32 %1937 to i64
  %1940 = getelementptr inbounds i8, i8 addrspace(4)* %1930, i64 %1939
  %1941 = load i8, i8 addrspace(4)* %1940, align 1, !tbaa !14
  %1942 = zext i8 %1941 to i64
  %1943 = shl i32 %1937, 3
  %1944 = zext i32 %1943 to i64
  %1945 = shl nuw i64 %1942, %1944
  %1946 = or i64 %1945, %1938
  %1947 = add nuw nsw i32 %1937, 1
  %1948 = icmp eq i32 %1947, %1931
  br i1 %1948, label %1989, label %1936

1949:                                             ; preds = %1929
  %1950 = load i8, i8 addrspace(4)* %1930, align 1, !tbaa !14
  %1951 = zext i8 %1950 to i64
  %1952 = getelementptr inbounds i8, i8 addrspace(4)* %1930, i64 1
  %1953 = load i8, i8 addrspace(4)* %1952, align 1, !tbaa !14
  %1954 = zext i8 %1953 to i64
  %1955 = shl nuw nsw i64 %1954, 8
  %1956 = or i64 %1955, %1951
  %1957 = getelementptr inbounds i8, i8 addrspace(4)* %1930, i64 2
  %1958 = load i8, i8 addrspace(4)* %1957, align 1, !tbaa !14
  %1959 = zext i8 %1958 to i64
  %1960 = shl nuw nsw i64 %1959, 16
  %1961 = or i64 %1956, %1960
  %1962 = getelementptr inbounds i8, i8 addrspace(4)* %1930, i64 3
  %1963 = load i8, i8 addrspace(4)* %1962, align 1, !tbaa !14
  %1964 = zext i8 %1963 to i64
  %1965 = shl nuw nsw i64 %1964, 24
  %1966 = or i64 %1961, %1965
  %1967 = getelementptr inbounds i8, i8 addrspace(4)* %1930, i64 4
  %1968 = load i8, i8 addrspace(4)* %1967, align 1, !tbaa !14
  %1969 = zext i8 %1968 to i64
  %1970 = shl nuw nsw i64 %1969, 32
  %1971 = or i64 %1966, %1970
  %1972 = getelementptr inbounds i8, i8 addrspace(4)* %1930, i64 5
  %1973 = load i8, i8 addrspace(4)* %1972, align 1, !tbaa !14
  %1974 = zext i8 %1973 to i64
  %1975 = shl nuw nsw i64 %1974, 40
  %1976 = or i64 %1971, %1975
  %1977 = getelementptr inbounds i8, i8 addrspace(4)* %1930, i64 6
  %1978 = load i8, i8 addrspace(4)* %1977, align 1, !tbaa !14
  %1979 = zext i8 %1978 to i64
  %1980 = shl nuw nsw i64 %1979, 48
  %1981 = or i64 %1976, %1980
  %1982 = getelementptr inbounds i8, i8 addrspace(4)* %1930, i64 7
  %1983 = load i8, i8 addrspace(4)* %1982, align 1, !tbaa !14
  %1984 = zext i8 %1983 to i64
  %1985 = shl nuw i64 %1984, 56
  %1986 = or i64 %1981, %1985
  %1987 = add nsw i32 %1931, -8
  %1988 = getelementptr inbounds i8, i8 addrspace(4)* %1930, i64 8
  br label %1989

1989:                                             ; preds = %1936, %1949, %1934
  %1990 = phi i8 addrspace(4)* [ %1988, %1949 ], [ %1930, %1934 ], [ %1930, %1936 ]
  %1991 = phi i32 [ %1987, %1949 ], [ 0, %1934 ], [ 0, %1936 ]
  %1992 = phi i64 [ %1986, %1949 ], [ 0, %1934 ], [ %1946, %1936 ]
  %1993 = icmp ugt i32 %1991, 7
  br i1 %1993, label %2009, label %1994

1994:                                             ; preds = %1989
  %1995 = icmp eq i32 %1991, 0
  br i1 %1995, label %2049, label %1996

1996:                                             ; preds = %1994, %1996
  %1997 = phi i32 [ %2007, %1996 ], [ 0, %1994 ]
  %1998 = phi i64 [ %2006, %1996 ], [ 0, %1994 ]
  %1999 = zext i32 %1997 to i64
  %2000 = getelementptr inbounds i8, i8 addrspace(4)* %1990, i64 %1999
  %2001 = load i8, i8 addrspace(4)* %2000, align 1, !tbaa !14
  %2002 = zext i8 %2001 to i64
  %2003 = shl i32 %1997, 3
  %2004 = zext i32 %2003 to i64
  %2005 = shl nuw i64 %2002, %2004
  %2006 = or i64 %2005, %1998
  %2007 = add nuw nsw i32 %1997, 1
  %2008 = icmp eq i32 %2007, %1991
  br i1 %2008, label %2049, label %1996

2009:                                             ; preds = %1989
  %2010 = load i8, i8 addrspace(4)* %1990, align 1, !tbaa !14
  %2011 = zext i8 %2010 to i64
  %2012 = getelementptr inbounds i8, i8 addrspace(4)* %1990, i64 1
  %2013 = load i8, i8 addrspace(4)* %2012, align 1, !tbaa !14
  %2014 = zext i8 %2013 to i64
  %2015 = shl nuw nsw i64 %2014, 8
  %2016 = or i64 %2015, %2011
  %2017 = getelementptr inbounds i8, i8 addrspace(4)* %1990, i64 2
  %2018 = load i8, i8 addrspace(4)* %2017, align 1, !tbaa !14
  %2019 = zext i8 %2018 to i64
  %2020 = shl nuw nsw i64 %2019, 16
  %2021 = or i64 %2016, %2020
  %2022 = getelementptr inbounds i8, i8 addrspace(4)* %1990, i64 3
  %2023 = load i8, i8 addrspace(4)* %2022, align 1, !tbaa !14
  %2024 = zext i8 %2023 to i64
  %2025 = shl nuw nsw i64 %2024, 24
  %2026 = or i64 %2021, %2025
  %2027 = getelementptr inbounds i8, i8 addrspace(4)* %1990, i64 4
  %2028 = load i8, i8 addrspace(4)* %2027, align 1, !tbaa !14
  %2029 = zext i8 %2028 to i64
  %2030 = shl nuw nsw i64 %2029, 32
  %2031 = or i64 %2026, %2030
  %2032 = getelementptr inbounds i8, i8 addrspace(4)* %1990, i64 5
  %2033 = load i8, i8 addrspace(4)* %2032, align 1, !tbaa !14
  %2034 = zext i8 %2033 to i64
  %2035 = shl nuw nsw i64 %2034, 40
  %2036 = or i64 %2031, %2035
  %2037 = getelementptr inbounds i8, i8 addrspace(4)* %1990, i64 6
  %2038 = load i8, i8 addrspace(4)* %2037, align 1, !tbaa !14
  %2039 = zext i8 %2038 to i64
  %2040 = shl nuw nsw i64 %2039, 48
  %2041 = or i64 %2036, %2040
  %2042 = getelementptr inbounds i8, i8 addrspace(4)* %1990, i64 7
  %2043 = load i8, i8 addrspace(4)* %2042, align 1, !tbaa !14
  %2044 = zext i8 %2043 to i64
  %2045 = shl nuw i64 %2044, 56
  %2046 = or i64 %2041, %2045
  %2047 = add nsw i32 %1991, -8
  %2048 = getelementptr inbounds i8, i8 addrspace(4)* %1990, i64 8
  br label %2049

2049:                                             ; preds = %1996, %2009, %1994
  %2050 = phi i8 addrspace(4)* [ %2048, %2009 ], [ %1990, %1994 ], [ %1990, %1996 ]
  %2051 = phi i32 [ %2047, %2009 ], [ 0, %1994 ], [ 0, %1996 ]
  %2052 = phi i64 [ %2046, %2009 ], [ 0, %1994 ], [ %2006, %1996 ]
  %2053 = icmp ugt i32 %2051, 7
  br i1 %2053, label %2069, label %2054

2054:                                             ; preds = %2049
  %2055 = icmp eq i32 %2051, 0
  br i1 %2055, label %2109, label %2056

2056:                                             ; preds = %2054, %2056
  %2057 = phi i32 [ %2067, %2056 ], [ 0, %2054 ]
  %2058 = phi i64 [ %2066, %2056 ], [ 0, %2054 ]
  %2059 = zext i32 %2057 to i64
  %2060 = getelementptr inbounds i8, i8 addrspace(4)* %2050, i64 %2059
  %2061 = load i8, i8 addrspace(4)* %2060, align 1, !tbaa !14
  %2062 = zext i8 %2061 to i64
  %2063 = shl i32 %2057, 3
  %2064 = zext i32 %2063 to i64
  %2065 = shl nuw i64 %2062, %2064
  %2066 = or i64 %2065, %2058
  %2067 = add nuw nsw i32 %2057, 1
  %2068 = icmp eq i32 %2067, %2051
  br i1 %2068, label %2109, label %2056

2069:                                             ; preds = %2049
  %2070 = load i8, i8 addrspace(4)* %2050, align 1, !tbaa !14
  %2071 = zext i8 %2070 to i64
  %2072 = getelementptr inbounds i8, i8 addrspace(4)* %2050, i64 1
  %2073 = load i8, i8 addrspace(4)* %2072, align 1, !tbaa !14
  %2074 = zext i8 %2073 to i64
  %2075 = shl nuw nsw i64 %2074, 8
  %2076 = or i64 %2075, %2071
  %2077 = getelementptr inbounds i8, i8 addrspace(4)* %2050, i64 2
  %2078 = load i8, i8 addrspace(4)* %2077, align 1, !tbaa !14
  %2079 = zext i8 %2078 to i64
  %2080 = shl nuw nsw i64 %2079, 16
  %2081 = or i64 %2076, %2080
  %2082 = getelementptr inbounds i8, i8 addrspace(4)* %2050, i64 3
  %2083 = load i8, i8 addrspace(4)* %2082, align 1, !tbaa !14
  %2084 = zext i8 %2083 to i64
  %2085 = shl nuw nsw i64 %2084, 24
  %2086 = or i64 %2081, %2085
  %2087 = getelementptr inbounds i8, i8 addrspace(4)* %2050, i64 4
  %2088 = load i8, i8 addrspace(4)* %2087, align 1, !tbaa !14
  %2089 = zext i8 %2088 to i64
  %2090 = shl nuw nsw i64 %2089, 32
  %2091 = or i64 %2086, %2090
  %2092 = getelementptr inbounds i8, i8 addrspace(4)* %2050, i64 5
  %2093 = load i8, i8 addrspace(4)* %2092, align 1, !tbaa !14
  %2094 = zext i8 %2093 to i64
  %2095 = shl nuw nsw i64 %2094, 40
  %2096 = or i64 %2091, %2095
  %2097 = getelementptr inbounds i8, i8 addrspace(4)* %2050, i64 6
  %2098 = load i8, i8 addrspace(4)* %2097, align 1, !tbaa !14
  %2099 = zext i8 %2098 to i64
  %2100 = shl nuw nsw i64 %2099, 48
  %2101 = or i64 %2096, %2100
  %2102 = getelementptr inbounds i8, i8 addrspace(4)* %2050, i64 7
  %2103 = load i8, i8 addrspace(4)* %2102, align 1, !tbaa !14
  %2104 = zext i8 %2103 to i64
  %2105 = shl nuw i64 %2104, 56
  %2106 = or i64 %2101, %2105
  %2107 = add nsw i32 %2051, -8
  %2108 = getelementptr inbounds i8, i8 addrspace(4)* %2050, i64 8
  br label %2109

2109:                                             ; preds = %2056, %2069, %2054
  %2110 = phi i8 addrspace(4)* [ %2108, %2069 ], [ %2050, %2054 ], [ %2050, %2056 ]
  %2111 = phi i32 [ %2107, %2069 ], [ 0, %2054 ], [ 0, %2056 ]
  %2112 = phi i64 [ %2106, %2069 ], [ 0, %2054 ], [ %2066, %2056 ]
  %2113 = icmp ugt i32 %2111, 7
  br i1 %2113, label %2129, label %2114

2114:                                             ; preds = %2109
  %2115 = icmp eq i32 %2111, 0
  br i1 %2115, label %2169, label %2116

2116:                                             ; preds = %2114, %2116
  %2117 = phi i32 [ %2127, %2116 ], [ 0, %2114 ]
  %2118 = phi i64 [ %2126, %2116 ], [ 0, %2114 ]
  %2119 = zext i32 %2117 to i64
  %2120 = getelementptr inbounds i8, i8 addrspace(4)* %2110, i64 %2119
  %2121 = load i8, i8 addrspace(4)* %2120, align 1, !tbaa !14
  %2122 = zext i8 %2121 to i64
  %2123 = shl i32 %2117, 3
  %2124 = zext i32 %2123 to i64
  %2125 = shl nuw i64 %2122, %2124
  %2126 = or i64 %2125, %2118
  %2127 = add nuw nsw i32 %2117, 1
  %2128 = icmp eq i32 %2127, %2111
  br i1 %2128, label %2169, label %2116

2129:                                             ; preds = %2109
  %2130 = load i8, i8 addrspace(4)* %2110, align 1, !tbaa !14
  %2131 = zext i8 %2130 to i64
  %2132 = getelementptr inbounds i8, i8 addrspace(4)* %2110, i64 1
  %2133 = load i8, i8 addrspace(4)* %2132, align 1, !tbaa !14
  %2134 = zext i8 %2133 to i64
  %2135 = shl nuw nsw i64 %2134, 8
  %2136 = or i64 %2135, %2131
  %2137 = getelementptr inbounds i8, i8 addrspace(4)* %2110, i64 2
  %2138 = load i8, i8 addrspace(4)* %2137, align 1, !tbaa !14
  %2139 = zext i8 %2138 to i64
  %2140 = shl nuw nsw i64 %2139, 16
  %2141 = or i64 %2136, %2140
  %2142 = getelementptr inbounds i8, i8 addrspace(4)* %2110, i64 3
  %2143 = load i8, i8 addrspace(4)* %2142, align 1, !tbaa !14
  %2144 = zext i8 %2143 to i64
  %2145 = shl nuw nsw i64 %2144, 24
  %2146 = or i64 %2141, %2145
  %2147 = getelementptr inbounds i8, i8 addrspace(4)* %2110, i64 4
  %2148 = load i8, i8 addrspace(4)* %2147, align 1, !tbaa !14
  %2149 = zext i8 %2148 to i64
  %2150 = shl nuw nsw i64 %2149, 32
  %2151 = or i64 %2146, %2150
  %2152 = getelementptr inbounds i8, i8 addrspace(4)* %2110, i64 5
  %2153 = load i8, i8 addrspace(4)* %2152, align 1, !tbaa !14
  %2154 = zext i8 %2153 to i64
  %2155 = shl nuw nsw i64 %2154, 40
  %2156 = or i64 %2151, %2155
  %2157 = getelementptr inbounds i8, i8 addrspace(4)* %2110, i64 6
  %2158 = load i8, i8 addrspace(4)* %2157, align 1, !tbaa !14
  %2159 = zext i8 %2158 to i64
  %2160 = shl nuw nsw i64 %2159, 48
  %2161 = or i64 %2156, %2160
  %2162 = getelementptr inbounds i8, i8 addrspace(4)* %2110, i64 7
  %2163 = load i8, i8 addrspace(4)* %2162, align 1, !tbaa !14
  %2164 = zext i8 %2163 to i64
  %2165 = shl nuw i64 %2164, 56
  %2166 = or i64 %2161, %2165
  %2167 = add nsw i32 %2111, -8
  %2168 = getelementptr inbounds i8, i8 addrspace(4)* %2110, i64 8
  br label %2169

2169:                                             ; preds = %2116, %2129, %2114
  %2170 = phi i8 addrspace(4)* [ %2168, %2129 ], [ %2110, %2114 ], [ %2110, %2116 ]
  %2171 = phi i32 [ %2167, %2129 ], [ 0, %2114 ], [ 0, %2116 ]
  %2172 = phi i64 [ %2166, %2129 ], [ 0, %2114 ], [ %2126, %2116 ]
  %2173 = icmp ugt i32 %2171, 7
  br i1 %2173, label %2189, label %2174

2174:                                             ; preds = %2169
  %2175 = icmp eq i32 %2171, 0
  br i1 %2175, label %2229, label %2176

2176:                                             ; preds = %2174, %2176
  %2177 = phi i32 [ %2187, %2176 ], [ 0, %2174 ]
  %2178 = phi i64 [ %2186, %2176 ], [ 0, %2174 ]
  %2179 = zext i32 %2177 to i64
  %2180 = getelementptr inbounds i8, i8 addrspace(4)* %2170, i64 %2179
  %2181 = load i8, i8 addrspace(4)* %2180, align 1, !tbaa !14
  %2182 = zext i8 %2181 to i64
  %2183 = shl i32 %2177, 3
  %2184 = zext i32 %2183 to i64
  %2185 = shl nuw i64 %2182, %2184
  %2186 = or i64 %2185, %2178
  %2187 = add nuw nsw i32 %2177, 1
  %2188 = icmp eq i32 %2187, %2171
  br i1 %2188, label %2229, label %2176

2189:                                             ; preds = %2169
  %2190 = load i8, i8 addrspace(4)* %2170, align 1, !tbaa !14
  %2191 = zext i8 %2190 to i64
  %2192 = getelementptr inbounds i8, i8 addrspace(4)* %2170, i64 1
  %2193 = load i8, i8 addrspace(4)* %2192, align 1, !tbaa !14
  %2194 = zext i8 %2193 to i64
  %2195 = shl nuw nsw i64 %2194, 8
  %2196 = or i64 %2195, %2191
  %2197 = getelementptr inbounds i8, i8 addrspace(4)* %2170, i64 2
  %2198 = load i8, i8 addrspace(4)* %2197, align 1, !tbaa !14
  %2199 = zext i8 %2198 to i64
  %2200 = shl nuw nsw i64 %2199, 16
  %2201 = or i64 %2196, %2200
  %2202 = getelementptr inbounds i8, i8 addrspace(4)* %2170, i64 3
  %2203 = load i8, i8 addrspace(4)* %2202, align 1, !tbaa !14
  %2204 = zext i8 %2203 to i64
  %2205 = shl nuw nsw i64 %2204, 24
  %2206 = or i64 %2201, %2205
  %2207 = getelementptr inbounds i8, i8 addrspace(4)* %2170, i64 4
  %2208 = load i8, i8 addrspace(4)* %2207, align 1, !tbaa !14
  %2209 = zext i8 %2208 to i64
  %2210 = shl nuw nsw i64 %2209, 32
  %2211 = or i64 %2206, %2210
  %2212 = getelementptr inbounds i8, i8 addrspace(4)* %2170, i64 5
  %2213 = load i8, i8 addrspace(4)* %2212, align 1, !tbaa !14
  %2214 = zext i8 %2213 to i64
  %2215 = shl nuw nsw i64 %2214, 40
  %2216 = or i64 %2211, %2215
  %2217 = getelementptr inbounds i8, i8 addrspace(4)* %2170, i64 6
  %2218 = load i8, i8 addrspace(4)* %2217, align 1, !tbaa !14
  %2219 = zext i8 %2218 to i64
  %2220 = shl nuw nsw i64 %2219, 48
  %2221 = or i64 %2216, %2220
  %2222 = getelementptr inbounds i8, i8 addrspace(4)* %2170, i64 7
  %2223 = load i8, i8 addrspace(4)* %2222, align 1, !tbaa !14
  %2224 = zext i8 %2223 to i64
  %2225 = shl nuw i64 %2224, 56
  %2226 = or i64 %2221, %2225
  %2227 = add nsw i32 %2171, -8
  %2228 = getelementptr inbounds i8, i8 addrspace(4)* %2170, i64 8
  br label %2229

2229:                                             ; preds = %2176, %2189, %2174
  %2230 = phi i8 addrspace(4)* [ %2228, %2189 ], [ %2170, %2174 ], [ %2170, %2176 ]
  %2231 = phi i32 [ %2227, %2189 ], [ 0, %2174 ], [ 0, %2176 ]
  %2232 = phi i64 [ %2226, %2189 ], [ 0, %2174 ], [ %2186, %2176 ]
  %2233 = icmp ugt i32 %2231, 7
  br i1 %2233, label %2249, label %2234

2234:                                             ; preds = %2229
  %2235 = icmp eq i32 %2231, 0
  br i1 %2235, label %2287, label %2236

2236:                                             ; preds = %2234, %2236
  %2237 = phi i32 [ %2247, %2236 ], [ 0, %2234 ]
  %2238 = phi i64 [ %2246, %2236 ], [ 0, %2234 ]
  %2239 = zext i32 %2237 to i64
  %2240 = getelementptr inbounds i8, i8 addrspace(4)* %2230, i64 %2239
  %2241 = load i8, i8 addrspace(4)* %2240, align 1, !tbaa !14
  %2242 = zext i8 %2241 to i64
  %2243 = shl i32 %2237, 3
  %2244 = zext i32 %2243 to i64
  %2245 = shl nuw i64 %2242, %2244
  %2246 = or i64 %2245, %2238
  %2247 = add nuw nsw i32 %2237, 1
  %2248 = icmp eq i32 %2247, %2231
  br i1 %2248, label %2287, label %2236

2249:                                             ; preds = %2229
  %2250 = load i8, i8 addrspace(4)* %2230, align 1, !tbaa !14
  %2251 = zext i8 %2250 to i64
  %2252 = getelementptr inbounds i8, i8 addrspace(4)* %2230, i64 1
  %2253 = load i8, i8 addrspace(4)* %2252, align 1, !tbaa !14
  %2254 = zext i8 %2253 to i64
  %2255 = shl nuw nsw i64 %2254, 8
  %2256 = or i64 %2255, %2251
  %2257 = getelementptr inbounds i8, i8 addrspace(4)* %2230, i64 2
  %2258 = load i8, i8 addrspace(4)* %2257, align 1, !tbaa !14
  %2259 = zext i8 %2258 to i64
  %2260 = shl nuw nsw i64 %2259, 16
  %2261 = or i64 %2256, %2260
  %2262 = getelementptr inbounds i8, i8 addrspace(4)* %2230, i64 3
  %2263 = load i8, i8 addrspace(4)* %2262, align 1, !tbaa !14
  %2264 = zext i8 %2263 to i64
  %2265 = shl nuw nsw i64 %2264, 24
  %2266 = or i64 %2261, %2265
  %2267 = getelementptr inbounds i8, i8 addrspace(4)* %2230, i64 4
  %2268 = load i8, i8 addrspace(4)* %2267, align 1, !tbaa !14
  %2269 = zext i8 %2268 to i64
  %2270 = shl nuw nsw i64 %2269, 32
  %2271 = or i64 %2266, %2270
  %2272 = getelementptr inbounds i8, i8 addrspace(4)* %2230, i64 5
  %2273 = load i8, i8 addrspace(4)* %2272, align 1, !tbaa !14
  %2274 = zext i8 %2273 to i64
  %2275 = shl nuw nsw i64 %2274, 40
  %2276 = or i64 %2271, %2275
  %2277 = getelementptr inbounds i8, i8 addrspace(4)* %2230, i64 6
  %2278 = load i8, i8 addrspace(4)* %2277, align 1, !tbaa !14
  %2279 = zext i8 %2278 to i64
  %2280 = shl nuw nsw i64 %2279, 48
  %2281 = or i64 %2276, %2280
  %2282 = getelementptr inbounds i8, i8 addrspace(4)* %2230, i64 7
  %2283 = load i8, i8 addrspace(4)* %2282, align 1, !tbaa !14
  %2284 = zext i8 %2283 to i64
  %2285 = shl nuw i64 %2284, 56
  %2286 = or i64 %2281, %2285
  br label %2287

2287:                                             ; preds = %2236, %2249, %2234
  %2288 = phi i64 [ %2286, %2249 ], [ 0, %2234 ], [ %2246, %2236 ]
  %2289 = shl nuw nsw i64 %1870, 2
  %2290 = add nuw nsw i64 %2289, 28
  %2291 = and i64 %2290, 480
  %2292 = and i64 %1872, -225
  %2293 = or i64 %2292, %2291
  %2294 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %26, i64 noundef %2293, i64 noundef %1932, i64 noundef %1992, i64 noundef %2052, i64 noundef %2112, i64 noundef %2172, i64 noundef %2232, i64 noundef %2288) #11
  %2295 = sub i64 %1862, %1870
  %2296 = getelementptr inbounds i8, i8 addrspace(4)* %1863, i64 %1870
  %2297 = icmp eq i64 %2295, 0
  br i1 %2297, label %2302, label %1861

2298:                                             ; preds = %1845
  %2299 = and i64 %1856, -225
  %2300 = or i64 %2299, 32
  %2301 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %26, i64 noundef %2300, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  br label %2302

2302:                                             ; preds = %2287, %2298
  %2303 = phi <2 x i64> [ %2301, %2298 ], [ %2294, %2287 ]
  %2304 = extractelement <2 x i64> %2303, i64 0
  %2305 = and i64 %2304, -227
  %2306 = or i64 %2305, 34
  %2307 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %26, i64 noundef %2306, i64 noundef 4, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %2308 = load i32, i32 addrspace(3)* getelementptr inbounds ([0 x i32], [0 x i32] addrspace(3)* @seme, i32 0, i32 4), align 4, !tbaa !5
  %2309 = mul nsw i32 %2308, %2308
  %2310 = load i32, i32 addrspace(1)* %0, align 4, !tbaa !5
  %2311 = add nsw i32 %2310, %2309
  store i32 %2311, i32 addrspace(1)* %0, align 4, !tbaa !5
  %2312 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %26, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %2313 = extractelement <2 x i64> %2312, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([20 x i8], [20 x i8] addrspace(4)* @.str.1, i64 0, i64 0) to i8*), i8* null), label %2314, label %2318

2314:                                             ; preds = %2302
  %2315 = and i64 %2313, -225
  %2316 = or i64 %2315, 32
  %2317 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %26, i64 noundef %2316, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  br label %2759

2318:                                             ; preds = %2302
  %2319 = and i64 %2313, 2
  %2320 = and i64 %2313, -3
  %2321 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %2320, i64 0
  br label %2322

2322:                                             ; preds = %2748, %2318
  %2323 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([20 x i8], [20 x i8] addrspace(4)* @.str.1, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([20 x i8], [20 x i8] addrspace(4)* @.str.1, i64 0, i64 19) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([20 x i8]* addrspacecast ([20 x i8] addrspace(4)* @.str.1 to [20 x i8]*) to i64)), i64 1))), %2318 ], [ %2756, %2748 ]
  %2324 = phi i8 addrspace(4)* [ getelementptr inbounds ([20 x i8], [20 x i8] addrspace(4)* @.str.1, i64 0, i64 0), %2318 ], [ %2757, %2748 ]
  %2325 = phi <2 x i64> [ %2321, %2318 ], [ %2755, %2748 ]
  %2326 = icmp ugt i64 %2323, 56
  %2327 = extractelement <2 x i64> %2325, i64 0
  %2328 = or i64 %2327, %2319
  %2329 = insertelement <2 x i64> poison, i64 %2328, i64 0
  %2330 = select i1 %2326, <2 x i64> %2325, <2 x i64> %2329
  %2331 = tail call i64 @llvm.umin.i64(i64 %2323, i64 56)
  %2332 = trunc i64 %2331 to i32
  %2333 = extractelement <2 x i64> %2330, i64 0
  %2334 = icmp ugt i32 %2332, 7
  br i1 %2334, label %2337, label %2335

2335:                                             ; preds = %2322
  %2336 = icmp eq i32 %2332, 0
  br i1 %2336, label %2390, label %2377

2337:                                             ; preds = %2322
  %2338 = load i8, i8 addrspace(4)* %2324, align 1, !tbaa !14
  %2339 = zext i8 %2338 to i64
  %2340 = getelementptr inbounds i8, i8 addrspace(4)* %2324, i64 1
  %2341 = load i8, i8 addrspace(4)* %2340, align 1, !tbaa !14
  %2342 = zext i8 %2341 to i64
  %2343 = shl nuw nsw i64 %2342, 8
  %2344 = or i64 %2343, %2339
  %2345 = getelementptr inbounds i8, i8 addrspace(4)* %2324, i64 2
  %2346 = load i8, i8 addrspace(4)* %2345, align 1, !tbaa !14
  %2347 = zext i8 %2346 to i64
  %2348 = shl nuw nsw i64 %2347, 16
  %2349 = or i64 %2344, %2348
  %2350 = getelementptr inbounds i8, i8 addrspace(4)* %2324, i64 3
  %2351 = load i8, i8 addrspace(4)* %2350, align 1, !tbaa !14
  %2352 = zext i8 %2351 to i64
  %2353 = shl nuw nsw i64 %2352, 24
  %2354 = or i64 %2349, %2353
  %2355 = getelementptr inbounds i8, i8 addrspace(4)* %2324, i64 4
  %2356 = load i8, i8 addrspace(4)* %2355, align 1, !tbaa !14
  %2357 = zext i8 %2356 to i64
  %2358 = shl nuw nsw i64 %2357, 32
  %2359 = or i64 %2354, %2358
  %2360 = getelementptr inbounds i8, i8 addrspace(4)* %2324, i64 5
  %2361 = load i8, i8 addrspace(4)* %2360, align 1, !tbaa !14
  %2362 = zext i8 %2361 to i64
  %2363 = shl nuw nsw i64 %2362, 40
  %2364 = or i64 %2359, %2363
  %2365 = getelementptr inbounds i8, i8 addrspace(4)* %2324, i64 6
  %2366 = load i8, i8 addrspace(4)* %2365, align 1, !tbaa !14
  %2367 = zext i8 %2366 to i64
  %2368 = shl nuw nsw i64 %2367, 48
  %2369 = or i64 %2364, %2368
  %2370 = getelementptr inbounds i8, i8 addrspace(4)* %2324, i64 7
  %2371 = load i8, i8 addrspace(4)* %2370, align 1, !tbaa !14
  %2372 = zext i8 %2371 to i64
  %2373 = shl nuw i64 %2372, 56
  %2374 = or i64 %2369, %2373
  %2375 = add nsw i32 %2332, -8
  %2376 = getelementptr inbounds i8, i8 addrspace(4)* %2324, i64 8
  br label %2390

2377:                                             ; preds = %2335, %2377
  %2378 = phi i32 [ %2388, %2377 ], [ 0, %2335 ]
  %2379 = phi i64 [ %2387, %2377 ], [ 0, %2335 ]
  %2380 = zext i32 %2378 to i64
  %2381 = getelementptr inbounds i8, i8 addrspace(4)* %2324, i64 %2380
  %2382 = load i8, i8 addrspace(4)* %2381, align 1, !tbaa !14
  %2383 = zext i8 %2382 to i64
  %2384 = shl i32 %2378, 3
  %2385 = zext i32 %2384 to i64
  %2386 = shl nuw i64 %2383, %2385
  %2387 = or i64 %2386, %2379
  %2388 = add nuw nsw i32 %2378, 1
  %2389 = icmp eq i32 %2388, %2332
  br i1 %2389, label %2390, label %2377, !llvm.loop !15

2390:                                             ; preds = %2377, %2337, %2335
  %2391 = phi i8 addrspace(4)* [ %2376, %2337 ], [ %2324, %2335 ], [ %2324, %2377 ]
  %2392 = phi i32 [ %2375, %2337 ], [ 0, %2335 ], [ 0, %2377 ]
  %2393 = phi i64 [ %2374, %2337 ], [ 0, %2335 ], [ %2387, %2377 ]
  %2394 = icmp ugt i32 %2392, 7
  br i1 %2394, label %2397, label %2395

2395:                                             ; preds = %2390
  %2396 = icmp eq i32 %2392, 0
  br i1 %2396, label %2450, label %2437

2397:                                             ; preds = %2390
  %2398 = load i8, i8 addrspace(4)* %2391, align 1, !tbaa !14
  %2399 = zext i8 %2398 to i64
  %2400 = getelementptr inbounds i8, i8 addrspace(4)* %2391, i64 1
  %2401 = load i8, i8 addrspace(4)* %2400, align 1, !tbaa !14
  %2402 = zext i8 %2401 to i64
  %2403 = shl nuw nsw i64 %2402, 8
  %2404 = or i64 %2403, %2399
  %2405 = getelementptr inbounds i8, i8 addrspace(4)* %2391, i64 2
  %2406 = load i8, i8 addrspace(4)* %2405, align 1, !tbaa !14
  %2407 = zext i8 %2406 to i64
  %2408 = shl nuw nsw i64 %2407, 16
  %2409 = or i64 %2404, %2408
  %2410 = getelementptr inbounds i8, i8 addrspace(4)* %2391, i64 3
  %2411 = load i8, i8 addrspace(4)* %2410, align 1, !tbaa !14
  %2412 = zext i8 %2411 to i64
  %2413 = shl nuw nsw i64 %2412, 24
  %2414 = or i64 %2409, %2413
  %2415 = getelementptr inbounds i8, i8 addrspace(4)* %2391, i64 4
  %2416 = load i8, i8 addrspace(4)* %2415, align 1, !tbaa !14
  %2417 = zext i8 %2416 to i64
  %2418 = shl nuw nsw i64 %2417, 32
  %2419 = or i64 %2414, %2418
  %2420 = getelementptr inbounds i8, i8 addrspace(4)* %2391, i64 5
  %2421 = load i8, i8 addrspace(4)* %2420, align 1, !tbaa !14
  %2422 = zext i8 %2421 to i64
  %2423 = shl nuw nsw i64 %2422, 40
  %2424 = or i64 %2419, %2423
  %2425 = getelementptr inbounds i8, i8 addrspace(4)* %2391, i64 6
  %2426 = load i8, i8 addrspace(4)* %2425, align 1, !tbaa !14
  %2427 = zext i8 %2426 to i64
  %2428 = shl nuw nsw i64 %2427, 48
  %2429 = or i64 %2424, %2428
  %2430 = getelementptr inbounds i8, i8 addrspace(4)* %2391, i64 7
  %2431 = load i8, i8 addrspace(4)* %2430, align 1, !tbaa !14
  %2432 = zext i8 %2431 to i64
  %2433 = shl nuw i64 %2432, 56
  %2434 = or i64 %2429, %2433
  %2435 = add nsw i32 %2392, -8
  %2436 = getelementptr inbounds i8, i8 addrspace(4)* %2391, i64 8
  br label %2450

2437:                                             ; preds = %2395, %2437
  %2438 = phi i32 [ %2448, %2437 ], [ 0, %2395 ]
  %2439 = phi i64 [ %2447, %2437 ], [ 0, %2395 ]
  %2440 = zext i32 %2438 to i64
  %2441 = getelementptr inbounds i8, i8 addrspace(4)* %2391, i64 %2440
  %2442 = load i8, i8 addrspace(4)* %2441, align 1, !tbaa !14
  %2443 = zext i8 %2442 to i64
  %2444 = shl i32 %2438, 3
  %2445 = zext i32 %2444 to i64
  %2446 = shl nuw i64 %2443, %2445
  %2447 = or i64 %2446, %2439
  %2448 = add nuw nsw i32 %2438, 1
  %2449 = icmp eq i32 %2448, %2392
  br i1 %2449, label %2450, label %2437

2450:                                             ; preds = %2437, %2397, %2395
  %2451 = phi i8 addrspace(4)* [ %2436, %2397 ], [ %2391, %2395 ], [ %2391, %2437 ]
  %2452 = phi i32 [ %2435, %2397 ], [ 0, %2395 ], [ 0, %2437 ]
  %2453 = phi i64 [ %2434, %2397 ], [ 0, %2395 ], [ %2447, %2437 ]
  %2454 = icmp ugt i32 %2452, 7
  br i1 %2454, label %2457, label %2455

2455:                                             ; preds = %2450
  %2456 = icmp eq i32 %2452, 0
  br i1 %2456, label %2510, label %2497

2457:                                             ; preds = %2450
  %2458 = load i8, i8 addrspace(4)* %2451, align 1, !tbaa !14
  %2459 = zext i8 %2458 to i64
  %2460 = getelementptr inbounds i8, i8 addrspace(4)* %2451, i64 1
  %2461 = load i8, i8 addrspace(4)* %2460, align 1, !tbaa !14
  %2462 = zext i8 %2461 to i64
  %2463 = shl nuw nsw i64 %2462, 8
  %2464 = or i64 %2463, %2459
  %2465 = getelementptr inbounds i8, i8 addrspace(4)* %2451, i64 2
  %2466 = load i8, i8 addrspace(4)* %2465, align 1, !tbaa !14
  %2467 = zext i8 %2466 to i64
  %2468 = shl nuw nsw i64 %2467, 16
  %2469 = or i64 %2464, %2468
  %2470 = getelementptr inbounds i8, i8 addrspace(4)* %2451, i64 3
  %2471 = load i8, i8 addrspace(4)* %2470, align 1, !tbaa !14
  %2472 = zext i8 %2471 to i64
  %2473 = shl nuw nsw i64 %2472, 24
  %2474 = or i64 %2469, %2473
  %2475 = getelementptr inbounds i8, i8 addrspace(4)* %2451, i64 4
  %2476 = load i8, i8 addrspace(4)* %2475, align 1, !tbaa !14
  %2477 = zext i8 %2476 to i64
  %2478 = shl nuw nsw i64 %2477, 32
  %2479 = or i64 %2474, %2478
  %2480 = getelementptr inbounds i8, i8 addrspace(4)* %2451, i64 5
  %2481 = load i8, i8 addrspace(4)* %2480, align 1, !tbaa !14
  %2482 = zext i8 %2481 to i64
  %2483 = shl nuw nsw i64 %2482, 40
  %2484 = or i64 %2479, %2483
  %2485 = getelementptr inbounds i8, i8 addrspace(4)* %2451, i64 6
  %2486 = load i8, i8 addrspace(4)* %2485, align 1, !tbaa !14
  %2487 = zext i8 %2486 to i64
  %2488 = shl nuw nsw i64 %2487, 48
  %2489 = or i64 %2484, %2488
  %2490 = getelementptr inbounds i8, i8 addrspace(4)* %2451, i64 7
  %2491 = load i8, i8 addrspace(4)* %2490, align 1, !tbaa !14
  %2492 = zext i8 %2491 to i64
  %2493 = shl nuw i64 %2492, 56
  %2494 = or i64 %2489, %2493
  %2495 = add nsw i32 %2452, -8
  %2496 = getelementptr inbounds i8, i8 addrspace(4)* %2451, i64 8
  br label %2510

2497:                                             ; preds = %2455, %2497
  %2498 = phi i32 [ %2508, %2497 ], [ 0, %2455 ]
  %2499 = phi i64 [ %2507, %2497 ], [ 0, %2455 ]
  %2500 = zext i32 %2498 to i64
  %2501 = getelementptr inbounds i8, i8 addrspace(4)* %2451, i64 %2500
  %2502 = load i8, i8 addrspace(4)* %2501, align 1, !tbaa !14
  %2503 = zext i8 %2502 to i64
  %2504 = shl i32 %2498, 3
  %2505 = zext i32 %2504 to i64
  %2506 = shl nuw i64 %2503, %2505
  %2507 = or i64 %2506, %2499
  %2508 = add nuw nsw i32 %2498, 1
  %2509 = icmp eq i32 %2508, %2452
  br i1 %2509, label %2510, label %2497

2510:                                             ; preds = %2497, %2457, %2455
  %2511 = phi i8 addrspace(4)* [ %2496, %2457 ], [ %2451, %2455 ], [ %2451, %2497 ]
  %2512 = phi i32 [ %2495, %2457 ], [ 0, %2455 ], [ 0, %2497 ]
  %2513 = phi i64 [ %2494, %2457 ], [ 0, %2455 ], [ %2507, %2497 ]
  %2514 = icmp ugt i32 %2512, 7
  br i1 %2514, label %2517, label %2515

2515:                                             ; preds = %2510
  %2516 = icmp eq i32 %2512, 0
  br i1 %2516, label %2570, label %2557

2517:                                             ; preds = %2510
  %2518 = load i8, i8 addrspace(4)* %2511, align 1, !tbaa !14
  %2519 = zext i8 %2518 to i64
  %2520 = getelementptr inbounds i8, i8 addrspace(4)* %2511, i64 1
  %2521 = load i8, i8 addrspace(4)* %2520, align 1, !tbaa !14
  %2522 = zext i8 %2521 to i64
  %2523 = shl nuw nsw i64 %2522, 8
  %2524 = or i64 %2523, %2519
  %2525 = getelementptr inbounds i8, i8 addrspace(4)* %2511, i64 2
  %2526 = load i8, i8 addrspace(4)* %2525, align 1, !tbaa !14
  %2527 = zext i8 %2526 to i64
  %2528 = shl nuw nsw i64 %2527, 16
  %2529 = or i64 %2524, %2528
  %2530 = getelementptr inbounds i8, i8 addrspace(4)* %2511, i64 3
  %2531 = load i8, i8 addrspace(4)* %2530, align 1, !tbaa !14
  %2532 = zext i8 %2531 to i64
  %2533 = shl nuw nsw i64 %2532, 24
  %2534 = or i64 %2529, %2533
  %2535 = getelementptr inbounds i8, i8 addrspace(4)* %2511, i64 4
  %2536 = load i8, i8 addrspace(4)* %2535, align 1, !tbaa !14
  %2537 = zext i8 %2536 to i64
  %2538 = shl nuw nsw i64 %2537, 32
  %2539 = or i64 %2534, %2538
  %2540 = getelementptr inbounds i8, i8 addrspace(4)* %2511, i64 5
  %2541 = load i8, i8 addrspace(4)* %2540, align 1, !tbaa !14
  %2542 = zext i8 %2541 to i64
  %2543 = shl nuw nsw i64 %2542, 40
  %2544 = or i64 %2539, %2543
  %2545 = getelementptr inbounds i8, i8 addrspace(4)* %2511, i64 6
  %2546 = load i8, i8 addrspace(4)* %2545, align 1, !tbaa !14
  %2547 = zext i8 %2546 to i64
  %2548 = shl nuw nsw i64 %2547, 48
  %2549 = or i64 %2544, %2548
  %2550 = getelementptr inbounds i8, i8 addrspace(4)* %2511, i64 7
  %2551 = load i8, i8 addrspace(4)* %2550, align 1, !tbaa !14
  %2552 = zext i8 %2551 to i64
  %2553 = shl nuw i64 %2552, 56
  %2554 = or i64 %2549, %2553
  %2555 = add nsw i32 %2512, -8
  %2556 = getelementptr inbounds i8, i8 addrspace(4)* %2511, i64 8
  br label %2570

2557:                                             ; preds = %2515, %2557
  %2558 = phi i32 [ %2568, %2557 ], [ 0, %2515 ]
  %2559 = phi i64 [ %2567, %2557 ], [ 0, %2515 ]
  %2560 = zext i32 %2558 to i64
  %2561 = getelementptr inbounds i8, i8 addrspace(4)* %2511, i64 %2560
  %2562 = load i8, i8 addrspace(4)* %2561, align 1, !tbaa !14
  %2563 = zext i8 %2562 to i64
  %2564 = shl i32 %2558, 3
  %2565 = zext i32 %2564 to i64
  %2566 = shl nuw i64 %2563, %2565
  %2567 = or i64 %2566, %2559
  %2568 = add nuw nsw i32 %2558, 1
  %2569 = icmp eq i32 %2568, %2512
  br i1 %2569, label %2570, label %2557

2570:                                             ; preds = %2557, %2517, %2515
  %2571 = phi i8 addrspace(4)* [ %2556, %2517 ], [ %2511, %2515 ], [ %2511, %2557 ]
  %2572 = phi i32 [ %2555, %2517 ], [ 0, %2515 ], [ 0, %2557 ]
  %2573 = phi i64 [ %2554, %2517 ], [ 0, %2515 ], [ %2567, %2557 ]
  %2574 = icmp ugt i32 %2572, 7
  br i1 %2574, label %2577, label %2575

2575:                                             ; preds = %2570
  %2576 = icmp eq i32 %2572, 0
  br i1 %2576, label %2630, label %2617

2577:                                             ; preds = %2570
  %2578 = load i8, i8 addrspace(4)* %2571, align 1, !tbaa !14
  %2579 = zext i8 %2578 to i64
  %2580 = getelementptr inbounds i8, i8 addrspace(4)* %2571, i64 1
  %2581 = load i8, i8 addrspace(4)* %2580, align 1, !tbaa !14
  %2582 = zext i8 %2581 to i64
  %2583 = shl nuw nsw i64 %2582, 8
  %2584 = or i64 %2583, %2579
  %2585 = getelementptr inbounds i8, i8 addrspace(4)* %2571, i64 2
  %2586 = load i8, i8 addrspace(4)* %2585, align 1, !tbaa !14
  %2587 = zext i8 %2586 to i64
  %2588 = shl nuw nsw i64 %2587, 16
  %2589 = or i64 %2584, %2588
  %2590 = getelementptr inbounds i8, i8 addrspace(4)* %2571, i64 3
  %2591 = load i8, i8 addrspace(4)* %2590, align 1, !tbaa !14
  %2592 = zext i8 %2591 to i64
  %2593 = shl nuw nsw i64 %2592, 24
  %2594 = or i64 %2589, %2593
  %2595 = getelementptr inbounds i8, i8 addrspace(4)* %2571, i64 4
  %2596 = load i8, i8 addrspace(4)* %2595, align 1, !tbaa !14
  %2597 = zext i8 %2596 to i64
  %2598 = shl nuw nsw i64 %2597, 32
  %2599 = or i64 %2594, %2598
  %2600 = getelementptr inbounds i8, i8 addrspace(4)* %2571, i64 5
  %2601 = load i8, i8 addrspace(4)* %2600, align 1, !tbaa !14
  %2602 = zext i8 %2601 to i64
  %2603 = shl nuw nsw i64 %2602, 40
  %2604 = or i64 %2599, %2603
  %2605 = getelementptr inbounds i8, i8 addrspace(4)* %2571, i64 6
  %2606 = load i8, i8 addrspace(4)* %2605, align 1, !tbaa !14
  %2607 = zext i8 %2606 to i64
  %2608 = shl nuw nsw i64 %2607, 48
  %2609 = or i64 %2604, %2608
  %2610 = getelementptr inbounds i8, i8 addrspace(4)* %2571, i64 7
  %2611 = load i8, i8 addrspace(4)* %2610, align 1, !tbaa !14
  %2612 = zext i8 %2611 to i64
  %2613 = shl nuw i64 %2612, 56
  %2614 = or i64 %2609, %2613
  %2615 = add nsw i32 %2572, -8
  %2616 = getelementptr inbounds i8, i8 addrspace(4)* %2571, i64 8
  br label %2630

2617:                                             ; preds = %2575, %2617
  %2618 = phi i32 [ %2628, %2617 ], [ 0, %2575 ]
  %2619 = phi i64 [ %2627, %2617 ], [ 0, %2575 ]
  %2620 = zext i32 %2618 to i64
  %2621 = getelementptr inbounds i8, i8 addrspace(4)* %2571, i64 %2620
  %2622 = load i8, i8 addrspace(4)* %2621, align 1, !tbaa !14
  %2623 = zext i8 %2622 to i64
  %2624 = shl i32 %2618, 3
  %2625 = zext i32 %2624 to i64
  %2626 = shl nuw i64 %2623, %2625
  %2627 = or i64 %2626, %2619
  %2628 = add nuw nsw i32 %2618, 1
  %2629 = icmp eq i32 %2628, %2572
  br i1 %2629, label %2630, label %2617

2630:                                             ; preds = %2617, %2577, %2575
  %2631 = phi i8 addrspace(4)* [ %2616, %2577 ], [ %2571, %2575 ], [ %2571, %2617 ]
  %2632 = phi i32 [ %2615, %2577 ], [ 0, %2575 ], [ 0, %2617 ]
  %2633 = phi i64 [ %2614, %2577 ], [ 0, %2575 ], [ %2627, %2617 ]
  %2634 = icmp ugt i32 %2632, 7
  br i1 %2634, label %2637, label %2635

2635:                                             ; preds = %2630
  %2636 = icmp eq i32 %2632, 0
  br i1 %2636, label %2690, label %2677

2637:                                             ; preds = %2630
  %2638 = load i8, i8 addrspace(4)* %2631, align 1, !tbaa !14
  %2639 = zext i8 %2638 to i64
  %2640 = getelementptr inbounds i8, i8 addrspace(4)* %2631, i64 1
  %2641 = load i8, i8 addrspace(4)* %2640, align 1, !tbaa !14
  %2642 = zext i8 %2641 to i64
  %2643 = shl nuw nsw i64 %2642, 8
  %2644 = or i64 %2643, %2639
  %2645 = getelementptr inbounds i8, i8 addrspace(4)* %2631, i64 2
  %2646 = load i8, i8 addrspace(4)* %2645, align 1, !tbaa !14
  %2647 = zext i8 %2646 to i64
  %2648 = shl nuw nsw i64 %2647, 16
  %2649 = or i64 %2644, %2648
  %2650 = getelementptr inbounds i8, i8 addrspace(4)* %2631, i64 3
  %2651 = load i8, i8 addrspace(4)* %2650, align 1, !tbaa !14
  %2652 = zext i8 %2651 to i64
  %2653 = shl nuw nsw i64 %2652, 24
  %2654 = or i64 %2649, %2653
  %2655 = getelementptr inbounds i8, i8 addrspace(4)* %2631, i64 4
  %2656 = load i8, i8 addrspace(4)* %2655, align 1, !tbaa !14
  %2657 = zext i8 %2656 to i64
  %2658 = shl nuw nsw i64 %2657, 32
  %2659 = or i64 %2654, %2658
  %2660 = getelementptr inbounds i8, i8 addrspace(4)* %2631, i64 5
  %2661 = load i8, i8 addrspace(4)* %2660, align 1, !tbaa !14
  %2662 = zext i8 %2661 to i64
  %2663 = shl nuw nsw i64 %2662, 40
  %2664 = or i64 %2659, %2663
  %2665 = getelementptr inbounds i8, i8 addrspace(4)* %2631, i64 6
  %2666 = load i8, i8 addrspace(4)* %2665, align 1, !tbaa !14
  %2667 = zext i8 %2666 to i64
  %2668 = shl nuw nsw i64 %2667, 48
  %2669 = or i64 %2664, %2668
  %2670 = getelementptr inbounds i8, i8 addrspace(4)* %2631, i64 7
  %2671 = load i8, i8 addrspace(4)* %2670, align 1, !tbaa !14
  %2672 = zext i8 %2671 to i64
  %2673 = shl nuw i64 %2672, 56
  %2674 = or i64 %2669, %2673
  %2675 = add nsw i32 %2632, -8
  %2676 = getelementptr inbounds i8, i8 addrspace(4)* %2631, i64 8
  br label %2690

2677:                                             ; preds = %2635, %2677
  %2678 = phi i32 [ %2688, %2677 ], [ 0, %2635 ]
  %2679 = phi i64 [ %2687, %2677 ], [ 0, %2635 ]
  %2680 = zext i32 %2678 to i64
  %2681 = getelementptr inbounds i8, i8 addrspace(4)* %2631, i64 %2680
  %2682 = load i8, i8 addrspace(4)* %2681, align 1, !tbaa !14
  %2683 = zext i8 %2682 to i64
  %2684 = shl i32 %2678, 3
  %2685 = zext i32 %2684 to i64
  %2686 = shl nuw i64 %2683, %2685
  %2687 = or i64 %2686, %2679
  %2688 = add nuw nsw i32 %2678, 1
  %2689 = icmp eq i32 %2688, %2632
  br i1 %2689, label %2690, label %2677

2690:                                             ; preds = %2677, %2637, %2635
  %2691 = phi i8 addrspace(4)* [ %2676, %2637 ], [ %2631, %2635 ], [ %2631, %2677 ]
  %2692 = phi i32 [ %2675, %2637 ], [ 0, %2635 ], [ 0, %2677 ]
  %2693 = phi i64 [ %2674, %2637 ], [ 0, %2635 ], [ %2687, %2677 ]
  %2694 = icmp ugt i32 %2692, 7
  br i1 %2694, label %2697, label %2695

2695:                                             ; preds = %2690
  %2696 = icmp eq i32 %2692, 0
  br i1 %2696, label %2748, label %2735

2697:                                             ; preds = %2690
  %2698 = load i8, i8 addrspace(4)* %2691, align 1, !tbaa !14
  %2699 = zext i8 %2698 to i64
  %2700 = getelementptr inbounds i8, i8 addrspace(4)* %2691, i64 1
  %2701 = load i8, i8 addrspace(4)* %2700, align 1, !tbaa !14
  %2702 = zext i8 %2701 to i64
  %2703 = shl nuw nsw i64 %2702, 8
  %2704 = or i64 %2703, %2699
  %2705 = getelementptr inbounds i8, i8 addrspace(4)* %2691, i64 2
  %2706 = load i8, i8 addrspace(4)* %2705, align 1, !tbaa !14
  %2707 = zext i8 %2706 to i64
  %2708 = shl nuw nsw i64 %2707, 16
  %2709 = or i64 %2704, %2708
  %2710 = getelementptr inbounds i8, i8 addrspace(4)* %2691, i64 3
  %2711 = load i8, i8 addrspace(4)* %2710, align 1, !tbaa !14
  %2712 = zext i8 %2711 to i64
  %2713 = shl nuw nsw i64 %2712, 24
  %2714 = or i64 %2709, %2713
  %2715 = getelementptr inbounds i8, i8 addrspace(4)* %2691, i64 4
  %2716 = load i8, i8 addrspace(4)* %2715, align 1, !tbaa !14
  %2717 = zext i8 %2716 to i64
  %2718 = shl nuw nsw i64 %2717, 32
  %2719 = or i64 %2714, %2718
  %2720 = getelementptr inbounds i8, i8 addrspace(4)* %2691, i64 5
  %2721 = load i8, i8 addrspace(4)* %2720, align 1, !tbaa !14
  %2722 = zext i8 %2721 to i64
  %2723 = shl nuw nsw i64 %2722, 40
  %2724 = or i64 %2719, %2723
  %2725 = getelementptr inbounds i8, i8 addrspace(4)* %2691, i64 6
  %2726 = load i8, i8 addrspace(4)* %2725, align 1, !tbaa !14
  %2727 = zext i8 %2726 to i64
  %2728 = shl nuw nsw i64 %2727, 48
  %2729 = or i64 %2724, %2728
  %2730 = getelementptr inbounds i8, i8 addrspace(4)* %2691, i64 7
  %2731 = load i8, i8 addrspace(4)* %2730, align 1, !tbaa !14
  %2732 = zext i8 %2731 to i64
  %2733 = shl nuw i64 %2732, 56
  %2734 = or i64 %2729, %2733
  br label %2748

2735:                                             ; preds = %2695, %2735
  %2736 = phi i32 [ %2746, %2735 ], [ 0, %2695 ]
  %2737 = phi i64 [ %2745, %2735 ], [ 0, %2695 ]
  %2738 = zext i32 %2736 to i64
  %2739 = getelementptr inbounds i8, i8 addrspace(4)* %2691, i64 %2738
  %2740 = load i8, i8 addrspace(4)* %2739, align 1, !tbaa !14
  %2741 = zext i8 %2740 to i64
  %2742 = shl i32 %2736, 3
  %2743 = zext i32 %2742 to i64
  %2744 = shl nuw i64 %2741, %2743
  %2745 = or i64 %2744, %2737
  %2746 = add nuw nsw i32 %2736, 1
  %2747 = icmp eq i32 %2746, %2692
  br i1 %2747, label %2748, label %2735

2748:                                             ; preds = %2735, %2697, %2695
  %2749 = phi i64 [ %2734, %2697 ], [ 0, %2695 ], [ %2745, %2735 ]
  %2750 = shl nuw nsw i64 %2331, 2
  %2751 = add nuw nsw i64 %2750, 28
  %2752 = and i64 %2751, 480
  %2753 = and i64 %2333, -225
  %2754 = or i64 %2753, %2752
  %2755 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %26, i64 noundef %2754, i64 noundef %2393, i64 noundef %2453, i64 noundef %2513, i64 noundef %2573, i64 noundef %2633, i64 noundef %2693, i64 noundef %2749) #11
  %2756 = sub i64 %2323, %2331
  %2757 = getelementptr inbounds i8, i8 addrspace(4)* %2324, i64 %2331
  %2758 = icmp eq i64 %2756, 0
  br i1 %2758, label %2759, label %2322

2759:                                             ; preds = %2748, %2314
  %2760 = phi <2 x i64> [ %2317, %2314 ], [ %2755, %2748 ]
  %2761 = extractelement <2 x i64> %2760, i64 0
  %2762 = and i64 %2761, -227
  %2763 = or i64 %2762, 34
  %2764 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %26, i64 noundef %2763, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  br label %8238

2765:                                             ; preds = %8
  %2766 = and i64 %17, -225
  %2767 = or i64 %2766, 32
  %2768 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %15, i64 noundef %2767, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  br label %3210

2769:                                             ; preds = %8
  %2770 = and i64 %17, 2
  %2771 = and i64 %17, -3
  %2772 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %2771, i64 0
  br label %2773

2773:                                             ; preds = %3199, %2769
  %2774 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([21 x i8], [21 x i8] addrspace(4)* @.str.2, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([21 x i8], [21 x i8] addrspace(4)* @.str.2, i64 0, i64 20) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([21 x i8]* addrspacecast ([21 x i8] addrspace(4)* @.str.2 to [21 x i8]*) to i64)), i64 1))), %2769 ], [ %3207, %3199 ]
  %2775 = phi i8 addrspace(4)* [ getelementptr inbounds ([21 x i8], [21 x i8] addrspace(4)* @.str.2, i64 0, i64 0), %2769 ], [ %3208, %3199 ]
  %2776 = phi <2 x i64> [ %2772, %2769 ], [ %3206, %3199 ]
  %2777 = icmp ugt i64 %2774, 56
  %2778 = extractelement <2 x i64> %2776, i64 0
  %2779 = or i64 %2778, %2770
  %2780 = insertelement <2 x i64> poison, i64 %2779, i64 0
  %2781 = select i1 %2777, <2 x i64> %2776, <2 x i64> %2780
  %2782 = tail call i64 @llvm.umin.i64(i64 %2774, i64 56)
  %2783 = trunc i64 %2782 to i32
  %2784 = extractelement <2 x i64> %2781, i64 0
  %2785 = icmp ugt i32 %2783, 7
  br i1 %2785, label %2788, label %2786

2786:                                             ; preds = %2773
  %2787 = icmp eq i32 %2783, 0
  br i1 %2787, label %2841, label %2828

2788:                                             ; preds = %2773
  %2789 = load i8, i8 addrspace(4)* %2775, align 1, !tbaa !14
  %2790 = zext i8 %2789 to i64
  %2791 = getelementptr inbounds i8, i8 addrspace(4)* %2775, i64 1
  %2792 = load i8, i8 addrspace(4)* %2791, align 1, !tbaa !14
  %2793 = zext i8 %2792 to i64
  %2794 = shl nuw nsw i64 %2793, 8
  %2795 = or i64 %2794, %2790
  %2796 = getelementptr inbounds i8, i8 addrspace(4)* %2775, i64 2
  %2797 = load i8, i8 addrspace(4)* %2796, align 1, !tbaa !14
  %2798 = zext i8 %2797 to i64
  %2799 = shl nuw nsw i64 %2798, 16
  %2800 = or i64 %2795, %2799
  %2801 = getelementptr inbounds i8, i8 addrspace(4)* %2775, i64 3
  %2802 = load i8, i8 addrspace(4)* %2801, align 1, !tbaa !14
  %2803 = zext i8 %2802 to i64
  %2804 = shl nuw nsw i64 %2803, 24
  %2805 = or i64 %2800, %2804
  %2806 = getelementptr inbounds i8, i8 addrspace(4)* %2775, i64 4
  %2807 = load i8, i8 addrspace(4)* %2806, align 1, !tbaa !14
  %2808 = zext i8 %2807 to i64
  %2809 = shl nuw nsw i64 %2808, 32
  %2810 = or i64 %2805, %2809
  %2811 = getelementptr inbounds i8, i8 addrspace(4)* %2775, i64 5
  %2812 = load i8, i8 addrspace(4)* %2811, align 1, !tbaa !14
  %2813 = zext i8 %2812 to i64
  %2814 = shl nuw nsw i64 %2813, 40
  %2815 = or i64 %2810, %2814
  %2816 = getelementptr inbounds i8, i8 addrspace(4)* %2775, i64 6
  %2817 = load i8, i8 addrspace(4)* %2816, align 1, !tbaa !14
  %2818 = zext i8 %2817 to i64
  %2819 = shl nuw nsw i64 %2818, 48
  %2820 = or i64 %2815, %2819
  %2821 = getelementptr inbounds i8, i8 addrspace(4)* %2775, i64 7
  %2822 = load i8, i8 addrspace(4)* %2821, align 1, !tbaa !14
  %2823 = zext i8 %2822 to i64
  %2824 = shl nuw i64 %2823, 56
  %2825 = or i64 %2820, %2824
  %2826 = add nsw i32 %2783, -8
  %2827 = getelementptr inbounds i8, i8 addrspace(4)* %2775, i64 8
  br label %2841

2828:                                             ; preds = %2786, %2828
  %2829 = phi i32 [ %2839, %2828 ], [ 0, %2786 ]
  %2830 = phi i64 [ %2838, %2828 ], [ 0, %2786 ]
  %2831 = zext i32 %2829 to i64
  %2832 = getelementptr inbounds i8, i8 addrspace(4)* %2775, i64 %2831
  %2833 = load i8, i8 addrspace(4)* %2832, align 1, !tbaa !14
  %2834 = zext i8 %2833 to i64
  %2835 = shl i32 %2829, 3
  %2836 = zext i32 %2835 to i64
  %2837 = shl nuw i64 %2834, %2836
  %2838 = or i64 %2837, %2830
  %2839 = add nuw nsw i32 %2829, 1
  %2840 = icmp eq i32 %2839, %2783
  br i1 %2840, label %2841, label %2828, !llvm.loop !15

2841:                                             ; preds = %2828, %2788, %2786
  %2842 = phi i8 addrspace(4)* [ %2827, %2788 ], [ %2775, %2786 ], [ %2775, %2828 ]
  %2843 = phi i32 [ %2826, %2788 ], [ 0, %2786 ], [ 0, %2828 ]
  %2844 = phi i64 [ %2825, %2788 ], [ 0, %2786 ], [ %2838, %2828 ]
  %2845 = icmp ugt i32 %2843, 7
  br i1 %2845, label %2848, label %2846

2846:                                             ; preds = %2841
  %2847 = icmp eq i32 %2843, 0
  br i1 %2847, label %2901, label %2888

2848:                                             ; preds = %2841
  %2849 = load i8, i8 addrspace(4)* %2842, align 1, !tbaa !14
  %2850 = zext i8 %2849 to i64
  %2851 = getelementptr inbounds i8, i8 addrspace(4)* %2842, i64 1
  %2852 = load i8, i8 addrspace(4)* %2851, align 1, !tbaa !14
  %2853 = zext i8 %2852 to i64
  %2854 = shl nuw nsw i64 %2853, 8
  %2855 = or i64 %2854, %2850
  %2856 = getelementptr inbounds i8, i8 addrspace(4)* %2842, i64 2
  %2857 = load i8, i8 addrspace(4)* %2856, align 1, !tbaa !14
  %2858 = zext i8 %2857 to i64
  %2859 = shl nuw nsw i64 %2858, 16
  %2860 = or i64 %2855, %2859
  %2861 = getelementptr inbounds i8, i8 addrspace(4)* %2842, i64 3
  %2862 = load i8, i8 addrspace(4)* %2861, align 1, !tbaa !14
  %2863 = zext i8 %2862 to i64
  %2864 = shl nuw nsw i64 %2863, 24
  %2865 = or i64 %2860, %2864
  %2866 = getelementptr inbounds i8, i8 addrspace(4)* %2842, i64 4
  %2867 = load i8, i8 addrspace(4)* %2866, align 1, !tbaa !14
  %2868 = zext i8 %2867 to i64
  %2869 = shl nuw nsw i64 %2868, 32
  %2870 = or i64 %2865, %2869
  %2871 = getelementptr inbounds i8, i8 addrspace(4)* %2842, i64 5
  %2872 = load i8, i8 addrspace(4)* %2871, align 1, !tbaa !14
  %2873 = zext i8 %2872 to i64
  %2874 = shl nuw nsw i64 %2873, 40
  %2875 = or i64 %2870, %2874
  %2876 = getelementptr inbounds i8, i8 addrspace(4)* %2842, i64 6
  %2877 = load i8, i8 addrspace(4)* %2876, align 1, !tbaa !14
  %2878 = zext i8 %2877 to i64
  %2879 = shl nuw nsw i64 %2878, 48
  %2880 = or i64 %2875, %2879
  %2881 = getelementptr inbounds i8, i8 addrspace(4)* %2842, i64 7
  %2882 = load i8, i8 addrspace(4)* %2881, align 1, !tbaa !14
  %2883 = zext i8 %2882 to i64
  %2884 = shl nuw i64 %2883, 56
  %2885 = or i64 %2880, %2884
  %2886 = add nsw i32 %2843, -8
  %2887 = getelementptr inbounds i8, i8 addrspace(4)* %2842, i64 8
  br label %2901

2888:                                             ; preds = %2846, %2888
  %2889 = phi i32 [ %2899, %2888 ], [ 0, %2846 ]
  %2890 = phi i64 [ %2898, %2888 ], [ 0, %2846 ]
  %2891 = zext i32 %2889 to i64
  %2892 = getelementptr inbounds i8, i8 addrspace(4)* %2842, i64 %2891
  %2893 = load i8, i8 addrspace(4)* %2892, align 1, !tbaa !14
  %2894 = zext i8 %2893 to i64
  %2895 = shl i32 %2889, 3
  %2896 = zext i32 %2895 to i64
  %2897 = shl nuw i64 %2894, %2896
  %2898 = or i64 %2897, %2890
  %2899 = add nuw nsw i32 %2889, 1
  %2900 = icmp eq i32 %2899, %2843
  br i1 %2900, label %2901, label %2888

2901:                                             ; preds = %2888, %2848, %2846
  %2902 = phi i8 addrspace(4)* [ %2887, %2848 ], [ %2842, %2846 ], [ %2842, %2888 ]
  %2903 = phi i32 [ %2886, %2848 ], [ 0, %2846 ], [ 0, %2888 ]
  %2904 = phi i64 [ %2885, %2848 ], [ 0, %2846 ], [ %2898, %2888 ]
  %2905 = icmp ugt i32 %2903, 7
  br i1 %2905, label %2908, label %2906

2906:                                             ; preds = %2901
  %2907 = icmp eq i32 %2903, 0
  br i1 %2907, label %2961, label %2948

2908:                                             ; preds = %2901
  %2909 = load i8, i8 addrspace(4)* %2902, align 1, !tbaa !14
  %2910 = zext i8 %2909 to i64
  %2911 = getelementptr inbounds i8, i8 addrspace(4)* %2902, i64 1
  %2912 = load i8, i8 addrspace(4)* %2911, align 1, !tbaa !14
  %2913 = zext i8 %2912 to i64
  %2914 = shl nuw nsw i64 %2913, 8
  %2915 = or i64 %2914, %2910
  %2916 = getelementptr inbounds i8, i8 addrspace(4)* %2902, i64 2
  %2917 = load i8, i8 addrspace(4)* %2916, align 1, !tbaa !14
  %2918 = zext i8 %2917 to i64
  %2919 = shl nuw nsw i64 %2918, 16
  %2920 = or i64 %2915, %2919
  %2921 = getelementptr inbounds i8, i8 addrspace(4)* %2902, i64 3
  %2922 = load i8, i8 addrspace(4)* %2921, align 1, !tbaa !14
  %2923 = zext i8 %2922 to i64
  %2924 = shl nuw nsw i64 %2923, 24
  %2925 = or i64 %2920, %2924
  %2926 = getelementptr inbounds i8, i8 addrspace(4)* %2902, i64 4
  %2927 = load i8, i8 addrspace(4)* %2926, align 1, !tbaa !14
  %2928 = zext i8 %2927 to i64
  %2929 = shl nuw nsw i64 %2928, 32
  %2930 = or i64 %2925, %2929
  %2931 = getelementptr inbounds i8, i8 addrspace(4)* %2902, i64 5
  %2932 = load i8, i8 addrspace(4)* %2931, align 1, !tbaa !14
  %2933 = zext i8 %2932 to i64
  %2934 = shl nuw nsw i64 %2933, 40
  %2935 = or i64 %2930, %2934
  %2936 = getelementptr inbounds i8, i8 addrspace(4)* %2902, i64 6
  %2937 = load i8, i8 addrspace(4)* %2936, align 1, !tbaa !14
  %2938 = zext i8 %2937 to i64
  %2939 = shl nuw nsw i64 %2938, 48
  %2940 = or i64 %2935, %2939
  %2941 = getelementptr inbounds i8, i8 addrspace(4)* %2902, i64 7
  %2942 = load i8, i8 addrspace(4)* %2941, align 1, !tbaa !14
  %2943 = zext i8 %2942 to i64
  %2944 = shl nuw i64 %2943, 56
  %2945 = or i64 %2940, %2944
  %2946 = add nsw i32 %2903, -8
  %2947 = getelementptr inbounds i8, i8 addrspace(4)* %2902, i64 8
  br label %2961

2948:                                             ; preds = %2906, %2948
  %2949 = phi i32 [ %2959, %2948 ], [ 0, %2906 ]
  %2950 = phi i64 [ %2958, %2948 ], [ 0, %2906 ]
  %2951 = zext i32 %2949 to i64
  %2952 = getelementptr inbounds i8, i8 addrspace(4)* %2902, i64 %2951
  %2953 = load i8, i8 addrspace(4)* %2952, align 1, !tbaa !14
  %2954 = zext i8 %2953 to i64
  %2955 = shl i32 %2949, 3
  %2956 = zext i32 %2955 to i64
  %2957 = shl nuw i64 %2954, %2956
  %2958 = or i64 %2957, %2950
  %2959 = add nuw nsw i32 %2949, 1
  %2960 = icmp eq i32 %2959, %2903
  br i1 %2960, label %2961, label %2948

2961:                                             ; preds = %2948, %2908, %2906
  %2962 = phi i8 addrspace(4)* [ %2947, %2908 ], [ %2902, %2906 ], [ %2902, %2948 ]
  %2963 = phi i32 [ %2946, %2908 ], [ 0, %2906 ], [ 0, %2948 ]
  %2964 = phi i64 [ %2945, %2908 ], [ 0, %2906 ], [ %2958, %2948 ]
  %2965 = icmp ugt i32 %2963, 7
  br i1 %2965, label %2968, label %2966

2966:                                             ; preds = %2961
  %2967 = icmp eq i32 %2963, 0
  br i1 %2967, label %3021, label %3008

2968:                                             ; preds = %2961
  %2969 = load i8, i8 addrspace(4)* %2962, align 1, !tbaa !14
  %2970 = zext i8 %2969 to i64
  %2971 = getelementptr inbounds i8, i8 addrspace(4)* %2962, i64 1
  %2972 = load i8, i8 addrspace(4)* %2971, align 1, !tbaa !14
  %2973 = zext i8 %2972 to i64
  %2974 = shl nuw nsw i64 %2973, 8
  %2975 = or i64 %2974, %2970
  %2976 = getelementptr inbounds i8, i8 addrspace(4)* %2962, i64 2
  %2977 = load i8, i8 addrspace(4)* %2976, align 1, !tbaa !14
  %2978 = zext i8 %2977 to i64
  %2979 = shl nuw nsw i64 %2978, 16
  %2980 = or i64 %2975, %2979
  %2981 = getelementptr inbounds i8, i8 addrspace(4)* %2962, i64 3
  %2982 = load i8, i8 addrspace(4)* %2981, align 1, !tbaa !14
  %2983 = zext i8 %2982 to i64
  %2984 = shl nuw nsw i64 %2983, 24
  %2985 = or i64 %2980, %2984
  %2986 = getelementptr inbounds i8, i8 addrspace(4)* %2962, i64 4
  %2987 = load i8, i8 addrspace(4)* %2986, align 1, !tbaa !14
  %2988 = zext i8 %2987 to i64
  %2989 = shl nuw nsw i64 %2988, 32
  %2990 = or i64 %2985, %2989
  %2991 = getelementptr inbounds i8, i8 addrspace(4)* %2962, i64 5
  %2992 = load i8, i8 addrspace(4)* %2991, align 1, !tbaa !14
  %2993 = zext i8 %2992 to i64
  %2994 = shl nuw nsw i64 %2993, 40
  %2995 = or i64 %2990, %2994
  %2996 = getelementptr inbounds i8, i8 addrspace(4)* %2962, i64 6
  %2997 = load i8, i8 addrspace(4)* %2996, align 1, !tbaa !14
  %2998 = zext i8 %2997 to i64
  %2999 = shl nuw nsw i64 %2998, 48
  %3000 = or i64 %2995, %2999
  %3001 = getelementptr inbounds i8, i8 addrspace(4)* %2962, i64 7
  %3002 = load i8, i8 addrspace(4)* %3001, align 1, !tbaa !14
  %3003 = zext i8 %3002 to i64
  %3004 = shl nuw i64 %3003, 56
  %3005 = or i64 %3000, %3004
  %3006 = add nsw i32 %2963, -8
  %3007 = getelementptr inbounds i8, i8 addrspace(4)* %2962, i64 8
  br label %3021

3008:                                             ; preds = %2966, %3008
  %3009 = phi i32 [ %3019, %3008 ], [ 0, %2966 ]
  %3010 = phi i64 [ %3018, %3008 ], [ 0, %2966 ]
  %3011 = zext i32 %3009 to i64
  %3012 = getelementptr inbounds i8, i8 addrspace(4)* %2962, i64 %3011
  %3013 = load i8, i8 addrspace(4)* %3012, align 1, !tbaa !14
  %3014 = zext i8 %3013 to i64
  %3015 = shl i32 %3009, 3
  %3016 = zext i32 %3015 to i64
  %3017 = shl nuw i64 %3014, %3016
  %3018 = or i64 %3017, %3010
  %3019 = add nuw nsw i32 %3009, 1
  %3020 = icmp eq i32 %3019, %2963
  br i1 %3020, label %3021, label %3008

3021:                                             ; preds = %3008, %2968, %2966
  %3022 = phi i8 addrspace(4)* [ %3007, %2968 ], [ %2962, %2966 ], [ %2962, %3008 ]
  %3023 = phi i32 [ %3006, %2968 ], [ 0, %2966 ], [ 0, %3008 ]
  %3024 = phi i64 [ %3005, %2968 ], [ 0, %2966 ], [ %3018, %3008 ]
  %3025 = icmp ugt i32 %3023, 7
  br i1 %3025, label %3028, label %3026

3026:                                             ; preds = %3021
  %3027 = icmp eq i32 %3023, 0
  br i1 %3027, label %3081, label %3068

3028:                                             ; preds = %3021
  %3029 = load i8, i8 addrspace(4)* %3022, align 1, !tbaa !14
  %3030 = zext i8 %3029 to i64
  %3031 = getelementptr inbounds i8, i8 addrspace(4)* %3022, i64 1
  %3032 = load i8, i8 addrspace(4)* %3031, align 1, !tbaa !14
  %3033 = zext i8 %3032 to i64
  %3034 = shl nuw nsw i64 %3033, 8
  %3035 = or i64 %3034, %3030
  %3036 = getelementptr inbounds i8, i8 addrspace(4)* %3022, i64 2
  %3037 = load i8, i8 addrspace(4)* %3036, align 1, !tbaa !14
  %3038 = zext i8 %3037 to i64
  %3039 = shl nuw nsw i64 %3038, 16
  %3040 = or i64 %3035, %3039
  %3041 = getelementptr inbounds i8, i8 addrspace(4)* %3022, i64 3
  %3042 = load i8, i8 addrspace(4)* %3041, align 1, !tbaa !14
  %3043 = zext i8 %3042 to i64
  %3044 = shl nuw nsw i64 %3043, 24
  %3045 = or i64 %3040, %3044
  %3046 = getelementptr inbounds i8, i8 addrspace(4)* %3022, i64 4
  %3047 = load i8, i8 addrspace(4)* %3046, align 1, !tbaa !14
  %3048 = zext i8 %3047 to i64
  %3049 = shl nuw nsw i64 %3048, 32
  %3050 = or i64 %3045, %3049
  %3051 = getelementptr inbounds i8, i8 addrspace(4)* %3022, i64 5
  %3052 = load i8, i8 addrspace(4)* %3051, align 1, !tbaa !14
  %3053 = zext i8 %3052 to i64
  %3054 = shl nuw nsw i64 %3053, 40
  %3055 = or i64 %3050, %3054
  %3056 = getelementptr inbounds i8, i8 addrspace(4)* %3022, i64 6
  %3057 = load i8, i8 addrspace(4)* %3056, align 1, !tbaa !14
  %3058 = zext i8 %3057 to i64
  %3059 = shl nuw nsw i64 %3058, 48
  %3060 = or i64 %3055, %3059
  %3061 = getelementptr inbounds i8, i8 addrspace(4)* %3022, i64 7
  %3062 = load i8, i8 addrspace(4)* %3061, align 1, !tbaa !14
  %3063 = zext i8 %3062 to i64
  %3064 = shl nuw i64 %3063, 56
  %3065 = or i64 %3060, %3064
  %3066 = add nsw i32 %3023, -8
  %3067 = getelementptr inbounds i8, i8 addrspace(4)* %3022, i64 8
  br label %3081

3068:                                             ; preds = %3026, %3068
  %3069 = phi i32 [ %3079, %3068 ], [ 0, %3026 ]
  %3070 = phi i64 [ %3078, %3068 ], [ 0, %3026 ]
  %3071 = zext i32 %3069 to i64
  %3072 = getelementptr inbounds i8, i8 addrspace(4)* %3022, i64 %3071
  %3073 = load i8, i8 addrspace(4)* %3072, align 1, !tbaa !14
  %3074 = zext i8 %3073 to i64
  %3075 = shl i32 %3069, 3
  %3076 = zext i32 %3075 to i64
  %3077 = shl nuw i64 %3074, %3076
  %3078 = or i64 %3077, %3070
  %3079 = add nuw nsw i32 %3069, 1
  %3080 = icmp eq i32 %3079, %3023
  br i1 %3080, label %3081, label %3068

3081:                                             ; preds = %3068, %3028, %3026
  %3082 = phi i8 addrspace(4)* [ %3067, %3028 ], [ %3022, %3026 ], [ %3022, %3068 ]
  %3083 = phi i32 [ %3066, %3028 ], [ 0, %3026 ], [ 0, %3068 ]
  %3084 = phi i64 [ %3065, %3028 ], [ 0, %3026 ], [ %3078, %3068 ]
  %3085 = icmp ugt i32 %3083, 7
  br i1 %3085, label %3088, label %3086

3086:                                             ; preds = %3081
  %3087 = icmp eq i32 %3083, 0
  br i1 %3087, label %3141, label %3128

3088:                                             ; preds = %3081
  %3089 = load i8, i8 addrspace(4)* %3082, align 1, !tbaa !14
  %3090 = zext i8 %3089 to i64
  %3091 = getelementptr inbounds i8, i8 addrspace(4)* %3082, i64 1
  %3092 = load i8, i8 addrspace(4)* %3091, align 1, !tbaa !14
  %3093 = zext i8 %3092 to i64
  %3094 = shl nuw nsw i64 %3093, 8
  %3095 = or i64 %3094, %3090
  %3096 = getelementptr inbounds i8, i8 addrspace(4)* %3082, i64 2
  %3097 = load i8, i8 addrspace(4)* %3096, align 1, !tbaa !14
  %3098 = zext i8 %3097 to i64
  %3099 = shl nuw nsw i64 %3098, 16
  %3100 = or i64 %3095, %3099
  %3101 = getelementptr inbounds i8, i8 addrspace(4)* %3082, i64 3
  %3102 = load i8, i8 addrspace(4)* %3101, align 1, !tbaa !14
  %3103 = zext i8 %3102 to i64
  %3104 = shl nuw nsw i64 %3103, 24
  %3105 = or i64 %3100, %3104
  %3106 = getelementptr inbounds i8, i8 addrspace(4)* %3082, i64 4
  %3107 = load i8, i8 addrspace(4)* %3106, align 1, !tbaa !14
  %3108 = zext i8 %3107 to i64
  %3109 = shl nuw nsw i64 %3108, 32
  %3110 = or i64 %3105, %3109
  %3111 = getelementptr inbounds i8, i8 addrspace(4)* %3082, i64 5
  %3112 = load i8, i8 addrspace(4)* %3111, align 1, !tbaa !14
  %3113 = zext i8 %3112 to i64
  %3114 = shl nuw nsw i64 %3113, 40
  %3115 = or i64 %3110, %3114
  %3116 = getelementptr inbounds i8, i8 addrspace(4)* %3082, i64 6
  %3117 = load i8, i8 addrspace(4)* %3116, align 1, !tbaa !14
  %3118 = zext i8 %3117 to i64
  %3119 = shl nuw nsw i64 %3118, 48
  %3120 = or i64 %3115, %3119
  %3121 = getelementptr inbounds i8, i8 addrspace(4)* %3082, i64 7
  %3122 = load i8, i8 addrspace(4)* %3121, align 1, !tbaa !14
  %3123 = zext i8 %3122 to i64
  %3124 = shl nuw i64 %3123, 56
  %3125 = or i64 %3120, %3124
  %3126 = add nsw i32 %3083, -8
  %3127 = getelementptr inbounds i8, i8 addrspace(4)* %3082, i64 8
  br label %3141

3128:                                             ; preds = %3086, %3128
  %3129 = phi i32 [ %3139, %3128 ], [ 0, %3086 ]
  %3130 = phi i64 [ %3138, %3128 ], [ 0, %3086 ]
  %3131 = zext i32 %3129 to i64
  %3132 = getelementptr inbounds i8, i8 addrspace(4)* %3082, i64 %3131
  %3133 = load i8, i8 addrspace(4)* %3132, align 1, !tbaa !14
  %3134 = zext i8 %3133 to i64
  %3135 = shl i32 %3129, 3
  %3136 = zext i32 %3135 to i64
  %3137 = shl nuw i64 %3134, %3136
  %3138 = or i64 %3137, %3130
  %3139 = add nuw nsw i32 %3129, 1
  %3140 = icmp eq i32 %3139, %3083
  br i1 %3140, label %3141, label %3128

3141:                                             ; preds = %3128, %3088, %3086
  %3142 = phi i8 addrspace(4)* [ %3127, %3088 ], [ %3082, %3086 ], [ %3082, %3128 ]
  %3143 = phi i32 [ %3126, %3088 ], [ 0, %3086 ], [ 0, %3128 ]
  %3144 = phi i64 [ %3125, %3088 ], [ 0, %3086 ], [ %3138, %3128 ]
  %3145 = icmp ugt i32 %3143, 7
  br i1 %3145, label %3148, label %3146

3146:                                             ; preds = %3141
  %3147 = icmp eq i32 %3143, 0
  br i1 %3147, label %3199, label %3186

3148:                                             ; preds = %3141
  %3149 = load i8, i8 addrspace(4)* %3142, align 1, !tbaa !14
  %3150 = zext i8 %3149 to i64
  %3151 = getelementptr inbounds i8, i8 addrspace(4)* %3142, i64 1
  %3152 = load i8, i8 addrspace(4)* %3151, align 1, !tbaa !14
  %3153 = zext i8 %3152 to i64
  %3154 = shl nuw nsw i64 %3153, 8
  %3155 = or i64 %3154, %3150
  %3156 = getelementptr inbounds i8, i8 addrspace(4)* %3142, i64 2
  %3157 = load i8, i8 addrspace(4)* %3156, align 1, !tbaa !14
  %3158 = zext i8 %3157 to i64
  %3159 = shl nuw nsw i64 %3158, 16
  %3160 = or i64 %3155, %3159
  %3161 = getelementptr inbounds i8, i8 addrspace(4)* %3142, i64 3
  %3162 = load i8, i8 addrspace(4)* %3161, align 1, !tbaa !14
  %3163 = zext i8 %3162 to i64
  %3164 = shl nuw nsw i64 %3163, 24
  %3165 = or i64 %3160, %3164
  %3166 = getelementptr inbounds i8, i8 addrspace(4)* %3142, i64 4
  %3167 = load i8, i8 addrspace(4)* %3166, align 1, !tbaa !14
  %3168 = zext i8 %3167 to i64
  %3169 = shl nuw nsw i64 %3168, 32
  %3170 = or i64 %3165, %3169
  %3171 = getelementptr inbounds i8, i8 addrspace(4)* %3142, i64 5
  %3172 = load i8, i8 addrspace(4)* %3171, align 1, !tbaa !14
  %3173 = zext i8 %3172 to i64
  %3174 = shl nuw nsw i64 %3173, 40
  %3175 = or i64 %3170, %3174
  %3176 = getelementptr inbounds i8, i8 addrspace(4)* %3142, i64 6
  %3177 = load i8, i8 addrspace(4)* %3176, align 1, !tbaa !14
  %3178 = zext i8 %3177 to i64
  %3179 = shl nuw nsw i64 %3178, 48
  %3180 = or i64 %3175, %3179
  %3181 = getelementptr inbounds i8, i8 addrspace(4)* %3142, i64 7
  %3182 = load i8, i8 addrspace(4)* %3181, align 1, !tbaa !14
  %3183 = zext i8 %3182 to i64
  %3184 = shl nuw i64 %3183, 56
  %3185 = or i64 %3180, %3184
  br label %3199

3186:                                             ; preds = %3146, %3186
  %3187 = phi i32 [ %3197, %3186 ], [ 0, %3146 ]
  %3188 = phi i64 [ %3196, %3186 ], [ 0, %3146 ]
  %3189 = zext i32 %3187 to i64
  %3190 = getelementptr inbounds i8, i8 addrspace(4)* %3142, i64 %3189
  %3191 = load i8, i8 addrspace(4)* %3190, align 1, !tbaa !14
  %3192 = zext i8 %3191 to i64
  %3193 = shl i32 %3187, 3
  %3194 = zext i32 %3193 to i64
  %3195 = shl nuw i64 %3192, %3194
  %3196 = or i64 %3195, %3188
  %3197 = add nuw nsw i32 %3187, 1
  %3198 = icmp eq i32 %3197, %3143
  br i1 %3198, label %3199, label %3186

3199:                                             ; preds = %3186, %3148, %3146
  %3200 = phi i64 [ %3185, %3148 ], [ 0, %3146 ], [ %3196, %3186 ]
  %3201 = shl nuw nsw i64 %2782, 2
  %3202 = add nuw nsw i64 %3201, 28
  %3203 = and i64 %3202, 480
  %3204 = and i64 %2784, -225
  %3205 = or i64 %3204, %3203
  %3206 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %15, i64 noundef %3205, i64 noundef %2844, i64 noundef %2904, i64 noundef %2964, i64 noundef %3024, i64 noundef %3084, i64 noundef %3144, i64 noundef %3200) #11
  %3207 = sub i64 %2774, %2782
  %3208 = getelementptr inbounds i8, i8 addrspace(4)* %2775, i64 %2782
  %3209 = icmp eq i64 %3207, 0
  br i1 %3209, label %3210, label %2773

3210:                                             ; preds = %3199, %2765
  %3211 = phi <2 x i64> [ %2768, %2765 ], [ %3206, %3199 ]
  %3212 = extractelement <2 x i64> %3211, i64 0
  %3213 = and i64 %3212, -227
  %3214 = or i64 %3213, 34
  %3215 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %15, i64 noundef %3214, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %3216 = load i32, i32 addrspace(3)* getelementptr inbounds ([0 x i32], [0 x i32] addrspace(3)* @seme, i32 0, i32 0), align 4, !tbaa !5
  %3217 = load i32, i32 addrspace(1)* %10, align 4, !tbaa !5
  %3218 = add nsw i32 %3217, %3216
  store i32 %3218, i32 addrspace(1)* %10, align 4, !tbaa !5
  %3219 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %15, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %3220 = extractelement <2 x i64> %3219, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([21 x i8], [21 x i8] addrspace(4)* @.str.2, i64 0, i64 0) to i8*), i8* null), label %3662, label %3221

3221:                                             ; preds = %3210
  %3222 = and i64 %3220, 2
  %3223 = and i64 %3220, -3
  %3224 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %3223, i64 0
  br label %3225

3225:                                             ; preds = %3651, %3221
  %3226 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([21 x i8], [21 x i8] addrspace(4)* @.str.2, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([21 x i8], [21 x i8] addrspace(4)* @.str.2, i64 0, i64 20) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([21 x i8]* addrspacecast ([21 x i8] addrspace(4)* @.str.2 to [21 x i8]*) to i64)), i64 1))), %3221 ], [ %3659, %3651 ]
  %3227 = phi i8 addrspace(4)* [ getelementptr inbounds ([21 x i8], [21 x i8] addrspace(4)* @.str.2, i64 0, i64 0), %3221 ], [ %3660, %3651 ]
  %3228 = phi <2 x i64> [ %3224, %3221 ], [ %3658, %3651 ]
  %3229 = icmp ugt i64 %3226, 56
  %3230 = extractelement <2 x i64> %3228, i64 0
  %3231 = or i64 %3230, %3222
  %3232 = insertelement <2 x i64> poison, i64 %3231, i64 0
  %3233 = select i1 %3229, <2 x i64> %3228, <2 x i64> %3232
  %3234 = tail call i64 @llvm.umin.i64(i64 %3226, i64 56)
  %3235 = trunc i64 %3234 to i32
  %3236 = extractelement <2 x i64> %3233, i64 0
  %3237 = icmp ugt i32 %3235, 7
  br i1 %3237, label %3253, label %3238

3238:                                             ; preds = %3225
  %3239 = icmp eq i32 %3235, 0
  br i1 %3239, label %3293, label %3240

3240:                                             ; preds = %3238, %3240
  %3241 = phi i32 [ %3251, %3240 ], [ 0, %3238 ]
  %3242 = phi i64 [ %3250, %3240 ], [ 0, %3238 ]
  %3243 = zext i32 %3241 to i64
  %3244 = getelementptr inbounds i8, i8 addrspace(4)* %3227, i64 %3243
  %3245 = load i8, i8 addrspace(4)* %3244, align 1, !tbaa !14
  %3246 = zext i8 %3245 to i64
  %3247 = shl i32 %3241, 3
  %3248 = zext i32 %3247 to i64
  %3249 = shl nuw i64 %3246, %3248
  %3250 = or i64 %3249, %3242
  %3251 = add nuw nsw i32 %3241, 1
  %3252 = icmp eq i32 %3251, %3235
  br i1 %3252, label %3293, label %3240, !llvm.loop !15

3253:                                             ; preds = %3225
  %3254 = load i8, i8 addrspace(4)* %3227, align 1, !tbaa !14
  %3255 = zext i8 %3254 to i64
  %3256 = getelementptr inbounds i8, i8 addrspace(4)* %3227, i64 1
  %3257 = load i8, i8 addrspace(4)* %3256, align 1, !tbaa !14
  %3258 = zext i8 %3257 to i64
  %3259 = shl nuw nsw i64 %3258, 8
  %3260 = or i64 %3259, %3255
  %3261 = getelementptr inbounds i8, i8 addrspace(4)* %3227, i64 2
  %3262 = load i8, i8 addrspace(4)* %3261, align 1, !tbaa !14
  %3263 = zext i8 %3262 to i64
  %3264 = shl nuw nsw i64 %3263, 16
  %3265 = or i64 %3260, %3264
  %3266 = getelementptr inbounds i8, i8 addrspace(4)* %3227, i64 3
  %3267 = load i8, i8 addrspace(4)* %3266, align 1, !tbaa !14
  %3268 = zext i8 %3267 to i64
  %3269 = shl nuw nsw i64 %3268, 24
  %3270 = or i64 %3265, %3269
  %3271 = getelementptr inbounds i8, i8 addrspace(4)* %3227, i64 4
  %3272 = load i8, i8 addrspace(4)* %3271, align 1, !tbaa !14
  %3273 = zext i8 %3272 to i64
  %3274 = shl nuw nsw i64 %3273, 32
  %3275 = or i64 %3270, %3274
  %3276 = getelementptr inbounds i8, i8 addrspace(4)* %3227, i64 5
  %3277 = load i8, i8 addrspace(4)* %3276, align 1, !tbaa !14
  %3278 = zext i8 %3277 to i64
  %3279 = shl nuw nsw i64 %3278, 40
  %3280 = or i64 %3275, %3279
  %3281 = getelementptr inbounds i8, i8 addrspace(4)* %3227, i64 6
  %3282 = load i8, i8 addrspace(4)* %3281, align 1, !tbaa !14
  %3283 = zext i8 %3282 to i64
  %3284 = shl nuw nsw i64 %3283, 48
  %3285 = or i64 %3280, %3284
  %3286 = getelementptr inbounds i8, i8 addrspace(4)* %3227, i64 7
  %3287 = load i8, i8 addrspace(4)* %3286, align 1, !tbaa !14
  %3288 = zext i8 %3287 to i64
  %3289 = shl nuw i64 %3288, 56
  %3290 = or i64 %3285, %3289
  %3291 = add nsw i32 %3235, -8
  %3292 = getelementptr inbounds i8, i8 addrspace(4)* %3227, i64 8
  br label %3293

3293:                                             ; preds = %3240, %3253, %3238
  %3294 = phi i8 addrspace(4)* [ %3292, %3253 ], [ %3227, %3238 ], [ %3227, %3240 ]
  %3295 = phi i32 [ %3291, %3253 ], [ 0, %3238 ], [ 0, %3240 ]
  %3296 = phi i64 [ %3290, %3253 ], [ 0, %3238 ], [ %3250, %3240 ]
  %3297 = icmp ugt i32 %3295, 7
  br i1 %3297, label %3313, label %3298

3298:                                             ; preds = %3293
  %3299 = icmp eq i32 %3295, 0
  br i1 %3299, label %3353, label %3300

3300:                                             ; preds = %3298, %3300
  %3301 = phi i32 [ %3311, %3300 ], [ 0, %3298 ]
  %3302 = phi i64 [ %3310, %3300 ], [ 0, %3298 ]
  %3303 = zext i32 %3301 to i64
  %3304 = getelementptr inbounds i8, i8 addrspace(4)* %3294, i64 %3303
  %3305 = load i8, i8 addrspace(4)* %3304, align 1, !tbaa !14
  %3306 = zext i8 %3305 to i64
  %3307 = shl i32 %3301, 3
  %3308 = zext i32 %3307 to i64
  %3309 = shl nuw i64 %3306, %3308
  %3310 = or i64 %3309, %3302
  %3311 = add nuw nsw i32 %3301, 1
  %3312 = icmp eq i32 %3311, %3295
  br i1 %3312, label %3353, label %3300

3313:                                             ; preds = %3293
  %3314 = load i8, i8 addrspace(4)* %3294, align 1, !tbaa !14
  %3315 = zext i8 %3314 to i64
  %3316 = getelementptr inbounds i8, i8 addrspace(4)* %3294, i64 1
  %3317 = load i8, i8 addrspace(4)* %3316, align 1, !tbaa !14
  %3318 = zext i8 %3317 to i64
  %3319 = shl nuw nsw i64 %3318, 8
  %3320 = or i64 %3319, %3315
  %3321 = getelementptr inbounds i8, i8 addrspace(4)* %3294, i64 2
  %3322 = load i8, i8 addrspace(4)* %3321, align 1, !tbaa !14
  %3323 = zext i8 %3322 to i64
  %3324 = shl nuw nsw i64 %3323, 16
  %3325 = or i64 %3320, %3324
  %3326 = getelementptr inbounds i8, i8 addrspace(4)* %3294, i64 3
  %3327 = load i8, i8 addrspace(4)* %3326, align 1, !tbaa !14
  %3328 = zext i8 %3327 to i64
  %3329 = shl nuw nsw i64 %3328, 24
  %3330 = or i64 %3325, %3329
  %3331 = getelementptr inbounds i8, i8 addrspace(4)* %3294, i64 4
  %3332 = load i8, i8 addrspace(4)* %3331, align 1, !tbaa !14
  %3333 = zext i8 %3332 to i64
  %3334 = shl nuw nsw i64 %3333, 32
  %3335 = or i64 %3330, %3334
  %3336 = getelementptr inbounds i8, i8 addrspace(4)* %3294, i64 5
  %3337 = load i8, i8 addrspace(4)* %3336, align 1, !tbaa !14
  %3338 = zext i8 %3337 to i64
  %3339 = shl nuw nsw i64 %3338, 40
  %3340 = or i64 %3335, %3339
  %3341 = getelementptr inbounds i8, i8 addrspace(4)* %3294, i64 6
  %3342 = load i8, i8 addrspace(4)* %3341, align 1, !tbaa !14
  %3343 = zext i8 %3342 to i64
  %3344 = shl nuw nsw i64 %3343, 48
  %3345 = or i64 %3340, %3344
  %3346 = getelementptr inbounds i8, i8 addrspace(4)* %3294, i64 7
  %3347 = load i8, i8 addrspace(4)* %3346, align 1, !tbaa !14
  %3348 = zext i8 %3347 to i64
  %3349 = shl nuw i64 %3348, 56
  %3350 = or i64 %3345, %3349
  %3351 = add nsw i32 %3295, -8
  %3352 = getelementptr inbounds i8, i8 addrspace(4)* %3294, i64 8
  br label %3353

3353:                                             ; preds = %3300, %3313, %3298
  %3354 = phi i8 addrspace(4)* [ %3352, %3313 ], [ %3294, %3298 ], [ %3294, %3300 ]
  %3355 = phi i32 [ %3351, %3313 ], [ 0, %3298 ], [ 0, %3300 ]
  %3356 = phi i64 [ %3350, %3313 ], [ 0, %3298 ], [ %3310, %3300 ]
  %3357 = icmp ugt i32 %3355, 7
  br i1 %3357, label %3373, label %3358

3358:                                             ; preds = %3353
  %3359 = icmp eq i32 %3355, 0
  br i1 %3359, label %3413, label %3360

3360:                                             ; preds = %3358, %3360
  %3361 = phi i32 [ %3371, %3360 ], [ 0, %3358 ]
  %3362 = phi i64 [ %3370, %3360 ], [ 0, %3358 ]
  %3363 = zext i32 %3361 to i64
  %3364 = getelementptr inbounds i8, i8 addrspace(4)* %3354, i64 %3363
  %3365 = load i8, i8 addrspace(4)* %3364, align 1, !tbaa !14
  %3366 = zext i8 %3365 to i64
  %3367 = shl i32 %3361, 3
  %3368 = zext i32 %3367 to i64
  %3369 = shl nuw i64 %3366, %3368
  %3370 = or i64 %3369, %3362
  %3371 = add nuw nsw i32 %3361, 1
  %3372 = icmp eq i32 %3371, %3355
  br i1 %3372, label %3413, label %3360

3373:                                             ; preds = %3353
  %3374 = load i8, i8 addrspace(4)* %3354, align 1, !tbaa !14
  %3375 = zext i8 %3374 to i64
  %3376 = getelementptr inbounds i8, i8 addrspace(4)* %3354, i64 1
  %3377 = load i8, i8 addrspace(4)* %3376, align 1, !tbaa !14
  %3378 = zext i8 %3377 to i64
  %3379 = shl nuw nsw i64 %3378, 8
  %3380 = or i64 %3379, %3375
  %3381 = getelementptr inbounds i8, i8 addrspace(4)* %3354, i64 2
  %3382 = load i8, i8 addrspace(4)* %3381, align 1, !tbaa !14
  %3383 = zext i8 %3382 to i64
  %3384 = shl nuw nsw i64 %3383, 16
  %3385 = or i64 %3380, %3384
  %3386 = getelementptr inbounds i8, i8 addrspace(4)* %3354, i64 3
  %3387 = load i8, i8 addrspace(4)* %3386, align 1, !tbaa !14
  %3388 = zext i8 %3387 to i64
  %3389 = shl nuw nsw i64 %3388, 24
  %3390 = or i64 %3385, %3389
  %3391 = getelementptr inbounds i8, i8 addrspace(4)* %3354, i64 4
  %3392 = load i8, i8 addrspace(4)* %3391, align 1, !tbaa !14
  %3393 = zext i8 %3392 to i64
  %3394 = shl nuw nsw i64 %3393, 32
  %3395 = or i64 %3390, %3394
  %3396 = getelementptr inbounds i8, i8 addrspace(4)* %3354, i64 5
  %3397 = load i8, i8 addrspace(4)* %3396, align 1, !tbaa !14
  %3398 = zext i8 %3397 to i64
  %3399 = shl nuw nsw i64 %3398, 40
  %3400 = or i64 %3395, %3399
  %3401 = getelementptr inbounds i8, i8 addrspace(4)* %3354, i64 6
  %3402 = load i8, i8 addrspace(4)* %3401, align 1, !tbaa !14
  %3403 = zext i8 %3402 to i64
  %3404 = shl nuw nsw i64 %3403, 48
  %3405 = or i64 %3400, %3404
  %3406 = getelementptr inbounds i8, i8 addrspace(4)* %3354, i64 7
  %3407 = load i8, i8 addrspace(4)* %3406, align 1, !tbaa !14
  %3408 = zext i8 %3407 to i64
  %3409 = shl nuw i64 %3408, 56
  %3410 = or i64 %3405, %3409
  %3411 = add nsw i32 %3355, -8
  %3412 = getelementptr inbounds i8, i8 addrspace(4)* %3354, i64 8
  br label %3413

3413:                                             ; preds = %3360, %3373, %3358
  %3414 = phi i8 addrspace(4)* [ %3412, %3373 ], [ %3354, %3358 ], [ %3354, %3360 ]
  %3415 = phi i32 [ %3411, %3373 ], [ 0, %3358 ], [ 0, %3360 ]
  %3416 = phi i64 [ %3410, %3373 ], [ 0, %3358 ], [ %3370, %3360 ]
  %3417 = icmp ugt i32 %3415, 7
  br i1 %3417, label %3433, label %3418

3418:                                             ; preds = %3413
  %3419 = icmp eq i32 %3415, 0
  br i1 %3419, label %3473, label %3420

3420:                                             ; preds = %3418, %3420
  %3421 = phi i32 [ %3431, %3420 ], [ 0, %3418 ]
  %3422 = phi i64 [ %3430, %3420 ], [ 0, %3418 ]
  %3423 = zext i32 %3421 to i64
  %3424 = getelementptr inbounds i8, i8 addrspace(4)* %3414, i64 %3423
  %3425 = load i8, i8 addrspace(4)* %3424, align 1, !tbaa !14
  %3426 = zext i8 %3425 to i64
  %3427 = shl i32 %3421, 3
  %3428 = zext i32 %3427 to i64
  %3429 = shl nuw i64 %3426, %3428
  %3430 = or i64 %3429, %3422
  %3431 = add nuw nsw i32 %3421, 1
  %3432 = icmp eq i32 %3431, %3415
  br i1 %3432, label %3473, label %3420

3433:                                             ; preds = %3413
  %3434 = load i8, i8 addrspace(4)* %3414, align 1, !tbaa !14
  %3435 = zext i8 %3434 to i64
  %3436 = getelementptr inbounds i8, i8 addrspace(4)* %3414, i64 1
  %3437 = load i8, i8 addrspace(4)* %3436, align 1, !tbaa !14
  %3438 = zext i8 %3437 to i64
  %3439 = shl nuw nsw i64 %3438, 8
  %3440 = or i64 %3439, %3435
  %3441 = getelementptr inbounds i8, i8 addrspace(4)* %3414, i64 2
  %3442 = load i8, i8 addrspace(4)* %3441, align 1, !tbaa !14
  %3443 = zext i8 %3442 to i64
  %3444 = shl nuw nsw i64 %3443, 16
  %3445 = or i64 %3440, %3444
  %3446 = getelementptr inbounds i8, i8 addrspace(4)* %3414, i64 3
  %3447 = load i8, i8 addrspace(4)* %3446, align 1, !tbaa !14
  %3448 = zext i8 %3447 to i64
  %3449 = shl nuw nsw i64 %3448, 24
  %3450 = or i64 %3445, %3449
  %3451 = getelementptr inbounds i8, i8 addrspace(4)* %3414, i64 4
  %3452 = load i8, i8 addrspace(4)* %3451, align 1, !tbaa !14
  %3453 = zext i8 %3452 to i64
  %3454 = shl nuw nsw i64 %3453, 32
  %3455 = or i64 %3450, %3454
  %3456 = getelementptr inbounds i8, i8 addrspace(4)* %3414, i64 5
  %3457 = load i8, i8 addrspace(4)* %3456, align 1, !tbaa !14
  %3458 = zext i8 %3457 to i64
  %3459 = shl nuw nsw i64 %3458, 40
  %3460 = or i64 %3455, %3459
  %3461 = getelementptr inbounds i8, i8 addrspace(4)* %3414, i64 6
  %3462 = load i8, i8 addrspace(4)* %3461, align 1, !tbaa !14
  %3463 = zext i8 %3462 to i64
  %3464 = shl nuw nsw i64 %3463, 48
  %3465 = or i64 %3460, %3464
  %3466 = getelementptr inbounds i8, i8 addrspace(4)* %3414, i64 7
  %3467 = load i8, i8 addrspace(4)* %3466, align 1, !tbaa !14
  %3468 = zext i8 %3467 to i64
  %3469 = shl nuw i64 %3468, 56
  %3470 = or i64 %3465, %3469
  %3471 = add nsw i32 %3415, -8
  %3472 = getelementptr inbounds i8, i8 addrspace(4)* %3414, i64 8
  br label %3473

3473:                                             ; preds = %3420, %3433, %3418
  %3474 = phi i8 addrspace(4)* [ %3472, %3433 ], [ %3414, %3418 ], [ %3414, %3420 ]
  %3475 = phi i32 [ %3471, %3433 ], [ 0, %3418 ], [ 0, %3420 ]
  %3476 = phi i64 [ %3470, %3433 ], [ 0, %3418 ], [ %3430, %3420 ]
  %3477 = icmp ugt i32 %3475, 7
  br i1 %3477, label %3493, label %3478

3478:                                             ; preds = %3473
  %3479 = icmp eq i32 %3475, 0
  br i1 %3479, label %3533, label %3480

3480:                                             ; preds = %3478, %3480
  %3481 = phi i32 [ %3491, %3480 ], [ 0, %3478 ]
  %3482 = phi i64 [ %3490, %3480 ], [ 0, %3478 ]
  %3483 = zext i32 %3481 to i64
  %3484 = getelementptr inbounds i8, i8 addrspace(4)* %3474, i64 %3483
  %3485 = load i8, i8 addrspace(4)* %3484, align 1, !tbaa !14
  %3486 = zext i8 %3485 to i64
  %3487 = shl i32 %3481, 3
  %3488 = zext i32 %3487 to i64
  %3489 = shl nuw i64 %3486, %3488
  %3490 = or i64 %3489, %3482
  %3491 = add nuw nsw i32 %3481, 1
  %3492 = icmp eq i32 %3491, %3475
  br i1 %3492, label %3533, label %3480

3493:                                             ; preds = %3473
  %3494 = load i8, i8 addrspace(4)* %3474, align 1, !tbaa !14
  %3495 = zext i8 %3494 to i64
  %3496 = getelementptr inbounds i8, i8 addrspace(4)* %3474, i64 1
  %3497 = load i8, i8 addrspace(4)* %3496, align 1, !tbaa !14
  %3498 = zext i8 %3497 to i64
  %3499 = shl nuw nsw i64 %3498, 8
  %3500 = or i64 %3499, %3495
  %3501 = getelementptr inbounds i8, i8 addrspace(4)* %3474, i64 2
  %3502 = load i8, i8 addrspace(4)* %3501, align 1, !tbaa !14
  %3503 = zext i8 %3502 to i64
  %3504 = shl nuw nsw i64 %3503, 16
  %3505 = or i64 %3500, %3504
  %3506 = getelementptr inbounds i8, i8 addrspace(4)* %3474, i64 3
  %3507 = load i8, i8 addrspace(4)* %3506, align 1, !tbaa !14
  %3508 = zext i8 %3507 to i64
  %3509 = shl nuw nsw i64 %3508, 24
  %3510 = or i64 %3505, %3509
  %3511 = getelementptr inbounds i8, i8 addrspace(4)* %3474, i64 4
  %3512 = load i8, i8 addrspace(4)* %3511, align 1, !tbaa !14
  %3513 = zext i8 %3512 to i64
  %3514 = shl nuw nsw i64 %3513, 32
  %3515 = or i64 %3510, %3514
  %3516 = getelementptr inbounds i8, i8 addrspace(4)* %3474, i64 5
  %3517 = load i8, i8 addrspace(4)* %3516, align 1, !tbaa !14
  %3518 = zext i8 %3517 to i64
  %3519 = shl nuw nsw i64 %3518, 40
  %3520 = or i64 %3515, %3519
  %3521 = getelementptr inbounds i8, i8 addrspace(4)* %3474, i64 6
  %3522 = load i8, i8 addrspace(4)* %3521, align 1, !tbaa !14
  %3523 = zext i8 %3522 to i64
  %3524 = shl nuw nsw i64 %3523, 48
  %3525 = or i64 %3520, %3524
  %3526 = getelementptr inbounds i8, i8 addrspace(4)* %3474, i64 7
  %3527 = load i8, i8 addrspace(4)* %3526, align 1, !tbaa !14
  %3528 = zext i8 %3527 to i64
  %3529 = shl nuw i64 %3528, 56
  %3530 = or i64 %3525, %3529
  %3531 = add nsw i32 %3475, -8
  %3532 = getelementptr inbounds i8, i8 addrspace(4)* %3474, i64 8
  br label %3533

3533:                                             ; preds = %3480, %3493, %3478
  %3534 = phi i8 addrspace(4)* [ %3532, %3493 ], [ %3474, %3478 ], [ %3474, %3480 ]
  %3535 = phi i32 [ %3531, %3493 ], [ 0, %3478 ], [ 0, %3480 ]
  %3536 = phi i64 [ %3530, %3493 ], [ 0, %3478 ], [ %3490, %3480 ]
  %3537 = icmp ugt i32 %3535, 7
  br i1 %3537, label %3553, label %3538

3538:                                             ; preds = %3533
  %3539 = icmp eq i32 %3535, 0
  br i1 %3539, label %3593, label %3540

3540:                                             ; preds = %3538, %3540
  %3541 = phi i32 [ %3551, %3540 ], [ 0, %3538 ]
  %3542 = phi i64 [ %3550, %3540 ], [ 0, %3538 ]
  %3543 = zext i32 %3541 to i64
  %3544 = getelementptr inbounds i8, i8 addrspace(4)* %3534, i64 %3543
  %3545 = load i8, i8 addrspace(4)* %3544, align 1, !tbaa !14
  %3546 = zext i8 %3545 to i64
  %3547 = shl i32 %3541, 3
  %3548 = zext i32 %3547 to i64
  %3549 = shl nuw i64 %3546, %3548
  %3550 = or i64 %3549, %3542
  %3551 = add nuw nsw i32 %3541, 1
  %3552 = icmp eq i32 %3551, %3535
  br i1 %3552, label %3593, label %3540

3553:                                             ; preds = %3533
  %3554 = load i8, i8 addrspace(4)* %3534, align 1, !tbaa !14
  %3555 = zext i8 %3554 to i64
  %3556 = getelementptr inbounds i8, i8 addrspace(4)* %3534, i64 1
  %3557 = load i8, i8 addrspace(4)* %3556, align 1, !tbaa !14
  %3558 = zext i8 %3557 to i64
  %3559 = shl nuw nsw i64 %3558, 8
  %3560 = or i64 %3559, %3555
  %3561 = getelementptr inbounds i8, i8 addrspace(4)* %3534, i64 2
  %3562 = load i8, i8 addrspace(4)* %3561, align 1, !tbaa !14
  %3563 = zext i8 %3562 to i64
  %3564 = shl nuw nsw i64 %3563, 16
  %3565 = or i64 %3560, %3564
  %3566 = getelementptr inbounds i8, i8 addrspace(4)* %3534, i64 3
  %3567 = load i8, i8 addrspace(4)* %3566, align 1, !tbaa !14
  %3568 = zext i8 %3567 to i64
  %3569 = shl nuw nsw i64 %3568, 24
  %3570 = or i64 %3565, %3569
  %3571 = getelementptr inbounds i8, i8 addrspace(4)* %3534, i64 4
  %3572 = load i8, i8 addrspace(4)* %3571, align 1, !tbaa !14
  %3573 = zext i8 %3572 to i64
  %3574 = shl nuw nsw i64 %3573, 32
  %3575 = or i64 %3570, %3574
  %3576 = getelementptr inbounds i8, i8 addrspace(4)* %3534, i64 5
  %3577 = load i8, i8 addrspace(4)* %3576, align 1, !tbaa !14
  %3578 = zext i8 %3577 to i64
  %3579 = shl nuw nsw i64 %3578, 40
  %3580 = or i64 %3575, %3579
  %3581 = getelementptr inbounds i8, i8 addrspace(4)* %3534, i64 6
  %3582 = load i8, i8 addrspace(4)* %3581, align 1, !tbaa !14
  %3583 = zext i8 %3582 to i64
  %3584 = shl nuw nsw i64 %3583, 48
  %3585 = or i64 %3580, %3584
  %3586 = getelementptr inbounds i8, i8 addrspace(4)* %3534, i64 7
  %3587 = load i8, i8 addrspace(4)* %3586, align 1, !tbaa !14
  %3588 = zext i8 %3587 to i64
  %3589 = shl nuw i64 %3588, 56
  %3590 = or i64 %3585, %3589
  %3591 = add nsw i32 %3535, -8
  %3592 = getelementptr inbounds i8, i8 addrspace(4)* %3534, i64 8
  br label %3593

3593:                                             ; preds = %3540, %3553, %3538
  %3594 = phi i8 addrspace(4)* [ %3592, %3553 ], [ %3534, %3538 ], [ %3534, %3540 ]
  %3595 = phi i32 [ %3591, %3553 ], [ 0, %3538 ], [ 0, %3540 ]
  %3596 = phi i64 [ %3590, %3553 ], [ 0, %3538 ], [ %3550, %3540 ]
  %3597 = icmp ugt i32 %3595, 7
  br i1 %3597, label %3613, label %3598

3598:                                             ; preds = %3593
  %3599 = icmp eq i32 %3595, 0
  br i1 %3599, label %3651, label %3600

3600:                                             ; preds = %3598, %3600
  %3601 = phi i32 [ %3611, %3600 ], [ 0, %3598 ]
  %3602 = phi i64 [ %3610, %3600 ], [ 0, %3598 ]
  %3603 = zext i32 %3601 to i64
  %3604 = getelementptr inbounds i8, i8 addrspace(4)* %3594, i64 %3603
  %3605 = load i8, i8 addrspace(4)* %3604, align 1, !tbaa !14
  %3606 = zext i8 %3605 to i64
  %3607 = shl i32 %3601, 3
  %3608 = zext i32 %3607 to i64
  %3609 = shl nuw i64 %3606, %3608
  %3610 = or i64 %3609, %3602
  %3611 = add nuw nsw i32 %3601, 1
  %3612 = icmp eq i32 %3611, %3595
  br i1 %3612, label %3651, label %3600

3613:                                             ; preds = %3593
  %3614 = load i8, i8 addrspace(4)* %3594, align 1, !tbaa !14
  %3615 = zext i8 %3614 to i64
  %3616 = getelementptr inbounds i8, i8 addrspace(4)* %3594, i64 1
  %3617 = load i8, i8 addrspace(4)* %3616, align 1, !tbaa !14
  %3618 = zext i8 %3617 to i64
  %3619 = shl nuw nsw i64 %3618, 8
  %3620 = or i64 %3619, %3615
  %3621 = getelementptr inbounds i8, i8 addrspace(4)* %3594, i64 2
  %3622 = load i8, i8 addrspace(4)* %3621, align 1, !tbaa !14
  %3623 = zext i8 %3622 to i64
  %3624 = shl nuw nsw i64 %3623, 16
  %3625 = or i64 %3620, %3624
  %3626 = getelementptr inbounds i8, i8 addrspace(4)* %3594, i64 3
  %3627 = load i8, i8 addrspace(4)* %3626, align 1, !tbaa !14
  %3628 = zext i8 %3627 to i64
  %3629 = shl nuw nsw i64 %3628, 24
  %3630 = or i64 %3625, %3629
  %3631 = getelementptr inbounds i8, i8 addrspace(4)* %3594, i64 4
  %3632 = load i8, i8 addrspace(4)* %3631, align 1, !tbaa !14
  %3633 = zext i8 %3632 to i64
  %3634 = shl nuw nsw i64 %3633, 32
  %3635 = or i64 %3630, %3634
  %3636 = getelementptr inbounds i8, i8 addrspace(4)* %3594, i64 5
  %3637 = load i8, i8 addrspace(4)* %3636, align 1, !tbaa !14
  %3638 = zext i8 %3637 to i64
  %3639 = shl nuw nsw i64 %3638, 40
  %3640 = or i64 %3635, %3639
  %3641 = getelementptr inbounds i8, i8 addrspace(4)* %3594, i64 6
  %3642 = load i8, i8 addrspace(4)* %3641, align 1, !tbaa !14
  %3643 = zext i8 %3642 to i64
  %3644 = shl nuw nsw i64 %3643, 48
  %3645 = or i64 %3640, %3644
  %3646 = getelementptr inbounds i8, i8 addrspace(4)* %3594, i64 7
  %3647 = load i8, i8 addrspace(4)* %3646, align 1, !tbaa !14
  %3648 = zext i8 %3647 to i64
  %3649 = shl nuw i64 %3648, 56
  %3650 = or i64 %3645, %3649
  br label %3651

3651:                                             ; preds = %3600, %3613, %3598
  %3652 = phi i64 [ %3650, %3613 ], [ 0, %3598 ], [ %3610, %3600 ]
  %3653 = shl nuw nsw i64 %3234, 2
  %3654 = add nuw nsw i64 %3653, 28
  %3655 = and i64 %3654, 480
  %3656 = and i64 %3236, -225
  %3657 = or i64 %3656, %3655
  %3658 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %15, i64 noundef %3657, i64 noundef %3296, i64 noundef %3356, i64 noundef %3416, i64 noundef %3476, i64 noundef %3536, i64 noundef %3596, i64 noundef %3652) #11
  %3659 = sub i64 %3226, %3234
  %3660 = getelementptr inbounds i8, i8 addrspace(4)* %3227, i64 %3234
  %3661 = icmp eq i64 %3659, 0
  br i1 %3661, label %3666, label %3225

3662:                                             ; preds = %3210
  %3663 = and i64 %3220, -225
  %3664 = or i64 %3663, 32
  %3665 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %15, i64 noundef %3664, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  br label %3666

3666:                                             ; preds = %3651, %3662
  %3667 = phi <2 x i64> [ %3665, %3662 ], [ %3658, %3651 ]
  %3668 = extractelement <2 x i64> %3667, i64 0
  %3669 = and i64 %3668, -227
  %3670 = or i64 %3669, 34
  %3671 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %15, i64 noundef %3670, i64 noundef 1, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %3672 = load i32, i32 addrspace(3)* getelementptr inbounds ([0 x i32], [0 x i32] addrspace(3)* @seme, i32 0, i32 1), align 4, !tbaa !5
  %3673 = load i32, i32 addrspace(1)* %10, align 4, !tbaa !5
  %3674 = add nsw i32 %3673, %3672
  store i32 %3674, i32 addrspace(1)* %10, align 4, !tbaa !5
  %3675 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %15, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %3676 = extractelement <2 x i64> %3675, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([21 x i8], [21 x i8] addrspace(4)* @.str.2, i64 0, i64 0) to i8*), i8* null), label %4118, label %3677

3677:                                             ; preds = %3666
  %3678 = and i64 %3676, 2
  %3679 = and i64 %3676, -3
  %3680 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %3679, i64 0
  br label %3681

3681:                                             ; preds = %4107, %3677
  %3682 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([21 x i8], [21 x i8] addrspace(4)* @.str.2, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([21 x i8], [21 x i8] addrspace(4)* @.str.2, i64 0, i64 20) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([21 x i8]* addrspacecast ([21 x i8] addrspace(4)* @.str.2 to [21 x i8]*) to i64)), i64 1))), %3677 ], [ %4115, %4107 ]
  %3683 = phi i8 addrspace(4)* [ getelementptr inbounds ([21 x i8], [21 x i8] addrspace(4)* @.str.2, i64 0, i64 0), %3677 ], [ %4116, %4107 ]
  %3684 = phi <2 x i64> [ %3680, %3677 ], [ %4114, %4107 ]
  %3685 = icmp ugt i64 %3682, 56
  %3686 = extractelement <2 x i64> %3684, i64 0
  %3687 = or i64 %3686, %3678
  %3688 = insertelement <2 x i64> poison, i64 %3687, i64 0
  %3689 = select i1 %3685, <2 x i64> %3684, <2 x i64> %3688
  %3690 = tail call i64 @llvm.umin.i64(i64 %3682, i64 56)
  %3691 = trunc i64 %3690 to i32
  %3692 = extractelement <2 x i64> %3689, i64 0
  %3693 = icmp ugt i32 %3691, 7
  br i1 %3693, label %3709, label %3694

3694:                                             ; preds = %3681
  %3695 = icmp eq i32 %3691, 0
  br i1 %3695, label %3749, label %3696

3696:                                             ; preds = %3694, %3696
  %3697 = phi i32 [ %3707, %3696 ], [ 0, %3694 ]
  %3698 = phi i64 [ %3706, %3696 ], [ 0, %3694 ]
  %3699 = zext i32 %3697 to i64
  %3700 = getelementptr inbounds i8, i8 addrspace(4)* %3683, i64 %3699
  %3701 = load i8, i8 addrspace(4)* %3700, align 1, !tbaa !14
  %3702 = zext i8 %3701 to i64
  %3703 = shl i32 %3697, 3
  %3704 = zext i32 %3703 to i64
  %3705 = shl nuw i64 %3702, %3704
  %3706 = or i64 %3705, %3698
  %3707 = add nuw nsw i32 %3697, 1
  %3708 = icmp eq i32 %3707, %3691
  br i1 %3708, label %3749, label %3696, !llvm.loop !15

3709:                                             ; preds = %3681
  %3710 = load i8, i8 addrspace(4)* %3683, align 1, !tbaa !14
  %3711 = zext i8 %3710 to i64
  %3712 = getelementptr inbounds i8, i8 addrspace(4)* %3683, i64 1
  %3713 = load i8, i8 addrspace(4)* %3712, align 1, !tbaa !14
  %3714 = zext i8 %3713 to i64
  %3715 = shl nuw nsw i64 %3714, 8
  %3716 = or i64 %3715, %3711
  %3717 = getelementptr inbounds i8, i8 addrspace(4)* %3683, i64 2
  %3718 = load i8, i8 addrspace(4)* %3717, align 1, !tbaa !14
  %3719 = zext i8 %3718 to i64
  %3720 = shl nuw nsw i64 %3719, 16
  %3721 = or i64 %3716, %3720
  %3722 = getelementptr inbounds i8, i8 addrspace(4)* %3683, i64 3
  %3723 = load i8, i8 addrspace(4)* %3722, align 1, !tbaa !14
  %3724 = zext i8 %3723 to i64
  %3725 = shl nuw nsw i64 %3724, 24
  %3726 = or i64 %3721, %3725
  %3727 = getelementptr inbounds i8, i8 addrspace(4)* %3683, i64 4
  %3728 = load i8, i8 addrspace(4)* %3727, align 1, !tbaa !14
  %3729 = zext i8 %3728 to i64
  %3730 = shl nuw nsw i64 %3729, 32
  %3731 = or i64 %3726, %3730
  %3732 = getelementptr inbounds i8, i8 addrspace(4)* %3683, i64 5
  %3733 = load i8, i8 addrspace(4)* %3732, align 1, !tbaa !14
  %3734 = zext i8 %3733 to i64
  %3735 = shl nuw nsw i64 %3734, 40
  %3736 = or i64 %3731, %3735
  %3737 = getelementptr inbounds i8, i8 addrspace(4)* %3683, i64 6
  %3738 = load i8, i8 addrspace(4)* %3737, align 1, !tbaa !14
  %3739 = zext i8 %3738 to i64
  %3740 = shl nuw nsw i64 %3739, 48
  %3741 = or i64 %3736, %3740
  %3742 = getelementptr inbounds i8, i8 addrspace(4)* %3683, i64 7
  %3743 = load i8, i8 addrspace(4)* %3742, align 1, !tbaa !14
  %3744 = zext i8 %3743 to i64
  %3745 = shl nuw i64 %3744, 56
  %3746 = or i64 %3741, %3745
  %3747 = add nsw i32 %3691, -8
  %3748 = getelementptr inbounds i8, i8 addrspace(4)* %3683, i64 8
  br label %3749

3749:                                             ; preds = %3696, %3709, %3694
  %3750 = phi i8 addrspace(4)* [ %3748, %3709 ], [ %3683, %3694 ], [ %3683, %3696 ]
  %3751 = phi i32 [ %3747, %3709 ], [ 0, %3694 ], [ 0, %3696 ]
  %3752 = phi i64 [ %3746, %3709 ], [ 0, %3694 ], [ %3706, %3696 ]
  %3753 = icmp ugt i32 %3751, 7
  br i1 %3753, label %3769, label %3754

3754:                                             ; preds = %3749
  %3755 = icmp eq i32 %3751, 0
  br i1 %3755, label %3809, label %3756

3756:                                             ; preds = %3754, %3756
  %3757 = phi i32 [ %3767, %3756 ], [ 0, %3754 ]
  %3758 = phi i64 [ %3766, %3756 ], [ 0, %3754 ]
  %3759 = zext i32 %3757 to i64
  %3760 = getelementptr inbounds i8, i8 addrspace(4)* %3750, i64 %3759
  %3761 = load i8, i8 addrspace(4)* %3760, align 1, !tbaa !14
  %3762 = zext i8 %3761 to i64
  %3763 = shl i32 %3757, 3
  %3764 = zext i32 %3763 to i64
  %3765 = shl nuw i64 %3762, %3764
  %3766 = or i64 %3765, %3758
  %3767 = add nuw nsw i32 %3757, 1
  %3768 = icmp eq i32 %3767, %3751
  br i1 %3768, label %3809, label %3756

3769:                                             ; preds = %3749
  %3770 = load i8, i8 addrspace(4)* %3750, align 1, !tbaa !14
  %3771 = zext i8 %3770 to i64
  %3772 = getelementptr inbounds i8, i8 addrspace(4)* %3750, i64 1
  %3773 = load i8, i8 addrspace(4)* %3772, align 1, !tbaa !14
  %3774 = zext i8 %3773 to i64
  %3775 = shl nuw nsw i64 %3774, 8
  %3776 = or i64 %3775, %3771
  %3777 = getelementptr inbounds i8, i8 addrspace(4)* %3750, i64 2
  %3778 = load i8, i8 addrspace(4)* %3777, align 1, !tbaa !14
  %3779 = zext i8 %3778 to i64
  %3780 = shl nuw nsw i64 %3779, 16
  %3781 = or i64 %3776, %3780
  %3782 = getelementptr inbounds i8, i8 addrspace(4)* %3750, i64 3
  %3783 = load i8, i8 addrspace(4)* %3782, align 1, !tbaa !14
  %3784 = zext i8 %3783 to i64
  %3785 = shl nuw nsw i64 %3784, 24
  %3786 = or i64 %3781, %3785
  %3787 = getelementptr inbounds i8, i8 addrspace(4)* %3750, i64 4
  %3788 = load i8, i8 addrspace(4)* %3787, align 1, !tbaa !14
  %3789 = zext i8 %3788 to i64
  %3790 = shl nuw nsw i64 %3789, 32
  %3791 = or i64 %3786, %3790
  %3792 = getelementptr inbounds i8, i8 addrspace(4)* %3750, i64 5
  %3793 = load i8, i8 addrspace(4)* %3792, align 1, !tbaa !14
  %3794 = zext i8 %3793 to i64
  %3795 = shl nuw nsw i64 %3794, 40
  %3796 = or i64 %3791, %3795
  %3797 = getelementptr inbounds i8, i8 addrspace(4)* %3750, i64 6
  %3798 = load i8, i8 addrspace(4)* %3797, align 1, !tbaa !14
  %3799 = zext i8 %3798 to i64
  %3800 = shl nuw nsw i64 %3799, 48
  %3801 = or i64 %3796, %3800
  %3802 = getelementptr inbounds i8, i8 addrspace(4)* %3750, i64 7
  %3803 = load i8, i8 addrspace(4)* %3802, align 1, !tbaa !14
  %3804 = zext i8 %3803 to i64
  %3805 = shl nuw i64 %3804, 56
  %3806 = or i64 %3801, %3805
  %3807 = add nsw i32 %3751, -8
  %3808 = getelementptr inbounds i8, i8 addrspace(4)* %3750, i64 8
  br label %3809

3809:                                             ; preds = %3756, %3769, %3754
  %3810 = phi i8 addrspace(4)* [ %3808, %3769 ], [ %3750, %3754 ], [ %3750, %3756 ]
  %3811 = phi i32 [ %3807, %3769 ], [ 0, %3754 ], [ 0, %3756 ]
  %3812 = phi i64 [ %3806, %3769 ], [ 0, %3754 ], [ %3766, %3756 ]
  %3813 = icmp ugt i32 %3811, 7
  br i1 %3813, label %3829, label %3814

3814:                                             ; preds = %3809
  %3815 = icmp eq i32 %3811, 0
  br i1 %3815, label %3869, label %3816

3816:                                             ; preds = %3814, %3816
  %3817 = phi i32 [ %3827, %3816 ], [ 0, %3814 ]
  %3818 = phi i64 [ %3826, %3816 ], [ 0, %3814 ]
  %3819 = zext i32 %3817 to i64
  %3820 = getelementptr inbounds i8, i8 addrspace(4)* %3810, i64 %3819
  %3821 = load i8, i8 addrspace(4)* %3820, align 1, !tbaa !14
  %3822 = zext i8 %3821 to i64
  %3823 = shl i32 %3817, 3
  %3824 = zext i32 %3823 to i64
  %3825 = shl nuw i64 %3822, %3824
  %3826 = or i64 %3825, %3818
  %3827 = add nuw nsw i32 %3817, 1
  %3828 = icmp eq i32 %3827, %3811
  br i1 %3828, label %3869, label %3816

3829:                                             ; preds = %3809
  %3830 = load i8, i8 addrspace(4)* %3810, align 1, !tbaa !14
  %3831 = zext i8 %3830 to i64
  %3832 = getelementptr inbounds i8, i8 addrspace(4)* %3810, i64 1
  %3833 = load i8, i8 addrspace(4)* %3832, align 1, !tbaa !14
  %3834 = zext i8 %3833 to i64
  %3835 = shl nuw nsw i64 %3834, 8
  %3836 = or i64 %3835, %3831
  %3837 = getelementptr inbounds i8, i8 addrspace(4)* %3810, i64 2
  %3838 = load i8, i8 addrspace(4)* %3837, align 1, !tbaa !14
  %3839 = zext i8 %3838 to i64
  %3840 = shl nuw nsw i64 %3839, 16
  %3841 = or i64 %3836, %3840
  %3842 = getelementptr inbounds i8, i8 addrspace(4)* %3810, i64 3
  %3843 = load i8, i8 addrspace(4)* %3842, align 1, !tbaa !14
  %3844 = zext i8 %3843 to i64
  %3845 = shl nuw nsw i64 %3844, 24
  %3846 = or i64 %3841, %3845
  %3847 = getelementptr inbounds i8, i8 addrspace(4)* %3810, i64 4
  %3848 = load i8, i8 addrspace(4)* %3847, align 1, !tbaa !14
  %3849 = zext i8 %3848 to i64
  %3850 = shl nuw nsw i64 %3849, 32
  %3851 = or i64 %3846, %3850
  %3852 = getelementptr inbounds i8, i8 addrspace(4)* %3810, i64 5
  %3853 = load i8, i8 addrspace(4)* %3852, align 1, !tbaa !14
  %3854 = zext i8 %3853 to i64
  %3855 = shl nuw nsw i64 %3854, 40
  %3856 = or i64 %3851, %3855
  %3857 = getelementptr inbounds i8, i8 addrspace(4)* %3810, i64 6
  %3858 = load i8, i8 addrspace(4)* %3857, align 1, !tbaa !14
  %3859 = zext i8 %3858 to i64
  %3860 = shl nuw nsw i64 %3859, 48
  %3861 = or i64 %3856, %3860
  %3862 = getelementptr inbounds i8, i8 addrspace(4)* %3810, i64 7
  %3863 = load i8, i8 addrspace(4)* %3862, align 1, !tbaa !14
  %3864 = zext i8 %3863 to i64
  %3865 = shl nuw i64 %3864, 56
  %3866 = or i64 %3861, %3865
  %3867 = add nsw i32 %3811, -8
  %3868 = getelementptr inbounds i8, i8 addrspace(4)* %3810, i64 8
  br label %3869

3869:                                             ; preds = %3816, %3829, %3814
  %3870 = phi i8 addrspace(4)* [ %3868, %3829 ], [ %3810, %3814 ], [ %3810, %3816 ]
  %3871 = phi i32 [ %3867, %3829 ], [ 0, %3814 ], [ 0, %3816 ]
  %3872 = phi i64 [ %3866, %3829 ], [ 0, %3814 ], [ %3826, %3816 ]
  %3873 = icmp ugt i32 %3871, 7
  br i1 %3873, label %3889, label %3874

3874:                                             ; preds = %3869
  %3875 = icmp eq i32 %3871, 0
  br i1 %3875, label %3929, label %3876

3876:                                             ; preds = %3874, %3876
  %3877 = phi i32 [ %3887, %3876 ], [ 0, %3874 ]
  %3878 = phi i64 [ %3886, %3876 ], [ 0, %3874 ]
  %3879 = zext i32 %3877 to i64
  %3880 = getelementptr inbounds i8, i8 addrspace(4)* %3870, i64 %3879
  %3881 = load i8, i8 addrspace(4)* %3880, align 1, !tbaa !14
  %3882 = zext i8 %3881 to i64
  %3883 = shl i32 %3877, 3
  %3884 = zext i32 %3883 to i64
  %3885 = shl nuw i64 %3882, %3884
  %3886 = or i64 %3885, %3878
  %3887 = add nuw nsw i32 %3877, 1
  %3888 = icmp eq i32 %3887, %3871
  br i1 %3888, label %3929, label %3876

3889:                                             ; preds = %3869
  %3890 = load i8, i8 addrspace(4)* %3870, align 1, !tbaa !14
  %3891 = zext i8 %3890 to i64
  %3892 = getelementptr inbounds i8, i8 addrspace(4)* %3870, i64 1
  %3893 = load i8, i8 addrspace(4)* %3892, align 1, !tbaa !14
  %3894 = zext i8 %3893 to i64
  %3895 = shl nuw nsw i64 %3894, 8
  %3896 = or i64 %3895, %3891
  %3897 = getelementptr inbounds i8, i8 addrspace(4)* %3870, i64 2
  %3898 = load i8, i8 addrspace(4)* %3897, align 1, !tbaa !14
  %3899 = zext i8 %3898 to i64
  %3900 = shl nuw nsw i64 %3899, 16
  %3901 = or i64 %3896, %3900
  %3902 = getelementptr inbounds i8, i8 addrspace(4)* %3870, i64 3
  %3903 = load i8, i8 addrspace(4)* %3902, align 1, !tbaa !14
  %3904 = zext i8 %3903 to i64
  %3905 = shl nuw nsw i64 %3904, 24
  %3906 = or i64 %3901, %3905
  %3907 = getelementptr inbounds i8, i8 addrspace(4)* %3870, i64 4
  %3908 = load i8, i8 addrspace(4)* %3907, align 1, !tbaa !14
  %3909 = zext i8 %3908 to i64
  %3910 = shl nuw nsw i64 %3909, 32
  %3911 = or i64 %3906, %3910
  %3912 = getelementptr inbounds i8, i8 addrspace(4)* %3870, i64 5
  %3913 = load i8, i8 addrspace(4)* %3912, align 1, !tbaa !14
  %3914 = zext i8 %3913 to i64
  %3915 = shl nuw nsw i64 %3914, 40
  %3916 = or i64 %3911, %3915
  %3917 = getelementptr inbounds i8, i8 addrspace(4)* %3870, i64 6
  %3918 = load i8, i8 addrspace(4)* %3917, align 1, !tbaa !14
  %3919 = zext i8 %3918 to i64
  %3920 = shl nuw nsw i64 %3919, 48
  %3921 = or i64 %3916, %3920
  %3922 = getelementptr inbounds i8, i8 addrspace(4)* %3870, i64 7
  %3923 = load i8, i8 addrspace(4)* %3922, align 1, !tbaa !14
  %3924 = zext i8 %3923 to i64
  %3925 = shl nuw i64 %3924, 56
  %3926 = or i64 %3921, %3925
  %3927 = add nsw i32 %3871, -8
  %3928 = getelementptr inbounds i8, i8 addrspace(4)* %3870, i64 8
  br label %3929

3929:                                             ; preds = %3876, %3889, %3874
  %3930 = phi i8 addrspace(4)* [ %3928, %3889 ], [ %3870, %3874 ], [ %3870, %3876 ]
  %3931 = phi i32 [ %3927, %3889 ], [ 0, %3874 ], [ 0, %3876 ]
  %3932 = phi i64 [ %3926, %3889 ], [ 0, %3874 ], [ %3886, %3876 ]
  %3933 = icmp ugt i32 %3931, 7
  br i1 %3933, label %3949, label %3934

3934:                                             ; preds = %3929
  %3935 = icmp eq i32 %3931, 0
  br i1 %3935, label %3989, label %3936

3936:                                             ; preds = %3934, %3936
  %3937 = phi i32 [ %3947, %3936 ], [ 0, %3934 ]
  %3938 = phi i64 [ %3946, %3936 ], [ 0, %3934 ]
  %3939 = zext i32 %3937 to i64
  %3940 = getelementptr inbounds i8, i8 addrspace(4)* %3930, i64 %3939
  %3941 = load i8, i8 addrspace(4)* %3940, align 1, !tbaa !14
  %3942 = zext i8 %3941 to i64
  %3943 = shl i32 %3937, 3
  %3944 = zext i32 %3943 to i64
  %3945 = shl nuw i64 %3942, %3944
  %3946 = or i64 %3945, %3938
  %3947 = add nuw nsw i32 %3937, 1
  %3948 = icmp eq i32 %3947, %3931
  br i1 %3948, label %3989, label %3936

3949:                                             ; preds = %3929
  %3950 = load i8, i8 addrspace(4)* %3930, align 1, !tbaa !14
  %3951 = zext i8 %3950 to i64
  %3952 = getelementptr inbounds i8, i8 addrspace(4)* %3930, i64 1
  %3953 = load i8, i8 addrspace(4)* %3952, align 1, !tbaa !14
  %3954 = zext i8 %3953 to i64
  %3955 = shl nuw nsw i64 %3954, 8
  %3956 = or i64 %3955, %3951
  %3957 = getelementptr inbounds i8, i8 addrspace(4)* %3930, i64 2
  %3958 = load i8, i8 addrspace(4)* %3957, align 1, !tbaa !14
  %3959 = zext i8 %3958 to i64
  %3960 = shl nuw nsw i64 %3959, 16
  %3961 = or i64 %3956, %3960
  %3962 = getelementptr inbounds i8, i8 addrspace(4)* %3930, i64 3
  %3963 = load i8, i8 addrspace(4)* %3962, align 1, !tbaa !14
  %3964 = zext i8 %3963 to i64
  %3965 = shl nuw nsw i64 %3964, 24
  %3966 = or i64 %3961, %3965
  %3967 = getelementptr inbounds i8, i8 addrspace(4)* %3930, i64 4
  %3968 = load i8, i8 addrspace(4)* %3967, align 1, !tbaa !14
  %3969 = zext i8 %3968 to i64
  %3970 = shl nuw nsw i64 %3969, 32
  %3971 = or i64 %3966, %3970
  %3972 = getelementptr inbounds i8, i8 addrspace(4)* %3930, i64 5
  %3973 = load i8, i8 addrspace(4)* %3972, align 1, !tbaa !14
  %3974 = zext i8 %3973 to i64
  %3975 = shl nuw nsw i64 %3974, 40
  %3976 = or i64 %3971, %3975
  %3977 = getelementptr inbounds i8, i8 addrspace(4)* %3930, i64 6
  %3978 = load i8, i8 addrspace(4)* %3977, align 1, !tbaa !14
  %3979 = zext i8 %3978 to i64
  %3980 = shl nuw nsw i64 %3979, 48
  %3981 = or i64 %3976, %3980
  %3982 = getelementptr inbounds i8, i8 addrspace(4)* %3930, i64 7
  %3983 = load i8, i8 addrspace(4)* %3982, align 1, !tbaa !14
  %3984 = zext i8 %3983 to i64
  %3985 = shl nuw i64 %3984, 56
  %3986 = or i64 %3981, %3985
  %3987 = add nsw i32 %3931, -8
  %3988 = getelementptr inbounds i8, i8 addrspace(4)* %3930, i64 8
  br label %3989

3989:                                             ; preds = %3936, %3949, %3934
  %3990 = phi i8 addrspace(4)* [ %3988, %3949 ], [ %3930, %3934 ], [ %3930, %3936 ]
  %3991 = phi i32 [ %3987, %3949 ], [ 0, %3934 ], [ 0, %3936 ]
  %3992 = phi i64 [ %3986, %3949 ], [ 0, %3934 ], [ %3946, %3936 ]
  %3993 = icmp ugt i32 %3991, 7
  br i1 %3993, label %4009, label %3994

3994:                                             ; preds = %3989
  %3995 = icmp eq i32 %3991, 0
  br i1 %3995, label %4049, label %3996

3996:                                             ; preds = %3994, %3996
  %3997 = phi i32 [ %4007, %3996 ], [ 0, %3994 ]
  %3998 = phi i64 [ %4006, %3996 ], [ 0, %3994 ]
  %3999 = zext i32 %3997 to i64
  %4000 = getelementptr inbounds i8, i8 addrspace(4)* %3990, i64 %3999
  %4001 = load i8, i8 addrspace(4)* %4000, align 1, !tbaa !14
  %4002 = zext i8 %4001 to i64
  %4003 = shl i32 %3997, 3
  %4004 = zext i32 %4003 to i64
  %4005 = shl nuw i64 %4002, %4004
  %4006 = or i64 %4005, %3998
  %4007 = add nuw nsw i32 %3997, 1
  %4008 = icmp eq i32 %4007, %3991
  br i1 %4008, label %4049, label %3996

4009:                                             ; preds = %3989
  %4010 = load i8, i8 addrspace(4)* %3990, align 1, !tbaa !14
  %4011 = zext i8 %4010 to i64
  %4012 = getelementptr inbounds i8, i8 addrspace(4)* %3990, i64 1
  %4013 = load i8, i8 addrspace(4)* %4012, align 1, !tbaa !14
  %4014 = zext i8 %4013 to i64
  %4015 = shl nuw nsw i64 %4014, 8
  %4016 = or i64 %4015, %4011
  %4017 = getelementptr inbounds i8, i8 addrspace(4)* %3990, i64 2
  %4018 = load i8, i8 addrspace(4)* %4017, align 1, !tbaa !14
  %4019 = zext i8 %4018 to i64
  %4020 = shl nuw nsw i64 %4019, 16
  %4021 = or i64 %4016, %4020
  %4022 = getelementptr inbounds i8, i8 addrspace(4)* %3990, i64 3
  %4023 = load i8, i8 addrspace(4)* %4022, align 1, !tbaa !14
  %4024 = zext i8 %4023 to i64
  %4025 = shl nuw nsw i64 %4024, 24
  %4026 = or i64 %4021, %4025
  %4027 = getelementptr inbounds i8, i8 addrspace(4)* %3990, i64 4
  %4028 = load i8, i8 addrspace(4)* %4027, align 1, !tbaa !14
  %4029 = zext i8 %4028 to i64
  %4030 = shl nuw nsw i64 %4029, 32
  %4031 = or i64 %4026, %4030
  %4032 = getelementptr inbounds i8, i8 addrspace(4)* %3990, i64 5
  %4033 = load i8, i8 addrspace(4)* %4032, align 1, !tbaa !14
  %4034 = zext i8 %4033 to i64
  %4035 = shl nuw nsw i64 %4034, 40
  %4036 = or i64 %4031, %4035
  %4037 = getelementptr inbounds i8, i8 addrspace(4)* %3990, i64 6
  %4038 = load i8, i8 addrspace(4)* %4037, align 1, !tbaa !14
  %4039 = zext i8 %4038 to i64
  %4040 = shl nuw nsw i64 %4039, 48
  %4041 = or i64 %4036, %4040
  %4042 = getelementptr inbounds i8, i8 addrspace(4)* %3990, i64 7
  %4043 = load i8, i8 addrspace(4)* %4042, align 1, !tbaa !14
  %4044 = zext i8 %4043 to i64
  %4045 = shl nuw i64 %4044, 56
  %4046 = or i64 %4041, %4045
  %4047 = add nsw i32 %3991, -8
  %4048 = getelementptr inbounds i8, i8 addrspace(4)* %3990, i64 8
  br label %4049

4049:                                             ; preds = %3996, %4009, %3994
  %4050 = phi i8 addrspace(4)* [ %4048, %4009 ], [ %3990, %3994 ], [ %3990, %3996 ]
  %4051 = phi i32 [ %4047, %4009 ], [ 0, %3994 ], [ 0, %3996 ]
  %4052 = phi i64 [ %4046, %4009 ], [ 0, %3994 ], [ %4006, %3996 ]
  %4053 = icmp ugt i32 %4051, 7
  br i1 %4053, label %4069, label %4054

4054:                                             ; preds = %4049
  %4055 = icmp eq i32 %4051, 0
  br i1 %4055, label %4107, label %4056

4056:                                             ; preds = %4054, %4056
  %4057 = phi i32 [ %4067, %4056 ], [ 0, %4054 ]
  %4058 = phi i64 [ %4066, %4056 ], [ 0, %4054 ]
  %4059 = zext i32 %4057 to i64
  %4060 = getelementptr inbounds i8, i8 addrspace(4)* %4050, i64 %4059
  %4061 = load i8, i8 addrspace(4)* %4060, align 1, !tbaa !14
  %4062 = zext i8 %4061 to i64
  %4063 = shl i32 %4057, 3
  %4064 = zext i32 %4063 to i64
  %4065 = shl nuw i64 %4062, %4064
  %4066 = or i64 %4065, %4058
  %4067 = add nuw nsw i32 %4057, 1
  %4068 = icmp eq i32 %4067, %4051
  br i1 %4068, label %4107, label %4056

4069:                                             ; preds = %4049
  %4070 = load i8, i8 addrspace(4)* %4050, align 1, !tbaa !14
  %4071 = zext i8 %4070 to i64
  %4072 = getelementptr inbounds i8, i8 addrspace(4)* %4050, i64 1
  %4073 = load i8, i8 addrspace(4)* %4072, align 1, !tbaa !14
  %4074 = zext i8 %4073 to i64
  %4075 = shl nuw nsw i64 %4074, 8
  %4076 = or i64 %4075, %4071
  %4077 = getelementptr inbounds i8, i8 addrspace(4)* %4050, i64 2
  %4078 = load i8, i8 addrspace(4)* %4077, align 1, !tbaa !14
  %4079 = zext i8 %4078 to i64
  %4080 = shl nuw nsw i64 %4079, 16
  %4081 = or i64 %4076, %4080
  %4082 = getelementptr inbounds i8, i8 addrspace(4)* %4050, i64 3
  %4083 = load i8, i8 addrspace(4)* %4082, align 1, !tbaa !14
  %4084 = zext i8 %4083 to i64
  %4085 = shl nuw nsw i64 %4084, 24
  %4086 = or i64 %4081, %4085
  %4087 = getelementptr inbounds i8, i8 addrspace(4)* %4050, i64 4
  %4088 = load i8, i8 addrspace(4)* %4087, align 1, !tbaa !14
  %4089 = zext i8 %4088 to i64
  %4090 = shl nuw nsw i64 %4089, 32
  %4091 = or i64 %4086, %4090
  %4092 = getelementptr inbounds i8, i8 addrspace(4)* %4050, i64 5
  %4093 = load i8, i8 addrspace(4)* %4092, align 1, !tbaa !14
  %4094 = zext i8 %4093 to i64
  %4095 = shl nuw nsw i64 %4094, 40
  %4096 = or i64 %4091, %4095
  %4097 = getelementptr inbounds i8, i8 addrspace(4)* %4050, i64 6
  %4098 = load i8, i8 addrspace(4)* %4097, align 1, !tbaa !14
  %4099 = zext i8 %4098 to i64
  %4100 = shl nuw nsw i64 %4099, 48
  %4101 = or i64 %4096, %4100
  %4102 = getelementptr inbounds i8, i8 addrspace(4)* %4050, i64 7
  %4103 = load i8, i8 addrspace(4)* %4102, align 1, !tbaa !14
  %4104 = zext i8 %4103 to i64
  %4105 = shl nuw i64 %4104, 56
  %4106 = or i64 %4101, %4105
  br label %4107

4107:                                             ; preds = %4056, %4069, %4054
  %4108 = phi i64 [ %4106, %4069 ], [ 0, %4054 ], [ %4066, %4056 ]
  %4109 = shl nuw nsw i64 %3690, 2
  %4110 = add nuw nsw i64 %4109, 28
  %4111 = and i64 %4110, 480
  %4112 = and i64 %3692, -225
  %4113 = or i64 %4112, %4111
  %4114 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %15, i64 noundef %4113, i64 noundef %3752, i64 noundef %3812, i64 noundef %3872, i64 noundef %3932, i64 noundef %3992, i64 noundef %4052, i64 noundef %4108) #11
  %4115 = sub i64 %3682, %3690
  %4116 = getelementptr inbounds i8, i8 addrspace(4)* %3683, i64 %3690
  %4117 = icmp eq i64 %4115, 0
  br i1 %4117, label %4122, label %3681

4118:                                             ; preds = %3666
  %4119 = and i64 %3676, -225
  %4120 = or i64 %4119, 32
  %4121 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %15, i64 noundef %4120, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  br label %4122

4122:                                             ; preds = %4107, %4118
  %4123 = phi <2 x i64> [ %4121, %4118 ], [ %4114, %4107 ]
  %4124 = extractelement <2 x i64> %4123, i64 0
  %4125 = and i64 %4124, -227
  %4126 = or i64 %4125, 34
  %4127 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %15, i64 noundef %4126, i64 noundef 2, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %4128 = load i32, i32 addrspace(3)* getelementptr inbounds ([0 x i32], [0 x i32] addrspace(3)* @seme, i32 0, i32 2), align 4, !tbaa !5
  %4129 = load i32, i32 addrspace(1)* %10, align 4, !tbaa !5
  %4130 = add nsw i32 %4129, %4128
  store i32 %4130, i32 addrspace(1)* %10, align 4, !tbaa !5
  %4131 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %15, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %4132 = extractelement <2 x i64> %4131, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([21 x i8], [21 x i8] addrspace(4)* @.str.2, i64 0, i64 0) to i8*), i8* null), label %4574, label %4133

4133:                                             ; preds = %4122
  %4134 = and i64 %4132, 2
  %4135 = and i64 %4132, -3
  %4136 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %4135, i64 0
  br label %4137

4137:                                             ; preds = %4563, %4133
  %4138 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([21 x i8], [21 x i8] addrspace(4)* @.str.2, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([21 x i8], [21 x i8] addrspace(4)* @.str.2, i64 0, i64 20) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([21 x i8]* addrspacecast ([21 x i8] addrspace(4)* @.str.2 to [21 x i8]*) to i64)), i64 1))), %4133 ], [ %4571, %4563 ]
  %4139 = phi i8 addrspace(4)* [ getelementptr inbounds ([21 x i8], [21 x i8] addrspace(4)* @.str.2, i64 0, i64 0), %4133 ], [ %4572, %4563 ]
  %4140 = phi <2 x i64> [ %4136, %4133 ], [ %4570, %4563 ]
  %4141 = icmp ugt i64 %4138, 56
  %4142 = extractelement <2 x i64> %4140, i64 0
  %4143 = or i64 %4142, %4134
  %4144 = insertelement <2 x i64> poison, i64 %4143, i64 0
  %4145 = select i1 %4141, <2 x i64> %4140, <2 x i64> %4144
  %4146 = tail call i64 @llvm.umin.i64(i64 %4138, i64 56)
  %4147 = trunc i64 %4146 to i32
  %4148 = extractelement <2 x i64> %4145, i64 0
  %4149 = icmp ugt i32 %4147, 7
  br i1 %4149, label %4165, label %4150

4150:                                             ; preds = %4137
  %4151 = icmp eq i32 %4147, 0
  br i1 %4151, label %4205, label %4152

4152:                                             ; preds = %4150, %4152
  %4153 = phi i32 [ %4163, %4152 ], [ 0, %4150 ]
  %4154 = phi i64 [ %4162, %4152 ], [ 0, %4150 ]
  %4155 = zext i32 %4153 to i64
  %4156 = getelementptr inbounds i8, i8 addrspace(4)* %4139, i64 %4155
  %4157 = load i8, i8 addrspace(4)* %4156, align 1, !tbaa !14
  %4158 = zext i8 %4157 to i64
  %4159 = shl i32 %4153, 3
  %4160 = zext i32 %4159 to i64
  %4161 = shl nuw i64 %4158, %4160
  %4162 = or i64 %4161, %4154
  %4163 = add nuw nsw i32 %4153, 1
  %4164 = icmp eq i32 %4163, %4147
  br i1 %4164, label %4205, label %4152, !llvm.loop !15

4165:                                             ; preds = %4137
  %4166 = load i8, i8 addrspace(4)* %4139, align 1, !tbaa !14
  %4167 = zext i8 %4166 to i64
  %4168 = getelementptr inbounds i8, i8 addrspace(4)* %4139, i64 1
  %4169 = load i8, i8 addrspace(4)* %4168, align 1, !tbaa !14
  %4170 = zext i8 %4169 to i64
  %4171 = shl nuw nsw i64 %4170, 8
  %4172 = or i64 %4171, %4167
  %4173 = getelementptr inbounds i8, i8 addrspace(4)* %4139, i64 2
  %4174 = load i8, i8 addrspace(4)* %4173, align 1, !tbaa !14
  %4175 = zext i8 %4174 to i64
  %4176 = shl nuw nsw i64 %4175, 16
  %4177 = or i64 %4172, %4176
  %4178 = getelementptr inbounds i8, i8 addrspace(4)* %4139, i64 3
  %4179 = load i8, i8 addrspace(4)* %4178, align 1, !tbaa !14
  %4180 = zext i8 %4179 to i64
  %4181 = shl nuw nsw i64 %4180, 24
  %4182 = or i64 %4177, %4181
  %4183 = getelementptr inbounds i8, i8 addrspace(4)* %4139, i64 4
  %4184 = load i8, i8 addrspace(4)* %4183, align 1, !tbaa !14
  %4185 = zext i8 %4184 to i64
  %4186 = shl nuw nsw i64 %4185, 32
  %4187 = or i64 %4182, %4186
  %4188 = getelementptr inbounds i8, i8 addrspace(4)* %4139, i64 5
  %4189 = load i8, i8 addrspace(4)* %4188, align 1, !tbaa !14
  %4190 = zext i8 %4189 to i64
  %4191 = shl nuw nsw i64 %4190, 40
  %4192 = or i64 %4187, %4191
  %4193 = getelementptr inbounds i8, i8 addrspace(4)* %4139, i64 6
  %4194 = load i8, i8 addrspace(4)* %4193, align 1, !tbaa !14
  %4195 = zext i8 %4194 to i64
  %4196 = shl nuw nsw i64 %4195, 48
  %4197 = or i64 %4192, %4196
  %4198 = getelementptr inbounds i8, i8 addrspace(4)* %4139, i64 7
  %4199 = load i8, i8 addrspace(4)* %4198, align 1, !tbaa !14
  %4200 = zext i8 %4199 to i64
  %4201 = shl nuw i64 %4200, 56
  %4202 = or i64 %4197, %4201
  %4203 = add nsw i32 %4147, -8
  %4204 = getelementptr inbounds i8, i8 addrspace(4)* %4139, i64 8
  br label %4205

4205:                                             ; preds = %4152, %4165, %4150
  %4206 = phi i8 addrspace(4)* [ %4204, %4165 ], [ %4139, %4150 ], [ %4139, %4152 ]
  %4207 = phi i32 [ %4203, %4165 ], [ 0, %4150 ], [ 0, %4152 ]
  %4208 = phi i64 [ %4202, %4165 ], [ 0, %4150 ], [ %4162, %4152 ]
  %4209 = icmp ugt i32 %4207, 7
  br i1 %4209, label %4225, label %4210

4210:                                             ; preds = %4205
  %4211 = icmp eq i32 %4207, 0
  br i1 %4211, label %4265, label %4212

4212:                                             ; preds = %4210, %4212
  %4213 = phi i32 [ %4223, %4212 ], [ 0, %4210 ]
  %4214 = phi i64 [ %4222, %4212 ], [ 0, %4210 ]
  %4215 = zext i32 %4213 to i64
  %4216 = getelementptr inbounds i8, i8 addrspace(4)* %4206, i64 %4215
  %4217 = load i8, i8 addrspace(4)* %4216, align 1, !tbaa !14
  %4218 = zext i8 %4217 to i64
  %4219 = shl i32 %4213, 3
  %4220 = zext i32 %4219 to i64
  %4221 = shl nuw i64 %4218, %4220
  %4222 = or i64 %4221, %4214
  %4223 = add nuw nsw i32 %4213, 1
  %4224 = icmp eq i32 %4223, %4207
  br i1 %4224, label %4265, label %4212

4225:                                             ; preds = %4205
  %4226 = load i8, i8 addrspace(4)* %4206, align 1, !tbaa !14
  %4227 = zext i8 %4226 to i64
  %4228 = getelementptr inbounds i8, i8 addrspace(4)* %4206, i64 1
  %4229 = load i8, i8 addrspace(4)* %4228, align 1, !tbaa !14
  %4230 = zext i8 %4229 to i64
  %4231 = shl nuw nsw i64 %4230, 8
  %4232 = or i64 %4231, %4227
  %4233 = getelementptr inbounds i8, i8 addrspace(4)* %4206, i64 2
  %4234 = load i8, i8 addrspace(4)* %4233, align 1, !tbaa !14
  %4235 = zext i8 %4234 to i64
  %4236 = shl nuw nsw i64 %4235, 16
  %4237 = or i64 %4232, %4236
  %4238 = getelementptr inbounds i8, i8 addrspace(4)* %4206, i64 3
  %4239 = load i8, i8 addrspace(4)* %4238, align 1, !tbaa !14
  %4240 = zext i8 %4239 to i64
  %4241 = shl nuw nsw i64 %4240, 24
  %4242 = or i64 %4237, %4241
  %4243 = getelementptr inbounds i8, i8 addrspace(4)* %4206, i64 4
  %4244 = load i8, i8 addrspace(4)* %4243, align 1, !tbaa !14
  %4245 = zext i8 %4244 to i64
  %4246 = shl nuw nsw i64 %4245, 32
  %4247 = or i64 %4242, %4246
  %4248 = getelementptr inbounds i8, i8 addrspace(4)* %4206, i64 5
  %4249 = load i8, i8 addrspace(4)* %4248, align 1, !tbaa !14
  %4250 = zext i8 %4249 to i64
  %4251 = shl nuw nsw i64 %4250, 40
  %4252 = or i64 %4247, %4251
  %4253 = getelementptr inbounds i8, i8 addrspace(4)* %4206, i64 6
  %4254 = load i8, i8 addrspace(4)* %4253, align 1, !tbaa !14
  %4255 = zext i8 %4254 to i64
  %4256 = shl nuw nsw i64 %4255, 48
  %4257 = or i64 %4252, %4256
  %4258 = getelementptr inbounds i8, i8 addrspace(4)* %4206, i64 7
  %4259 = load i8, i8 addrspace(4)* %4258, align 1, !tbaa !14
  %4260 = zext i8 %4259 to i64
  %4261 = shl nuw i64 %4260, 56
  %4262 = or i64 %4257, %4261
  %4263 = add nsw i32 %4207, -8
  %4264 = getelementptr inbounds i8, i8 addrspace(4)* %4206, i64 8
  br label %4265

4265:                                             ; preds = %4212, %4225, %4210
  %4266 = phi i8 addrspace(4)* [ %4264, %4225 ], [ %4206, %4210 ], [ %4206, %4212 ]
  %4267 = phi i32 [ %4263, %4225 ], [ 0, %4210 ], [ 0, %4212 ]
  %4268 = phi i64 [ %4262, %4225 ], [ 0, %4210 ], [ %4222, %4212 ]
  %4269 = icmp ugt i32 %4267, 7
  br i1 %4269, label %4285, label %4270

4270:                                             ; preds = %4265
  %4271 = icmp eq i32 %4267, 0
  br i1 %4271, label %4325, label %4272

4272:                                             ; preds = %4270, %4272
  %4273 = phi i32 [ %4283, %4272 ], [ 0, %4270 ]
  %4274 = phi i64 [ %4282, %4272 ], [ 0, %4270 ]
  %4275 = zext i32 %4273 to i64
  %4276 = getelementptr inbounds i8, i8 addrspace(4)* %4266, i64 %4275
  %4277 = load i8, i8 addrspace(4)* %4276, align 1, !tbaa !14
  %4278 = zext i8 %4277 to i64
  %4279 = shl i32 %4273, 3
  %4280 = zext i32 %4279 to i64
  %4281 = shl nuw i64 %4278, %4280
  %4282 = or i64 %4281, %4274
  %4283 = add nuw nsw i32 %4273, 1
  %4284 = icmp eq i32 %4283, %4267
  br i1 %4284, label %4325, label %4272

4285:                                             ; preds = %4265
  %4286 = load i8, i8 addrspace(4)* %4266, align 1, !tbaa !14
  %4287 = zext i8 %4286 to i64
  %4288 = getelementptr inbounds i8, i8 addrspace(4)* %4266, i64 1
  %4289 = load i8, i8 addrspace(4)* %4288, align 1, !tbaa !14
  %4290 = zext i8 %4289 to i64
  %4291 = shl nuw nsw i64 %4290, 8
  %4292 = or i64 %4291, %4287
  %4293 = getelementptr inbounds i8, i8 addrspace(4)* %4266, i64 2
  %4294 = load i8, i8 addrspace(4)* %4293, align 1, !tbaa !14
  %4295 = zext i8 %4294 to i64
  %4296 = shl nuw nsw i64 %4295, 16
  %4297 = or i64 %4292, %4296
  %4298 = getelementptr inbounds i8, i8 addrspace(4)* %4266, i64 3
  %4299 = load i8, i8 addrspace(4)* %4298, align 1, !tbaa !14
  %4300 = zext i8 %4299 to i64
  %4301 = shl nuw nsw i64 %4300, 24
  %4302 = or i64 %4297, %4301
  %4303 = getelementptr inbounds i8, i8 addrspace(4)* %4266, i64 4
  %4304 = load i8, i8 addrspace(4)* %4303, align 1, !tbaa !14
  %4305 = zext i8 %4304 to i64
  %4306 = shl nuw nsw i64 %4305, 32
  %4307 = or i64 %4302, %4306
  %4308 = getelementptr inbounds i8, i8 addrspace(4)* %4266, i64 5
  %4309 = load i8, i8 addrspace(4)* %4308, align 1, !tbaa !14
  %4310 = zext i8 %4309 to i64
  %4311 = shl nuw nsw i64 %4310, 40
  %4312 = or i64 %4307, %4311
  %4313 = getelementptr inbounds i8, i8 addrspace(4)* %4266, i64 6
  %4314 = load i8, i8 addrspace(4)* %4313, align 1, !tbaa !14
  %4315 = zext i8 %4314 to i64
  %4316 = shl nuw nsw i64 %4315, 48
  %4317 = or i64 %4312, %4316
  %4318 = getelementptr inbounds i8, i8 addrspace(4)* %4266, i64 7
  %4319 = load i8, i8 addrspace(4)* %4318, align 1, !tbaa !14
  %4320 = zext i8 %4319 to i64
  %4321 = shl nuw i64 %4320, 56
  %4322 = or i64 %4317, %4321
  %4323 = add nsw i32 %4267, -8
  %4324 = getelementptr inbounds i8, i8 addrspace(4)* %4266, i64 8
  br label %4325

4325:                                             ; preds = %4272, %4285, %4270
  %4326 = phi i8 addrspace(4)* [ %4324, %4285 ], [ %4266, %4270 ], [ %4266, %4272 ]
  %4327 = phi i32 [ %4323, %4285 ], [ 0, %4270 ], [ 0, %4272 ]
  %4328 = phi i64 [ %4322, %4285 ], [ 0, %4270 ], [ %4282, %4272 ]
  %4329 = icmp ugt i32 %4327, 7
  br i1 %4329, label %4345, label %4330

4330:                                             ; preds = %4325
  %4331 = icmp eq i32 %4327, 0
  br i1 %4331, label %4385, label %4332

4332:                                             ; preds = %4330, %4332
  %4333 = phi i32 [ %4343, %4332 ], [ 0, %4330 ]
  %4334 = phi i64 [ %4342, %4332 ], [ 0, %4330 ]
  %4335 = zext i32 %4333 to i64
  %4336 = getelementptr inbounds i8, i8 addrspace(4)* %4326, i64 %4335
  %4337 = load i8, i8 addrspace(4)* %4336, align 1, !tbaa !14
  %4338 = zext i8 %4337 to i64
  %4339 = shl i32 %4333, 3
  %4340 = zext i32 %4339 to i64
  %4341 = shl nuw i64 %4338, %4340
  %4342 = or i64 %4341, %4334
  %4343 = add nuw nsw i32 %4333, 1
  %4344 = icmp eq i32 %4343, %4327
  br i1 %4344, label %4385, label %4332

4345:                                             ; preds = %4325
  %4346 = load i8, i8 addrspace(4)* %4326, align 1, !tbaa !14
  %4347 = zext i8 %4346 to i64
  %4348 = getelementptr inbounds i8, i8 addrspace(4)* %4326, i64 1
  %4349 = load i8, i8 addrspace(4)* %4348, align 1, !tbaa !14
  %4350 = zext i8 %4349 to i64
  %4351 = shl nuw nsw i64 %4350, 8
  %4352 = or i64 %4351, %4347
  %4353 = getelementptr inbounds i8, i8 addrspace(4)* %4326, i64 2
  %4354 = load i8, i8 addrspace(4)* %4353, align 1, !tbaa !14
  %4355 = zext i8 %4354 to i64
  %4356 = shl nuw nsw i64 %4355, 16
  %4357 = or i64 %4352, %4356
  %4358 = getelementptr inbounds i8, i8 addrspace(4)* %4326, i64 3
  %4359 = load i8, i8 addrspace(4)* %4358, align 1, !tbaa !14
  %4360 = zext i8 %4359 to i64
  %4361 = shl nuw nsw i64 %4360, 24
  %4362 = or i64 %4357, %4361
  %4363 = getelementptr inbounds i8, i8 addrspace(4)* %4326, i64 4
  %4364 = load i8, i8 addrspace(4)* %4363, align 1, !tbaa !14
  %4365 = zext i8 %4364 to i64
  %4366 = shl nuw nsw i64 %4365, 32
  %4367 = or i64 %4362, %4366
  %4368 = getelementptr inbounds i8, i8 addrspace(4)* %4326, i64 5
  %4369 = load i8, i8 addrspace(4)* %4368, align 1, !tbaa !14
  %4370 = zext i8 %4369 to i64
  %4371 = shl nuw nsw i64 %4370, 40
  %4372 = or i64 %4367, %4371
  %4373 = getelementptr inbounds i8, i8 addrspace(4)* %4326, i64 6
  %4374 = load i8, i8 addrspace(4)* %4373, align 1, !tbaa !14
  %4375 = zext i8 %4374 to i64
  %4376 = shl nuw nsw i64 %4375, 48
  %4377 = or i64 %4372, %4376
  %4378 = getelementptr inbounds i8, i8 addrspace(4)* %4326, i64 7
  %4379 = load i8, i8 addrspace(4)* %4378, align 1, !tbaa !14
  %4380 = zext i8 %4379 to i64
  %4381 = shl nuw i64 %4380, 56
  %4382 = or i64 %4377, %4381
  %4383 = add nsw i32 %4327, -8
  %4384 = getelementptr inbounds i8, i8 addrspace(4)* %4326, i64 8
  br label %4385

4385:                                             ; preds = %4332, %4345, %4330
  %4386 = phi i8 addrspace(4)* [ %4384, %4345 ], [ %4326, %4330 ], [ %4326, %4332 ]
  %4387 = phi i32 [ %4383, %4345 ], [ 0, %4330 ], [ 0, %4332 ]
  %4388 = phi i64 [ %4382, %4345 ], [ 0, %4330 ], [ %4342, %4332 ]
  %4389 = icmp ugt i32 %4387, 7
  br i1 %4389, label %4405, label %4390

4390:                                             ; preds = %4385
  %4391 = icmp eq i32 %4387, 0
  br i1 %4391, label %4445, label %4392

4392:                                             ; preds = %4390, %4392
  %4393 = phi i32 [ %4403, %4392 ], [ 0, %4390 ]
  %4394 = phi i64 [ %4402, %4392 ], [ 0, %4390 ]
  %4395 = zext i32 %4393 to i64
  %4396 = getelementptr inbounds i8, i8 addrspace(4)* %4386, i64 %4395
  %4397 = load i8, i8 addrspace(4)* %4396, align 1, !tbaa !14
  %4398 = zext i8 %4397 to i64
  %4399 = shl i32 %4393, 3
  %4400 = zext i32 %4399 to i64
  %4401 = shl nuw i64 %4398, %4400
  %4402 = or i64 %4401, %4394
  %4403 = add nuw nsw i32 %4393, 1
  %4404 = icmp eq i32 %4403, %4387
  br i1 %4404, label %4445, label %4392

4405:                                             ; preds = %4385
  %4406 = load i8, i8 addrspace(4)* %4386, align 1, !tbaa !14
  %4407 = zext i8 %4406 to i64
  %4408 = getelementptr inbounds i8, i8 addrspace(4)* %4386, i64 1
  %4409 = load i8, i8 addrspace(4)* %4408, align 1, !tbaa !14
  %4410 = zext i8 %4409 to i64
  %4411 = shl nuw nsw i64 %4410, 8
  %4412 = or i64 %4411, %4407
  %4413 = getelementptr inbounds i8, i8 addrspace(4)* %4386, i64 2
  %4414 = load i8, i8 addrspace(4)* %4413, align 1, !tbaa !14
  %4415 = zext i8 %4414 to i64
  %4416 = shl nuw nsw i64 %4415, 16
  %4417 = or i64 %4412, %4416
  %4418 = getelementptr inbounds i8, i8 addrspace(4)* %4386, i64 3
  %4419 = load i8, i8 addrspace(4)* %4418, align 1, !tbaa !14
  %4420 = zext i8 %4419 to i64
  %4421 = shl nuw nsw i64 %4420, 24
  %4422 = or i64 %4417, %4421
  %4423 = getelementptr inbounds i8, i8 addrspace(4)* %4386, i64 4
  %4424 = load i8, i8 addrspace(4)* %4423, align 1, !tbaa !14
  %4425 = zext i8 %4424 to i64
  %4426 = shl nuw nsw i64 %4425, 32
  %4427 = or i64 %4422, %4426
  %4428 = getelementptr inbounds i8, i8 addrspace(4)* %4386, i64 5
  %4429 = load i8, i8 addrspace(4)* %4428, align 1, !tbaa !14
  %4430 = zext i8 %4429 to i64
  %4431 = shl nuw nsw i64 %4430, 40
  %4432 = or i64 %4427, %4431
  %4433 = getelementptr inbounds i8, i8 addrspace(4)* %4386, i64 6
  %4434 = load i8, i8 addrspace(4)* %4433, align 1, !tbaa !14
  %4435 = zext i8 %4434 to i64
  %4436 = shl nuw nsw i64 %4435, 48
  %4437 = or i64 %4432, %4436
  %4438 = getelementptr inbounds i8, i8 addrspace(4)* %4386, i64 7
  %4439 = load i8, i8 addrspace(4)* %4438, align 1, !tbaa !14
  %4440 = zext i8 %4439 to i64
  %4441 = shl nuw i64 %4440, 56
  %4442 = or i64 %4437, %4441
  %4443 = add nsw i32 %4387, -8
  %4444 = getelementptr inbounds i8, i8 addrspace(4)* %4386, i64 8
  br label %4445

4445:                                             ; preds = %4392, %4405, %4390
  %4446 = phi i8 addrspace(4)* [ %4444, %4405 ], [ %4386, %4390 ], [ %4386, %4392 ]
  %4447 = phi i32 [ %4443, %4405 ], [ 0, %4390 ], [ 0, %4392 ]
  %4448 = phi i64 [ %4442, %4405 ], [ 0, %4390 ], [ %4402, %4392 ]
  %4449 = icmp ugt i32 %4447, 7
  br i1 %4449, label %4465, label %4450

4450:                                             ; preds = %4445
  %4451 = icmp eq i32 %4447, 0
  br i1 %4451, label %4505, label %4452

4452:                                             ; preds = %4450, %4452
  %4453 = phi i32 [ %4463, %4452 ], [ 0, %4450 ]
  %4454 = phi i64 [ %4462, %4452 ], [ 0, %4450 ]
  %4455 = zext i32 %4453 to i64
  %4456 = getelementptr inbounds i8, i8 addrspace(4)* %4446, i64 %4455
  %4457 = load i8, i8 addrspace(4)* %4456, align 1, !tbaa !14
  %4458 = zext i8 %4457 to i64
  %4459 = shl i32 %4453, 3
  %4460 = zext i32 %4459 to i64
  %4461 = shl nuw i64 %4458, %4460
  %4462 = or i64 %4461, %4454
  %4463 = add nuw nsw i32 %4453, 1
  %4464 = icmp eq i32 %4463, %4447
  br i1 %4464, label %4505, label %4452

4465:                                             ; preds = %4445
  %4466 = load i8, i8 addrspace(4)* %4446, align 1, !tbaa !14
  %4467 = zext i8 %4466 to i64
  %4468 = getelementptr inbounds i8, i8 addrspace(4)* %4446, i64 1
  %4469 = load i8, i8 addrspace(4)* %4468, align 1, !tbaa !14
  %4470 = zext i8 %4469 to i64
  %4471 = shl nuw nsw i64 %4470, 8
  %4472 = or i64 %4471, %4467
  %4473 = getelementptr inbounds i8, i8 addrspace(4)* %4446, i64 2
  %4474 = load i8, i8 addrspace(4)* %4473, align 1, !tbaa !14
  %4475 = zext i8 %4474 to i64
  %4476 = shl nuw nsw i64 %4475, 16
  %4477 = or i64 %4472, %4476
  %4478 = getelementptr inbounds i8, i8 addrspace(4)* %4446, i64 3
  %4479 = load i8, i8 addrspace(4)* %4478, align 1, !tbaa !14
  %4480 = zext i8 %4479 to i64
  %4481 = shl nuw nsw i64 %4480, 24
  %4482 = or i64 %4477, %4481
  %4483 = getelementptr inbounds i8, i8 addrspace(4)* %4446, i64 4
  %4484 = load i8, i8 addrspace(4)* %4483, align 1, !tbaa !14
  %4485 = zext i8 %4484 to i64
  %4486 = shl nuw nsw i64 %4485, 32
  %4487 = or i64 %4482, %4486
  %4488 = getelementptr inbounds i8, i8 addrspace(4)* %4446, i64 5
  %4489 = load i8, i8 addrspace(4)* %4488, align 1, !tbaa !14
  %4490 = zext i8 %4489 to i64
  %4491 = shl nuw nsw i64 %4490, 40
  %4492 = or i64 %4487, %4491
  %4493 = getelementptr inbounds i8, i8 addrspace(4)* %4446, i64 6
  %4494 = load i8, i8 addrspace(4)* %4493, align 1, !tbaa !14
  %4495 = zext i8 %4494 to i64
  %4496 = shl nuw nsw i64 %4495, 48
  %4497 = or i64 %4492, %4496
  %4498 = getelementptr inbounds i8, i8 addrspace(4)* %4446, i64 7
  %4499 = load i8, i8 addrspace(4)* %4498, align 1, !tbaa !14
  %4500 = zext i8 %4499 to i64
  %4501 = shl nuw i64 %4500, 56
  %4502 = or i64 %4497, %4501
  %4503 = add nsw i32 %4447, -8
  %4504 = getelementptr inbounds i8, i8 addrspace(4)* %4446, i64 8
  br label %4505

4505:                                             ; preds = %4452, %4465, %4450
  %4506 = phi i8 addrspace(4)* [ %4504, %4465 ], [ %4446, %4450 ], [ %4446, %4452 ]
  %4507 = phi i32 [ %4503, %4465 ], [ 0, %4450 ], [ 0, %4452 ]
  %4508 = phi i64 [ %4502, %4465 ], [ 0, %4450 ], [ %4462, %4452 ]
  %4509 = icmp ugt i32 %4507, 7
  br i1 %4509, label %4525, label %4510

4510:                                             ; preds = %4505
  %4511 = icmp eq i32 %4507, 0
  br i1 %4511, label %4563, label %4512

4512:                                             ; preds = %4510, %4512
  %4513 = phi i32 [ %4523, %4512 ], [ 0, %4510 ]
  %4514 = phi i64 [ %4522, %4512 ], [ 0, %4510 ]
  %4515 = zext i32 %4513 to i64
  %4516 = getelementptr inbounds i8, i8 addrspace(4)* %4506, i64 %4515
  %4517 = load i8, i8 addrspace(4)* %4516, align 1, !tbaa !14
  %4518 = zext i8 %4517 to i64
  %4519 = shl i32 %4513, 3
  %4520 = zext i32 %4519 to i64
  %4521 = shl nuw i64 %4518, %4520
  %4522 = or i64 %4521, %4514
  %4523 = add nuw nsw i32 %4513, 1
  %4524 = icmp eq i32 %4523, %4507
  br i1 %4524, label %4563, label %4512

4525:                                             ; preds = %4505
  %4526 = load i8, i8 addrspace(4)* %4506, align 1, !tbaa !14
  %4527 = zext i8 %4526 to i64
  %4528 = getelementptr inbounds i8, i8 addrspace(4)* %4506, i64 1
  %4529 = load i8, i8 addrspace(4)* %4528, align 1, !tbaa !14
  %4530 = zext i8 %4529 to i64
  %4531 = shl nuw nsw i64 %4530, 8
  %4532 = or i64 %4531, %4527
  %4533 = getelementptr inbounds i8, i8 addrspace(4)* %4506, i64 2
  %4534 = load i8, i8 addrspace(4)* %4533, align 1, !tbaa !14
  %4535 = zext i8 %4534 to i64
  %4536 = shl nuw nsw i64 %4535, 16
  %4537 = or i64 %4532, %4536
  %4538 = getelementptr inbounds i8, i8 addrspace(4)* %4506, i64 3
  %4539 = load i8, i8 addrspace(4)* %4538, align 1, !tbaa !14
  %4540 = zext i8 %4539 to i64
  %4541 = shl nuw nsw i64 %4540, 24
  %4542 = or i64 %4537, %4541
  %4543 = getelementptr inbounds i8, i8 addrspace(4)* %4506, i64 4
  %4544 = load i8, i8 addrspace(4)* %4543, align 1, !tbaa !14
  %4545 = zext i8 %4544 to i64
  %4546 = shl nuw nsw i64 %4545, 32
  %4547 = or i64 %4542, %4546
  %4548 = getelementptr inbounds i8, i8 addrspace(4)* %4506, i64 5
  %4549 = load i8, i8 addrspace(4)* %4548, align 1, !tbaa !14
  %4550 = zext i8 %4549 to i64
  %4551 = shl nuw nsw i64 %4550, 40
  %4552 = or i64 %4547, %4551
  %4553 = getelementptr inbounds i8, i8 addrspace(4)* %4506, i64 6
  %4554 = load i8, i8 addrspace(4)* %4553, align 1, !tbaa !14
  %4555 = zext i8 %4554 to i64
  %4556 = shl nuw nsw i64 %4555, 48
  %4557 = or i64 %4552, %4556
  %4558 = getelementptr inbounds i8, i8 addrspace(4)* %4506, i64 7
  %4559 = load i8, i8 addrspace(4)* %4558, align 1, !tbaa !14
  %4560 = zext i8 %4559 to i64
  %4561 = shl nuw i64 %4560, 56
  %4562 = or i64 %4557, %4561
  br label %4563

4563:                                             ; preds = %4512, %4525, %4510
  %4564 = phi i64 [ %4562, %4525 ], [ 0, %4510 ], [ %4522, %4512 ]
  %4565 = shl nuw nsw i64 %4146, 2
  %4566 = add nuw nsw i64 %4565, 28
  %4567 = and i64 %4566, 480
  %4568 = and i64 %4148, -225
  %4569 = or i64 %4568, %4567
  %4570 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %15, i64 noundef %4569, i64 noundef %4208, i64 noundef %4268, i64 noundef %4328, i64 noundef %4388, i64 noundef %4448, i64 noundef %4508, i64 noundef %4564) #11
  %4571 = sub i64 %4138, %4146
  %4572 = getelementptr inbounds i8, i8 addrspace(4)* %4139, i64 %4146
  %4573 = icmp eq i64 %4571, 0
  br i1 %4573, label %4578, label %4137

4574:                                             ; preds = %4122
  %4575 = and i64 %4132, -225
  %4576 = or i64 %4575, 32
  %4577 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %15, i64 noundef %4576, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  br label %4578

4578:                                             ; preds = %4563, %4574
  %4579 = phi <2 x i64> [ %4577, %4574 ], [ %4570, %4563 ]
  %4580 = extractelement <2 x i64> %4579, i64 0
  %4581 = and i64 %4580, -227
  %4582 = or i64 %4581, 34
  %4583 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %15, i64 noundef %4582, i64 noundef 3, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %4584 = load i32, i32 addrspace(3)* getelementptr inbounds ([0 x i32], [0 x i32] addrspace(3)* @seme, i32 0, i32 3), align 4, !tbaa !5
  %4585 = load i32, i32 addrspace(1)* %10, align 4, !tbaa !5
  %4586 = add nsw i32 %4585, %4584
  store i32 %4586, i32 addrspace(1)* %10, align 4, !tbaa !5
  %4587 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %15, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %4588 = extractelement <2 x i64> %4587, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([21 x i8], [21 x i8] addrspace(4)* @.str.2, i64 0, i64 0) to i8*), i8* null), label %5030, label %4589

4589:                                             ; preds = %4578
  %4590 = and i64 %4588, 2
  %4591 = and i64 %4588, -3
  %4592 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %4591, i64 0
  br label %4593

4593:                                             ; preds = %5019, %4589
  %4594 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([21 x i8], [21 x i8] addrspace(4)* @.str.2, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([21 x i8], [21 x i8] addrspace(4)* @.str.2, i64 0, i64 20) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([21 x i8]* addrspacecast ([21 x i8] addrspace(4)* @.str.2 to [21 x i8]*) to i64)), i64 1))), %4589 ], [ %5027, %5019 ]
  %4595 = phi i8 addrspace(4)* [ getelementptr inbounds ([21 x i8], [21 x i8] addrspace(4)* @.str.2, i64 0, i64 0), %4589 ], [ %5028, %5019 ]
  %4596 = phi <2 x i64> [ %4592, %4589 ], [ %5026, %5019 ]
  %4597 = icmp ugt i64 %4594, 56
  %4598 = extractelement <2 x i64> %4596, i64 0
  %4599 = or i64 %4598, %4590
  %4600 = insertelement <2 x i64> poison, i64 %4599, i64 0
  %4601 = select i1 %4597, <2 x i64> %4596, <2 x i64> %4600
  %4602 = tail call i64 @llvm.umin.i64(i64 %4594, i64 56)
  %4603 = trunc i64 %4602 to i32
  %4604 = extractelement <2 x i64> %4601, i64 0
  %4605 = icmp ugt i32 %4603, 7
  br i1 %4605, label %4621, label %4606

4606:                                             ; preds = %4593
  %4607 = icmp eq i32 %4603, 0
  br i1 %4607, label %4661, label %4608

4608:                                             ; preds = %4606, %4608
  %4609 = phi i32 [ %4619, %4608 ], [ 0, %4606 ]
  %4610 = phi i64 [ %4618, %4608 ], [ 0, %4606 ]
  %4611 = zext i32 %4609 to i64
  %4612 = getelementptr inbounds i8, i8 addrspace(4)* %4595, i64 %4611
  %4613 = load i8, i8 addrspace(4)* %4612, align 1, !tbaa !14
  %4614 = zext i8 %4613 to i64
  %4615 = shl i32 %4609, 3
  %4616 = zext i32 %4615 to i64
  %4617 = shl nuw i64 %4614, %4616
  %4618 = or i64 %4617, %4610
  %4619 = add nuw nsw i32 %4609, 1
  %4620 = icmp eq i32 %4619, %4603
  br i1 %4620, label %4661, label %4608, !llvm.loop !15

4621:                                             ; preds = %4593
  %4622 = load i8, i8 addrspace(4)* %4595, align 1, !tbaa !14
  %4623 = zext i8 %4622 to i64
  %4624 = getelementptr inbounds i8, i8 addrspace(4)* %4595, i64 1
  %4625 = load i8, i8 addrspace(4)* %4624, align 1, !tbaa !14
  %4626 = zext i8 %4625 to i64
  %4627 = shl nuw nsw i64 %4626, 8
  %4628 = or i64 %4627, %4623
  %4629 = getelementptr inbounds i8, i8 addrspace(4)* %4595, i64 2
  %4630 = load i8, i8 addrspace(4)* %4629, align 1, !tbaa !14
  %4631 = zext i8 %4630 to i64
  %4632 = shl nuw nsw i64 %4631, 16
  %4633 = or i64 %4628, %4632
  %4634 = getelementptr inbounds i8, i8 addrspace(4)* %4595, i64 3
  %4635 = load i8, i8 addrspace(4)* %4634, align 1, !tbaa !14
  %4636 = zext i8 %4635 to i64
  %4637 = shl nuw nsw i64 %4636, 24
  %4638 = or i64 %4633, %4637
  %4639 = getelementptr inbounds i8, i8 addrspace(4)* %4595, i64 4
  %4640 = load i8, i8 addrspace(4)* %4639, align 1, !tbaa !14
  %4641 = zext i8 %4640 to i64
  %4642 = shl nuw nsw i64 %4641, 32
  %4643 = or i64 %4638, %4642
  %4644 = getelementptr inbounds i8, i8 addrspace(4)* %4595, i64 5
  %4645 = load i8, i8 addrspace(4)* %4644, align 1, !tbaa !14
  %4646 = zext i8 %4645 to i64
  %4647 = shl nuw nsw i64 %4646, 40
  %4648 = or i64 %4643, %4647
  %4649 = getelementptr inbounds i8, i8 addrspace(4)* %4595, i64 6
  %4650 = load i8, i8 addrspace(4)* %4649, align 1, !tbaa !14
  %4651 = zext i8 %4650 to i64
  %4652 = shl nuw nsw i64 %4651, 48
  %4653 = or i64 %4648, %4652
  %4654 = getelementptr inbounds i8, i8 addrspace(4)* %4595, i64 7
  %4655 = load i8, i8 addrspace(4)* %4654, align 1, !tbaa !14
  %4656 = zext i8 %4655 to i64
  %4657 = shl nuw i64 %4656, 56
  %4658 = or i64 %4653, %4657
  %4659 = add nsw i32 %4603, -8
  %4660 = getelementptr inbounds i8, i8 addrspace(4)* %4595, i64 8
  br label %4661

4661:                                             ; preds = %4608, %4621, %4606
  %4662 = phi i8 addrspace(4)* [ %4660, %4621 ], [ %4595, %4606 ], [ %4595, %4608 ]
  %4663 = phi i32 [ %4659, %4621 ], [ 0, %4606 ], [ 0, %4608 ]
  %4664 = phi i64 [ %4658, %4621 ], [ 0, %4606 ], [ %4618, %4608 ]
  %4665 = icmp ugt i32 %4663, 7
  br i1 %4665, label %4681, label %4666

4666:                                             ; preds = %4661
  %4667 = icmp eq i32 %4663, 0
  br i1 %4667, label %4721, label %4668

4668:                                             ; preds = %4666, %4668
  %4669 = phi i32 [ %4679, %4668 ], [ 0, %4666 ]
  %4670 = phi i64 [ %4678, %4668 ], [ 0, %4666 ]
  %4671 = zext i32 %4669 to i64
  %4672 = getelementptr inbounds i8, i8 addrspace(4)* %4662, i64 %4671
  %4673 = load i8, i8 addrspace(4)* %4672, align 1, !tbaa !14
  %4674 = zext i8 %4673 to i64
  %4675 = shl i32 %4669, 3
  %4676 = zext i32 %4675 to i64
  %4677 = shl nuw i64 %4674, %4676
  %4678 = or i64 %4677, %4670
  %4679 = add nuw nsw i32 %4669, 1
  %4680 = icmp eq i32 %4679, %4663
  br i1 %4680, label %4721, label %4668

4681:                                             ; preds = %4661
  %4682 = load i8, i8 addrspace(4)* %4662, align 1, !tbaa !14
  %4683 = zext i8 %4682 to i64
  %4684 = getelementptr inbounds i8, i8 addrspace(4)* %4662, i64 1
  %4685 = load i8, i8 addrspace(4)* %4684, align 1, !tbaa !14
  %4686 = zext i8 %4685 to i64
  %4687 = shl nuw nsw i64 %4686, 8
  %4688 = or i64 %4687, %4683
  %4689 = getelementptr inbounds i8, i8 addrspace(4)* %4662, i64 2
  %4690 = load i8, i8 addrspace(4)* %4689, align 1, !tbaa !14
  %4691 = zext i8 %4690 to i64
  %4692 = shl nuw nsw i64 %4691, 16
  %4693 = or i64 %4688, %4692
  %4694 = getelementptr inbounds i8, i8 addrspace(4)* %4662, i64 3
  %4695 = load i8, i8 addrspace(4)* %4694, align 1, !tbaa !14
  %4696 = zext i8 %4695 to i64
  %4697 = shl nuw nsw i64 %4696, 24
  %4698 = or i64 %4693, %4697
  %4699 = getelementptr inbounds i8, i8 addrspace(4)* %4662, i64 4
  %4700 = load i8, i8 addrspace(4)* %4699, align 1, !tbaa !14
  %4701 = zext i8 %4700 to i64
  %4702 = shl nuw nsw i64 %4701, 32
  %4703 = or i64 %4698, %4702
  %4704 = getelementptr inbounds i8, i8 addrspace(4)* %4662, i64 5
  %4705 = load i8, i8 addrspace(4)* %4704, align 1, !tbaa !14
  %4706 = zext i8 %4705 to i64
  %4707 = shl nuw nsw i64 %4706, 40
  %4708 = or i64 %4703, %4707
  %4709 = getelementptr inbounds i8, i8 addrspace(4)* %4662, i64 6
  %4710 = load i8, i8 addrspace(4)* %4709, align 1, !tbaa !14
  %4711 = zext i8 %4710 to i64
  %4712 = shl nuw nsw i64 %4711, 48
  %4713 = or i64 %4708, %4712
  %4714 = getelementptr inbounds i8, i8 addrspace(4)* %4662, i64 7
  %4715 = load i8, i8 addrspace(4)* %4714, align 1, !tbaa !14
  %4716 = zext i8 %4715 to i64
  %4717 = shl nuw i64 %4716, 56
  %4718 = or i64 %4713, %4717
  %4719 = add nsw i32 %4663, -8
  %4720 = getelementptr inbounds i8, i8 addrspace(4)* %4662, i64 8
  br label %4721

4721:                                             ; preds = %4668, %4681, %4666
  %4722 = phi i8 addrspace(4)* [ %4720, %4681 ], [ %4662, %4666 ], [ %4662, %4668 ]
  %4723 = phi i32 [ %4719, %4681 ], [ 0, %4666 ], [ 0, %4668 ]
  %4724 = phi i64 [ %4718, %4681 ], [ 0, %4666 ], [ %4678, %4668 ]
  %4725 = icmp ugt i32 %4723, 7
  br i1 %4725, label %4741, label %4726

4726:                                             ; preds = %4721
  %4727 = icmp eq i32 %4723, 0
  br i1 %4727, label %4781, label %4728

4728:                                             ; preds = %4726, %4728
  %4729 = phi i32 [ %4739, %4728 ], [ 0, %4726 ]
  %4730 = phi i64 [ %4738, %4728 ], [ 0, %4726 ]
  %4731 = zext i32 %4729 to i64
  %4732 = getelementptr inbounds i8, i8 addrspace(4)* %4722, i64 %4731
  %4733 = load i8, i8 addrspace(4)* %4732, align 1, !tbaa !14
  %4734 = zext i8 %4733 to i64
  %4735 = shl i32 %4729, 3
  %4736 = zext i32 %4735 to i64
  %4737 = shl nuw i64 %4734, %4736
  %4738 = or i64 %4737, %4730
  %4739 = add nuw nsw i32 %4729, 1
  %4740 = icmp eq i32 %4739, %4723
  br i1 %4740, label %4781, label %4728

4741:                                             ; preds = %4721
  %4742 = load i8, i8 addrspace(4)* %4722, align 1, !tbaa !14
  %4743 = zext i8 %4742 to i64
  %4744 = getelementptr inbounds i8, i8 addrspace(4)* %4722, i64 1
  %4745 = load i8, i8 addrspace(4)* %4744, align 1, !tbaa !14
  %4746 = zext i8 %4745 to i64
  %4747 = shl nuw nsw i64 %4746, 8
  %4748 = or i64 %4747, %4743
  %4749 = getelementptr inbounds i8, i8 addrspace(4)* %4722, i64 2
  %4750 = load i8, i8 addrspace(4)* %4749, align 1, !tbaa !14
  %4751 = zext i8 %4750 to i64
  %4752 = shl nuw nsw i64 %4751, 16
  %4753 = or i64 %4748, %4752
  %4754 = getelementptr inbounds i8, i8 addrspace(4)* %4722, i64 3
  %4755 = load i8, i8 addrspace(4)* %4754, align 1, !tbaa !14
  %4756 = zext i8 %4755 to i64
  %4757 = shl nuw nsw i64 %4756, 24
  %4758 = or i64 %4753, %4757
  %4759 = getelementptr inbounds i8, i8 addrspace(4)* %4722, i64 4
  %4760 = load i8, i8 addrspace(4)* %4759, align 1, !tbaa !14
  %4761 = zext i8 %4760 to i64
  %4762 = shl nuw nsw i64 %4761, 32
  %4763 = or i64 %4758, %4762
  %4764 = getelementptr inbounds i8, i8 addrspace(4)* %4722, i64 5
  %4765 = load i8, i8 addrspace(4)* %4764, align 1, !tbaa !14
  %4766 = zext i8 %4765 to i64
  %4767 = shl nuw nsw i64 %4766, 40
  %4768 = or i64 %4763, %4767
  %4769 = getelementptr inbounds i8, i8 addrspace(4)* %4722, i64 6
  %4770 = load i8, i8 addrspace(4)* %4769, align 1, !tbaa !14
  %4771 = zext i8 %4770 to i64
  %4772 = shl nuw nsw i64 %4771, 48
  %4773 = or i64 %4768, %4772
  %4774 = getelementptr inbounds i8, i8 addrspace(4)* %4722, i64 7
  %4775 = load i8, i8 addrspace(4)* %4774, align 1, !tbaa !14
  %4776 = zext i8 %4775 to i64
  %4777 = shl nuw i64 %4776, 56
  %4778 = or i64 %4773, %4777
  %4779 = add nsw i32 %4723, -8
  %4780 = getelementptr inbounds i8, i8 addrspace(4)* %4722, i64 8
  br label %4781

4781:                                             ; preds = %4728, %4741, %4726
  %4782 = phi i8 addrspace(4)* [ %4780, %4741 ], [ %4722, %4726 ], [ %4722, %4728 ]
  %4783 = phi i32 [ %4779, %4741 ], [ 0, %4726 ], [ 0, %4728 ]
  %4784 = phi i64 [ %4778, %4741 ], [ 0, %4726 ], [ %4738, %4728 ]
  %4785 = icmp ugt i32 %4783, 7
  br i1 %4785, label %4801, label %4786

4786:                                             ; preds = %4781
  %4787 = icmp eq i32 %4783, 0
  br i1 %4787, label %4841, label %4788

4788:                                             ; preds = %4786, %4788
  %4789 = phi i32 [ %4799, %4788 ], [ 0, %4786 ]
  %4790 = phi i64 [ %4798, %4788 ], [ 0, %4786 ]
  %4791 = zext i32 %4789 to i64
  %4792 = getelementptr inbounds i8, i8 addrspace(4)* %4782, i64 %4791
  %4793 = load i8, i8 addrspace(4)* %4792, align 1, !tbaa !14
  %4794 = zext i8 %4793 to i64
  %4795 = shl i32 %4789, 3
  %4796 = zext i32 %4795 to i64
  %4797 = shl nuw i64 %4794, %4796
  %4798 = or i64 %4797, %4790
  %4799 = add nuw nsw i32 %4789, 1
  %4800 = icmp eq i32 %4799, %4783
  br i1 %4800, label %4841, label %4788

4801:                                             ; preds = %4781
  %4802 = load i8, i8 addrspace(4)* %4782, align 1, !tbaa !14
  %4803 = zext i8 %4802 to i64
  %4804 = getelementptr inbounds i8, i8 addrspace(4)* %4782, i64 1
  %4805 = load i8, i8 addrspace(4)* %4804, align 1, !tbaa !14
  %4806 = zext i8 %4805 to i64
  %4807 = shl nuw nsw i64 %4806, 8
  %4808 = or i64 %4807, %4803
  %4809 = getelementptr inbounds i8, i8 addrspace(4)* %4782, i64 2
  %4810 = load i8, i8 addrspace(4)* %4809, align 1, !tbaa !14
  %4811 = zext i8 %4810 to i64
  %4812 = shl nuw nsw i64 %4811, 16
  %4813 = or i64 %4808, %4812
  %4814 = getelementptr inbounds i8, i8 addrspace(4)* %4782, i64 3
  %4815 = load i8, i8 addrspace(4)* %4814, align 1, !tbaa !14
  %4816 = zext i8 %4815 to i64
  %4817 = shl nuw nsw i64 %4816, 24
  %4818 = or i64 %4813, %4817
  %4819 = getelementptr inbounds i8, i8 addrspace(4)* %4782, i64 4
  %4820 = load i8, i8 addrspace(4)* %4819, align 1, !tbaa !14
  %4821 = zext i8 %4820 to i64
  %4822 = shl nuw nsw i64 %4821, 32
  %4823 = or i64 %4818, %4822
  %4824 = getelementptr inbounds i8, i8 addrspace(4)* %4782, i64 5
  %4825 = load i8, i8 addrspace(4)* %4824, align 1, !tbaa !14
  %4826 = zext i8 %4825 to i64
  %4827 = shl nuw nsw i64 %4826, 40
  %4828 = or i64 %4823, %4827
  %4829 = getelementptr inbounds i8, i8 addrspace(4)* %4782, i64 6
  %4830 = load i8, i8 addrspace(4)* %4829, align 1, !tbaa !14
  %4831 = zext i8 %4830 to i64
  %4832 = shl nuw nsw i64 %4831, 48
  %4833 = or i64 %4828, %4832
  %4834 = getelementptr inbounds i8, i8 addrspace(4)* %4782, i64 7
  %4835 = load i8, i8 addrspace(4)* %4834, align 1, !tbaa !14
  %4836 = zext i8 %4835 to i64
  %4837 = shl nuw i64 %4836, 56
  %4838 = or i64 %4833, %4837
  %4839 = add nsw i32 %4783, -8
  %4840 = getelementptr inbounds i8, i8 addrspace(4)* %4782, i64 8
  br label %4841

4841:                                             ; preds = %4788, %4801, %4786
  %4842 = phi i8 addrspace(4)* [ %4840, %4801 ], [ %4782, %4786 ], [ %4782, %4788 ]
  %4843 = phi i32 [ %4839, %4801 ], [ 0, %4786 ], [ 0, %4788 ]
  %4844 = phi i64 [ %4838, %4801 ], [ 0, %4786 ], [ %4798, %4788 ]
  %4845 = icmp ugt i32 %4843, 7
  br i1 %4845, label %4861, label %4846

4846:                                             ; preds = %4841
  %4847 = icmp eq i32 %4843, 0
  br i1 %4847, label %4901, label %4848

4848:                                             ; preds = %4846, %4848
  %4849 = phi i32 [ %4859, %4848 ], [ 0, %4846 ]
  %4850 = phi i64 [ %4858, %4848 ], [ 0, %4846 ]
  %4851 = zext i32 %4849 to i64
  %4852 = getelementptr inbounds i8, i8 addrspace(4)* %4842, i64 %4851
  %4853 = load i8, i8 addrspace(4)* %4852, align 1, !tbaa !14
  %4854 = zext i8 %4853 to i64
  %4855 = shl i32 %4849, 3
  %4856 = zext i32 %4855 to i64
  %4857 = shl nuw i64 %4854, %4856
  %4858 = or i64 %4857, %4850
  %4859 = add nuw nsw i32 %4849, 1
  %4860 = icmp eq i32 %4859, %4843
  br i1 %4860, label %4901, label %4848

4861:                                             ; preds = %4841
  %4862 = load i8, i8 addrspace(4)* %4842, align 1, !tbaa !14
  %4863 = zext i8 %4862 to i64
  %4864 = getelementptr inbounds i8, i8 addrspace(4)* %4842, i64 1
  %4865 = load i8, i8 addrspace(4)* %4864, align 1, !tbaa !14
  %4866 = zext i8 %4865 to i64
  %4867 = shl nuw nsw i64 %4866, 8
  %4868 = or i64 %4867, %4863
  %4869 = getelementptr inbounds i8, i8 addrspace(4)* %4842, i64 2
  %4870 = load i8, i8 addrspace(4)* %4869, align 1, !tbaa !14
  %4871 = zext i8 %4870 to i64
  %4872 = shl nuw nsw i64 %4871, 16
  %4873 = or i64 %4868, %4872
  %4874 = getelementptr inbounds i8, i8 addrspace(4)* %4842, i64 3
  %4875 = load i8, i8 addrspace(4)* %4874, align 1, !tbaa !14
  %4876 = zext i8 %4875 to i64
  %4877 = shl nuw nsw i64 %4876, 24
  %4878 = or i64 %4873, %4877
  %4879 = getelementptr inbounds i8, i8 addrspace(4)* %4842, i64 4
  %4880 = load i8, i8 addrspace(4)* %4879, align 1, !tbaa !14
  %4881 = zext i8 %4880 to i64
  %4882 = shl nuw nsw i64 %4881, 32
  %4883 = or i64 %4878, %4882
  %4884 = getelementptr inbounds i8, i8 addrspace(4)* %4842, i64 5
  %4885 = load i8, i8 addrspace(4)* %4884, align 1, !tbaa !14
  %4886 = zext i8 %4885 to i64
  %4887 = shl nuw nsw i64 %4886, 40
  %4888 = or i64 %4883, %4887
  %4889 = getelementptr inbounds i8, i8 addrspace(4)* %4842, i64 6
  %4890 = load i8, i8 addrspace(4)* %4889, align 1, !tbaa !14
  %4891 = zext i8 %4890 to i64
  %4892 = shl nuw nsw i64 %4891, 48
  %4893 = or i64 %4888, %4892
  %4894 = getelementptr inbounds i8, i8 addrspace(4)* %4842, i64 7
  %4895 = load i8, i8 addrspace(4)* %4894, align 1, !tbaa !14
  %4896 = zext i8 %4895 to i64
  %4897 = shl nuw i64 %4896, 56
  %4898 = or i64 %4893, %4897
  %4899 = add nsw i32 %4843, -8
  %4900 = getelementptr inbounds i8, i8 addrspace(4)* %4842, i64 8
  br label %4901

4901:                                             ; preds = %4848, %4861, %4846
  %4902 = phi i8 addrspace(4)* [ %4900, %4861 ], [ %4842, %4846 ], [ %4842, %4848 ]
  %4903 = phi i32 [ %4899, %4861 ], [ 0, %4846 ], [ 0, %4848 ]
  %4904 = phi i64 [ %4898, %4861 ], [ 0, %4846 ], [ %4858, %4848 ]
  %4905 = icmp ugt i32 %4903, 7
  br i1 %4905, label %4921, label %4906

4906:                                             ; preds = %4901
  %4907 = icmp eq i32 %4903, 0
  br i1 %4907, label %4961, label %4908

4908:                                             ; preds = %4906, %4908
  %4909 = phi i32 [ %4919, %4908 ], [ 0, %4906 ]
  %4910 = phi i64 [ %4918, %4908 ], [ 0, %4906 ]
  %4911 = zext i32 %4909 to i64
  %4912 = getelementptr inbounds i8, i8 addrspace(4)* %4902, i64 %4911
  %4913 = load i8, i8 addrspace(4)* %4912, align 1, !tbaa !14
  %4914 = zext i8 %4913 to i64
  %4915 = shl i32 %4909, 3
  %4916 = zext i32 %4915 to i64
  %4917 = shl nuw i64 %4914, %4916
  %4918 = or i64 %4917, %4910
  %4919 = add nuw nsw i32 %4909, 1
  %4920 = icmp eq i32 %4919, %4903
  br i1 %4920, label %4961, label %4908

4921:                                             ; preds = %4901
  %4922 = load i8, i8 addrspace(4)* %4902, align 1, !tbaa !14
  %4923 = zext i8 %4922 to i64
  %4924 = getelementptr inbounds i8, i8 addrspace(4)* %4902, i64 1
  %4925 = load i8, i8 addrspace(4)* %4924, align 1, !tbaa !14
  %4926 = zext i8 %4925 to i64
  %4927 = shl nuw nsw i64 %4926, 8
  %4928 = or i64 %4927, %4923
  %4929 = getelementptr inbounds i8, i8 addrspace(4)* %4902, i64 2
  %4930 = load i8, i8 addrspace(4)* %4929, align 1, !tbaa !14
  %4931 = zext i8 %4930 to i64
  %4932 = shl nuw nsw i64 %4931, 16
  %4933 = or i64 %4928, %4932
  %4934 = getelementptr inbounds i8, i8 addrspace(4)* %4902, i64 3
  %4935 = load i8, i8 addrspace(4)* %4934, align 1, !tbaa !14
  %4936 = zext i8 %4935 to i64
  %4937 = shl nuw nsw i64 %4936, 24
  %4938 = or i64 %4933, %4937
  %4939 = getelementptr inbounds i8, i8 addrspace(4)* %4902, i64 4
  %4940 = load i8, i8 addrspace(4)* %4939, align 1, !tbaa !14
  %4941 = zext i8 %4940 to i64
  %4942 = shl nuw nsw i64 %4941, 32
  %4943 = or i64 %4938, %4942
  %4944 = getelementptr inbounds i8, i8 addrspace(4)* %4902, i64 5
  %4945 = load i8, i8 addrspace(4)* %4944, align 1, !tbaa !14
  %4946 = zext i8 %4945 to i64
  %4947 = shl nuw nsw i64 %4946, 40
  %4948 = or i64 %4943, %4947
  %4949 = getelementptr inbounds i8, i8 addrspace(4)* %4902, i64 6
  %4950 = load i8, i8 addrspace(4)* %4949, align 1, !tbaa !14
  %4951 = zext i8 %4950 to i64
  %4952 = shl nuw nsw i64 %4951, 48
  %4953 = or i64 %4948, %4952
  %4954 = getelementptr inbounds i8, i8 addrspace(4)* %4902, i64 7
  %4955 = load i8, i8 addrspace(4)* %4954, align 1, !tbaa !14
  %4956 = zext i8 %4955 to i64
  %4957 = shl nuw i64 %4956, 56
  %4958 = or i64 %4953, %4957
  %4959 = add nsw i32 %4903, -8
  %4960 = getelementptr inbounds i8, i8 addrspace(4)* %4902, i64 8
  br label %4961

4961:                                             ; preds = %4908, %4921, %4906
  %4962 = phi i8 addrspace(4)* [ %4960, %4921 ], [ %4902, %4906 ], [ %4902, %4908 ]
  %4963 = phi i32 [ %4959, %4921 ], [ 0, %4906 ], [ 0, %4908 ]
  %4964 = phi i64 [ %4958, %4921 ], [ 0, %4906 ], [ %4918, %4908 ]
  %4965 = icmp ugt i32 %4963, 7
  br i1 %4965, label %4981, label %4966

4966:                                             ; preds = %4961
  %4967 = icmp eq i32 %4963, 0
  br i1 %4967, label %5019, label %4968

4968:                                             ; preds = %4966, %4968
  %4969 = phi i32 [ %4979, %4968 ], [ 0, %4966 ]
  %4970 = phi i64 [ %4978, %4968 ], [ 0, %4966 ]
  %4971 = zext i32 %4969 to i64
  %4972 = getelementptr inbounds i8, i8 addrspace(4)* %4962, i64 %4971
  %4973 = load i8, i8 addrspace(4)* %4972, align 1, !tbaa !14
  %4974 = zext i8 %4973 to i64
  %4975 = shl i32 %4969, 3
  %4976 = zext i32 %4975 to i64
  %4977 = shl nuw i64 %4974, %4976
  %4978 = or i64 %4977, %4970
  %4979 = add nuw nsw i32 %4969, 1
  %4980 = icmp eq i32 %4979, %4963
  br i1 %4980, label %5019, label %4968

4981:                                             ; preds = %4961
  %4982 = load i8, i8 addrspace(4)* %4962, align 1, !tbaa !14
  %4983 = zext i8 %4982 to i64
  %4984 = getelementptr inbounds i8, i8 addrspace(4)* %4962, i64 1
  %4985 = load i8, i8 addrspace(4)* %4984, align 1, !tbaa !14
  %4986 = zext i8 %4985 to i64
  %4987 = shl nuw nsw i64 %4986, 8
  %4988 = or i64 %4987, %4983
  %4989 = getelementptr inbounds i8, i8 addrspace(4)* %4962, i64 2
  %4990 = load i8, i8 addrspace(4)* %4989, align 1, !tbaa !14
  %4991 = zext i8 %4990 to i64
  %4992 = shl nuw nsw i64 %4991, 16
  %4993 = or i64 %4988, %4992
  %4994 = getelementptr inbounds i8, i8 addrspace(4)* %4962, i64 3
  %4995 = load i8, i8 addrspace(4)* %4994, align 1, !tbaa !14
  %4996 = zext i8 %4995 to i64
  %4997 = shl nuw nsw i64 %4996, 24
  %4998 = or i64 %4993, %4997
  %4999 = getelementptr inbounds i8, i8 addrspace(4)* %4962, i64 4
  %5000 = load i8, i8 addrspace(4)* %4999, align 1, !tbaa !14
  %5001 = zext i8 %5000 to i64
  %5002 = shl nuw nsw i64 %5001, 32
  %5003 = or i64 %4998, %5002
  %5004 = getelementptr inbounds i8, i8 addrspace(4)* %4962, i64 5
  %5005 = load i8, i8 addrspace(4)* %5004, align 1, !tbaa !14
  %5006 = zext i8 %5005 to i64
  %5007 = shl nuw nsw i64 %5006, 40
  %5008 = or i64 %5003, %5007
  %5009 = getelementptr inbounds i8, i8 addrspace(4)* %4962, i64 6
  %5010 = load i8, i8 addrspace(4)* %5009, align 1, !tbaa !14
  %5011 = zext i8 %5010 to i64
  %5012 = shl nuw nsw i64 %5011, 48
  %5013 = or i64 %5008, %5012
  %5014 = getelementptr inbounds i8, i8 addrspace(4)* %4962, i64 7
  %5015 = load i8, i8 addrspace(4)* %5014, align 1, !tbaa !14
  %5016 = zext i8 %5015 to i64
  %5017 = shl nuw i64 %5016, 56
  %5018 = or i64 %5013, %5017
  br label %5019

5019:                                             ; preds = %4968, %4981, %4966
  %5020 = phi i64 [ %5018, %4981 ], [ 0, %4966 ], [ %4978, %4968 ]
  %5021 = shl nuw nsw i64 %4602, 2
  %5022 = add nuw nsw i64 %5021, 28
  %5023 = and i64 %5022, 480
  %5024 = and i64 %4604, -225
  %5025 = or i64 %5024, %5023
  %5026 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %15, i64 noundef %5025, i64 noundef %4664, i64 noundef %4724, i64 noundef %4784, i64 noundef %4844, i64 noundef %4904, i64 noundef %4964, i64 noundef %5020) #11
  %5027 = sub i64 %4594, %4602
  %5028 = getelementptr inbounds i8, i8 addrspace(4)* %4595, i64 %4602
  %5029 = icmp eq i64 %5027, 0
  br i1 %5029, label %5034, label %4593

5030:                                             ; preds = %4578
  %5031 = and i64 %4588, -225
  %5032 = or i64 %5031, 32
  %5033 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %15, i64 noundef %5032, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  br label %5034

5034:                                             ; preds = %5019, %5030
  %5035 = phi <2 x i64> [ %5033, %5030 ], [ %5026, %5019 ]
  %5036 = extractelement <2 x i64> %5035, i64 0
  %5037 = and i64 %5036, -227
  %5038 = or i64 %5037, 34
  %5039 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %15, i64 noundef %5038, i64 noundef 4, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %5040 = load i32, i32 addrspace(3)* getelementptr inbounds ([0 x i32], [0 x i32] addrspace(3)* @seme, i32 0, i32 4), align 4, !tbaa !5
  %5041 = load i32, i32 addrspace(1)* %10, align 4, !tbaa !5
  %5042 = add nsw i32 %5041, %5040
  store i32 %5042, i32 addrspace(1)* %10, align 4, !tbaa !5
  %5043 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %15, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %5044 = extractelement <2 x i64> %5043, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([20 x i8], [20 x i8] addrspace(4)* @.str.1, i64 0, i64 0) to i8*), i8* null), label %5045, label %5049

5045:                                             ; preds = %5034
  %5046 = and i64 %5044, -225
  %5047 = or i64 %5046, 32
  %5048 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %15, i64 noundef %5047, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  br label %5490

5049:                                             ; preds = %5034
  %5050 = and i64 %5044, 2
  %5051 = and i64 %5044, -3
  %5052 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %5051, i64 0
  br label %5053

5053:                                             ; preds = %5479, %5049
  %5054 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([20 x i8], [20 x i8] addrspace(4)* @.str.1, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([20 x i8], [20 x i8] addrspace(4)* @.str.1, i64 0, i64 19) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([20 x i8]* addrspacecast ([20 x i8] addrspace(4)* @.str.1 to [20 x i8]*) to i64)), i64 1))), %5049 ], [ %5487, %5479 ]
  %5055 = phi i8 addrspace(4)* [ getelementptr inbounds ([20 x i8], [20 x i8] addrspace(4)* @.str.1, i64 0, i64 0), %5049 ], [ %5488, %5479 ]
  %5056 = phi <2 x i64> [ %5052, %5049 ], [ %5486, %5479 ]
  %5057 = icmp ugt i64 %5054, 56
  %5058 = extractelement <2 x i64> %5056, i64 0
  %5059 = or i64 %5058, %5050
  %5060 = insertelement <2 x i64> poison, i64 %5059, i64 0
  %5061 = select i1 %5057, <2 x i64> %5056, <2 x i64> %5060
  %5062 = tail call i64 @llvm.umin.i64(i64 %5054, i64 56)
  %5063 = trunc i64 %5062 to i32
  %5064 = extractelement <2 x i64> %5061, i64 0
  %5065 = icmp ugt i32 %5063, 7
  br i1 %5065, label %5068, label %5066

5066:                                             ; preds = %5053
  %5067 = icmp eq i32 %5063, 0
  br i1 %5067, label %5121, label %5108

5068:                                             ; preds = %5053
  %5069 = load i8, i8 addrspace(4)* %5055, align 1, !tbaa !14
  %5070 = zext i8 %5069 to i64
  %5071 = getelementptr inbounds i8, i8 addrspace(4)* %5055, i64 1
  %5072 = load i8, i8 addrspace(4)* %5071, align 1, !tbaa !14
  %5073 = zext i8 %5072 to i64
  %5074 = shl nuw nsw i64 %5073, 8
  %5075 = or i64 %5074, %5070
  %5076 = getelementptr inbounds i8, i8 addrspace(4)* %5055, i64 2
  %5077 = load i8, i8 addrspace(4)* %5076, align 1, !tbaa !14
  %5078 = zext i8 %5077 to i64
  %5079 = shl nuw nsw i64 %5078, 16
  %5080 = or i64 %5075, %5079
  %5081 = getelementptr inbounds i8, i8 addrspace(4)* %5055, i64 3
  %5082 = load i8, i8 addrspace(4)* %5081, align 1, !tbaa !14
  %5083 = zext i8 %5082 to i64
  %5084 = shl nuw nsw i64 %5083, 24
  %5085 = or i64 %5080, %5084
  %5086 = getelementptr inbounds i8, i8 addrspace(4)* %5055, i64 4
  %5087 = load i8, i8 addrspace(4)* %5086, align 1, !tbaa !14
  %5088 = zext i8 %5087 to i64
  %5089 = shl nuw nsw i64 %5088, 32
  %5090 = or i64 %5085, %5089
  %5091 = getelementptr inbounds i8, i8 addrspace(4)* %5055, i64 5
  %5092 = load i8, i8 addrspace(4)* %5091, align 1, !tbaa !14
  %5093 = zext i8 %5092 to i64
  %5094 = shl nuw nsw i64 %5093, 40
  %5095 = or i64 %5090, %5094
  %5096 = getelementptr inbounds i8, i8 addrspace(4)* %5055, i64 6
  %5097 = load i8, i8 addrspace(4)* %5096, align 1, !tbaa !14
  %5098 = zext i8 %5097 to i64
  %5099 = shl nuw nsw i64 %5098, 48
  %5100 = or i64 %5095, %5099
  %5101 = getelementptr inbounds i8, i8 addrspace(4)* %5055, i64 7
  %5102 = load i8, i8 addrspace(4)* %5101, align 1, !tbaa !14
  %5103 = zext i8 %5102 to i64
  %5104 = shl nuw i64 %5103, 56
  %5105 = or i64 %5100, %5104
  %5106 = add nsw i32 %5063, -8
  %5107 = getelementptr inbounds i8, i8 addrspace(4)* %5055, i64 8
  br label %5121

5108:                                             ; preds = %5066, %5108
  %5109 = phi i32 [ %5119, %5108 ], [ 0, %5066 ]
  %5110 = phi i64 [ %5118, %5108 ], [ 0, %5066 ]
  %5111 = zext i32 %5109 to i64
  %5112 = getelementptr inbounds i8, i8 addrspace(4)* %5055, i64 %5111
  %5113 = load i8, i8 addrspace(4)* %5112, align 1, !tbaa !14
  %5114 = zext i8 %5113 to i64
  %5115 = shl i32 %5109, 3
  %5116 = zext i32 %5115 to i64
  %5117 = shl nuw i64 %5114, %5116
  %5118 = or i64 %5117, %5110
  %5119 = add nuw nsw i32 %5109, 1
  %5120 = icmp eq i32 %5119, %5063
  br i1 %5120, label %5121, label %5108, !llvm.loop !15

5121:                                             ; preds = %5108, %5068, %5066
  %5122 = phi i8 addrspace(4)* [ %5107, %5068 ], [ %5055, %5066 ], [ %5055, %5108 ]
  %5123 = phi i32 [ %5106, %5068 ], [ 0, %5066 ], [ 0, %5108 ]
  %5124 = phi i64 [ %5105, %5068 ], [ 0, %5066 ], [ %5118, %5108 ]
  %5125 = icmp ugt i32 %5123, 7
  br i1 %5125, label %5128, label %5126

5126:                                             ; preds = %5121
  %5127 = icmp eq i32 %5123, 0
  br i1 %5127, label %5181, label %5168

5128:                                             ; preds = %5121
  %5129 = load i8, i8 addrspace(4)* %5122, align 1, !tbaa !14
  %5130 = zext i8 %5129 to i64
  %5131 = getelementptr inbounds i8, i8 addrspace(4)* %5122, i64 1
  %5132 = load i8, i8 addrspace(4)* %5131, align 1, !tbaa !14
  %5133 = zext i8 %5132 to i64
  %5134 = shl nuw nsw i64 %5133, 8
  %5135 = or i64 %5134, %5130
  %5136 = getelementptr inbounds i8, i8 addrspace(4)* %5122, i64 2
  %5137 = load i8, i8 addrspace(4)* %5136, align 1, !tbaa !14
  %5138 = zext i8 %5137 to i64
  %5139 = shl nuw nsw i64 %5138, 16
  %5140 = or i64 %5135, %5139
  %5141 = getelementptr inbounds i8, i8 addrspace(4)* %5122, i64 3
  %5142 = load i8, i8 addrspace(4)* %5141, align 1, !tbaa !14
  %5143 = zext i8 %5142 to i64
  %5144 = shl nuw nsw i64 %5143, 24
  %5145 = or i64 %5140, %5144
  %5146 = getelementptr inbounds i8, i8 addrspace(4)* %5122, i64 4
  %5147 = load i8, i8 addrspace(4)* %5146, align 1, !tbaa !14
  %5148 = zext i8 %5147 to i64
  %5149 = shl nuw nsw i64 %5148, 32
  %5150 = or i64 %5145, %5149
  %5151 = getelementptr inbounds i8, i8 addrspace(4)* %5122, i64 5
  %5152 = load i8, i8 addrspace(4)* %5151, align 1, !tbaa !14
  %5153 = zext i8 %5152 to i64
  %5154 = shl nuw nsw i64 %5153, 40
  %5155 = or i64 %5150, %5154
  %5156 = getelementptr inbounds i8, i8 addrspace(4)* %5122, i64 6
  %5157 = load i8, i8 addrspace(4)* %5156, align 1, !tbaa !14
  %5158 = zext i8 %5157 to i64
  %5159 = shl nuw nsw i64 %5158, 48
  %5160 = or i64 %5155, %5159
  %5161 = getelementptr inbounds i8, i8 addrspace(4)* %5122, i64 7
  %5162 = load i8, i8 addrspace(4)* %5161, align 1, !tbaa !14
  %5163 = zext i8 %5162 to i64
  %5164 = shl nuw i64 %5163, 56
  %5165 = or i64 %5160, %5164
  %5166 = add nsw i32 %5123, -8
  %5167 = getelementptr inbounds i8, i8 addrspace(4)* %5122, i64 8
  br label %5181

5168:                                             ; preds = %5126, %5168
  %5169 = phi i32 [ %5179, %5168 ], [ 0, %5126 ]
  %5170 = phi i64 [ %5178, %5168 ], [ 0, %5126 ]
  %5171 = zext i32 %5169 to i64
  %5172 = getelementptr inbounds i8, i8 addrspace(4)* %5122, i64 %5171
  %5173 = load i8, i8 addrspace(4)* %5172, align 1, !tbaa !14
  %5174 = zext i8 %5173 to i64
  %5175 = shl i32 %5169, 3
  %5176 = zext i32 %5175 to i64
  %5177 = shl nuw i64 %5174, %5176
  %5178 = or i64 %5177, %5170
  %5179 = add nuw nsw i32 %5169, 1
  %5180 = icmp eq i32 %5179, %5123
  br i1 %5180, label %5181, label %5168

5181:                                             ; preds = %5168, %5128, %5126
  %5182 = phi i8 addrspace(4)* [ %5167, %5128 ], [ %5122, %5126 ], [ %5122, %5168 ]
  %5183 = phi i32 [ %5166, %5128 ], [ 0, %5126 ], [ 0, %5168 ]
  %5184 = phi i64 [ %5165, %5128 ], [ 0, %5126 ], [ %5178, %5168 ]
  %5185 = icmp ugt i32 %5183, 7
  br i1 %5185, label %5188, label %5186

5186:                                             ; preds = %5181
  %5187 = icmp eq i32 %5183, 0
  br i1 %5187, label %5241, label %5228

5188:                                             ; preds = %5181
  %5189 = load i8, i8 addrspace(4)* %5182, align 1, !tbaa !14
  %5190 = zext i8 %5189 to i64
  %5191 = getelementptr inbounds i8, i8 addrspace(4)* %5182, i64 1
  %5192 = load i8, i8 addrspace(4)* %5191, align 1, !tbaa !14
  %5193 = zext i8 %5192 to i64
  %5194 = shl nuw nsw i64 %5193, 8
  %5195 = or i64 %5194, %5190
  %5196 = getelementptr inbounds i8, i8 addrspace(4)* %5182, i64 2
  %5197 = load i8, i8 addrspace(4)* %5196, align 1, !tbaa !14
  %5198 = zext i8 %5197 to i64
  %5199 = shl nuw nsw i64 %5198, 16
  %5200 = or i64 %5195, %5199
  %5201 = getelementptr inbounds i8, i8 addrspace(4)* %5182, i64 3
  %5202 = load i8, i8 addrspace(4)* %5201, align 1, !tbaa !14
  %5203 = zext i8 %5202 to i64
  %5204 = shl nuw nsw i64 %5203, 24
  %5205 = or i64 %5200, %5204
  %5206 = getelementptr inbounds i8, i8 addrspace(4)* %5182, i64 4
  %5207 = load i8, i8 addrspace(4)* %5206, align 1, !tbaa !14
  %5208 = zext i8 %5207 to i64
  %5209 = shl nuw nsw i64 %5208, 32
  %5210 = or i64 %5205, %5209
  %5211 = getelementptr inbounds i8, i8 addrspace(4)* %5182, i64 5
  %5212 = load i8, i8 addrspace(4)* %5211, align 1, !tbaa !14
  %5213 = zext i8 %5212 to i64
  %5214 = shl nuw nsw i64 %5213, 40
  %5215 = or i64 %5210, %5214
  %5216 = getelementptr inbounds i8, i8 addrspace(4)* %5182, i64 6
  %5217 = load i8, i8 addrspace(4)* %5216, align 1, !tbaa !14
  %5218 = zext i8 %5217 to i64
  %5219 = shl nuw nsw i64 %5218, 48
  %5220 = or i64 %5215, %5219
  %5221 = getelementptr inbounds i8, i8 addrspace(4)* %5182, i64 7
  %5222 = load i8, i8 addrspace(4)* %5221, align 1, !tbaa !14
  %5223 = zext i8 %5222 to i64
  %5224 = shl nuw i64 %5223, 56
  %5225 = or i64 %5220, %5224
  %5226 = add nsw i32 %5183, -8
  %5227 = getelementptr inbounds i8, i8 addrspace(4)* %5182, i64 8
  br label %5241

5228:                                             ; preds = %5186, %5228
  %5229 = phi i32 [ %5239, %5228 ], [ 0, %5186 ]
  %5230 = phi i64 [ %5238, %5228 ], [ 0, %5186 ]
  %5231 = zext i32 %5229 to i64
  %5232 = getelementptr inbounds i8, i8 addrspace(4)* %5182, i64 %5231
  %5233 = load i8, i8 addrspace(4)* %5232, align 1, !tbaa !14
  %5234 = zext i8 %5233 to i64
  %5235 = shl i32 %5229, 3
  %5236 = zext i32 %5235 to i64
  %5237 = shl nuw i64 %5234, %5236
  %5238 = or i64 %5237, %5230
  %5239 = add nuw nsw i32 %5229, 1
  %5240 = icmp eq i32 %5239, %5183
  br i1 %5240, label %5241, label %5228

5241:                                             ; preds = %5228, %5188, %5186
  %5242 = phi i8 addrspace(4)* [ %5227, %5188 ], [ %5182, %5186 ], [ %5182, %5228 ]
  %5243 = phi i32 [ %5226, %5188 ], [ 0, %5186 ], [ 0, %5228 ]
  %5244 = phi i64 [ %5225, %5188 ], [ 0, %5186 ], [ %5238, %5228 ]
  %5245 = icmp ugt i32 %5243, 7
  br i1 %5245, label %5248, label %5246

5246:                                             ; preds = %5241
  %5247 = icmp eq i32 %5243, 0
  br i1 %5247, label %5301, label %5288

5248:                                             ; preds = %5241
  %5249 = load i8, i8 addrspace(4)* %5242, align 1, !tbaa !14
  %5250 = zext i8 %5249 to i64
  %5251 = getelementptr inbounds i8, i8 addrspace(4)* %5242, i64 1
  %5252 = load i8, i8 addrspace(4)* %5251, align 1, !tbaa !14
  %5253 = zext i8 %5252 to i64
  %5254 = shl nuw nsw i64 %5253, 8
  %5255 = or i64 %5254, %5250
  %5256 = getelementptr inbounds i8, i8 addrspace(4)* %5242, i64 2
  %5257 = load i8, i8 addrspace(4)* %5256, align 1, !tbaa !14
  %5258 = zext i8 %5257 to i64
  %5259 = shl nuw nsw i64 %5258, 16
  %5260 = or i64 %5255, %5259
  %5261 = getelementptr inbounds i8, i8 addrspace(4)* %5242, i64 3
  %5262 = load i8, i8 addrspace(4)* %5261, align 1, !tbaa !14
  %5263 = zext i8 %5262 to i64
  %5264 = shl nuw nsw i64 %5263, 24
  %5265 = or i64 %5260, %5264
  %5266 = getelementptr inbounds i8, i8 addrspace(4)* %5242, i64 4
  %5267 = load i8, i8 addrspace(4)* %5266, align 1, !tbaa !14
  %5268 = zext i8 %5267 to i64
  %5269 = shl nuw nsw i64 %5268, 32
  %5270 = or i64 %5265, %5269
  %5271 = getelementptr inbounds i8, i8 addrspace(4)* %5242, i64 5
  %5272 = load i8, i8 addrspace(4)* %5271, align 1, !tbaa !14
  %5273 = zext i8 %5272 to i64
  %5274 = shl nuw nsw i64 %5273, 40
  %5275 = or i64 %5270, %5274
  %5276 = getelementptr inbounds i8, i8 addrspace(4)* %5242, i64 6
  %5277 = load i8, i8 addrspace(4)* %5276, align 1, !tbaa !14
  %5278 = zext i8 %5277 to i64
  %5279 = shl nuw nsw i64 %5278, 48
  %5280 = or i64 %5275, %5279
  %5281 = getelementptr inbounds i8, i8 addrspace(4)* %5242, i64 7
  %5282 = load i8, i8 addrspace(4)* %5281, align 1, !tbaa !14
  %5283 = zext i8 %5282 to i64
  %5284 = shl nuw i64 %5283, 56
  %5285 = or i64 %5280, %5284
  %5286 = add nsw i32 %5243, -8
  %5287 = getelementptr inbounds i8, i8 addrspace(4)* %5242, i64 8
  br label %5301

5288:                                             ; preds = %5246, %5288
  %5289 = phi i32 [ %5299, %5288 ], [ 0, %5246 ]
  %5290 = phi i64 [ %5298, %5288 ], [ 0, %5246 ]
  %5291 = zext i32 %5289 to i64
  %5292 = getelementptr inbounds i8, i8 addrspace(4)* %5242, i64 %5291
  %5293 = load i8, i8 addrspace(4)* %5292, align 1, !tbaa !14
  %5294 = zext i8 %5293 to i64
  %5295 = shl i32 %5289, 3
  %5296 = zext i32 %5295 to i64
  %5297 = shl nuw i64 %5294, %5296
  %5298 = or i64 %5297, %5290
  %5299 = add nuw nsw i32 %5289, 1
  %5300 = icmp eq i32 %5299, %5243
  br i1 %5300, label %5301, label %5288

5301:                                             ; preds = %5288, %5248, %5246
  %5302 = phi i8 addrspace(4)* [ %5287, %5248 ], [ %5242, %5246 ], [ %5242, %5288 ]
  %5303 = phi i32 [ %5286, %5248 ], [ 0, %5246 ], [ 0, %5288 ]
  %5304 = phi i64 [ %5285, %5248 ], [ 0, %5246 ], [ %5298, %5288 ]
  %5305 = icmp ugt i32 %5303, 7
  br i1 %5305, label %5308, label %5306

5306:                                             ; preds = %5301
  %5307 = icmp eq i32 %5303, 0
  br i1 %5307, label %5361, label %5348

5308:                                             ; preds = %5301
  %5309 = load i8, i8 addrspace(4)* %5302, align 1, !tbaa !14
  %5310 = zext i8 %5309 to i64
  %5311 = getelementptr inbounds i8, i8 addrspace(4)* %5302, i64 1
  %5312 = load i8, i8 addrspace(4)* %5311, align 1, !tbaa !14
  %5313 = zext i8 %5312 to i64
  %5314 = shl nuw nsw i64 %5313, 8
  %5315 = or i64 %5314, %5310
  %5316 = getelementptr inbounds i8, i8 addrspace(4)* %5302, i64 2
  %5317 = load i8, i8 addrspace(4)* %5316, align 1, !tbaa !14
  %5318 = zext i8 %5317 to i64
  %5319 = shl nuw nsw i64 %5318, 16
  %5320 = or i64 %5315, %5319
  %5321 = getelementptr inbounds i8, i8 addrspace(4)* %5302, i64 3
  %5322 = load i8, i8 addrspace(4)* %5321, align 1, !tbaa !14
  %5323 = zext i8 %5322 to i64
  %5324 = shl nuw nsw i64 %5323, 24
  %5325 = or i64 %5320, %5324
  %5326 = getelementptr inbounds i8, i8 addrspace(4)* %5302, i64 4
  %5327 = load i8, i8 addrspace(4)* %5326, align 1, !tbaa !14
  %5328 = zext i8 %5327 to i64
  %5329 = shl nuw nsw i64 %5328, 32
  %5330 = or i64 %5325, %5329
  %5331 = getelementptr inbounds i8, i8 addrspace(4)* %5302, i64 5
  %5332 = load i8, i8 addrspace(4)* %5331, align 1, !tbaa !14
  %5333 = zext i8 %5332 to i64
  %5334 = shl nuw nsw i64 %5333, 40
  %5335 = or i64 %5330, %5334
  %5336 = getelementptr inbounds i8, i8 addrspace(4)* %5302, i64 6
  %5337 = load i8, i8 addrspace(4)* %5336, align 1, !tbaa !14
  %5338 = zext i8 %5337 to i64
  %5339 = shl nuw nsw i64 %5338, 48
  %5340 = or i64 %5335, %5339
  %5341 = getelementptr inbounds i8, i8 addrspace(4)* %5302, i64 7
  %5342 = load i8, i8 addrspace(4)* %5341, align 1, !tbaa !14
  %5343 = zext i8 %5342 to i64
  %5344 = shl nuw i64 %5343, 56
  %5345 = or i64 %5340, %5344
  %5346 = add nsw i32 %5303, -8
  %5347 = getelementptr inbounds i8, i8 addrspace(4)* %5302, i64 8
  br label %5361

5348:                                             ; preds = %5306, %5348
  %5349 = phi i32 [ %5359, %5348 ], [ 0, %5306 ]
  %5350 = phi i64 [ %5358, %5348 ], [ 0, %5306 ]
  %5351 = zext i32 %5349 to i64
  %5352 = getelementptr inbounds i8, i8 addrspace(4)* %5302, i64 %5351
  %5353 = load i8, i8 addrspace(4)* %5352, align 1, !tbaa !14
  %5354 = zext i8 %5353 to i64
  %5355 = shl i32 %5349, 3
  %5356 = zext i32 %5355 to i64
  %5357 = shl nuw i64 %5354, %5356
  %5358 = or i64 %5357, %5350
  %5359 = add nuw nsw i32 %5349, 1
  %5360 = icmp eq i32 %5359, %5303
  br i1 %5360, label %5361, label %5348

5361:                                             ; preds = %5348, %5308, %5306
  %5362 = phi i8 addrspace(4)* [ %5347, %5308 ], [ %5302, %5306 ], [ %5302, %5348 ]
  %5363 = phi i32 [ %5346, %5308 ], [ 0, %5306 ], [ 0, %5348 ]
  %5364 = phi i64 [ %5345, %5308 ], [ 0, %5306 ], [ %5358, %5348 ]
  %5365 = icmp ugt i32 %5363, 7
  br i1 %5365, label %5368, label %5366

5366:                                             ; preds = %5361
  %5367 = icmp eq i32 %5363, 0
  br i1 %5367, label %5421, label %5408

5368:                                             ; preds = %5361
  %5369 = load i8, i8 addrspace(4)* %5362, align 1, !tbaa !14
  %5370 = zext i8 %5369 to i64
  %5371 = getelementptr inbounds i8, i8 addrspace(4)* %5362, i64 1
  %5372 = load i8, i8 addrspace(4)* %5371, align 1, !tbaa !14
  %5373 = zext i8 %5372 to i64
  %5374 = shl nuw nsw i64 %5373, 8
  %5375 = or i64 %5374, %5370
  %5376 = getelementptr inbounds i8, i8 addrspace(4)* %5362, i64 2
  %5377 = load i8, i8 addrspace(4)* %5376, align 1, !tbaa !14
  %5378 = zext i8 %5377 to i64
  %5379 = shl nuw nsw i64 %5378, 16
  %5380 = or i64 %5375, %5379
  %5381 = getelementptr inbounds i8, i8 addrspace(4)* %5362, i64 3
  %5382 = load i8, i8 addrspace(4)* %5381, align 1, !tbaa !14
  %5383 = zext i8 %5382 to i64
  %5384 = shl nuw nsw i64 %5383, 24
  %5385 = or i64 %5380, %5384
  %5386 = getelementptr inbounds i8, i8 addrspace(4)* %5362, i64 4
  %5387 = load i8, i8 addrspace(4)* %5386, align 1, !tbaa !14
  %5388 = zext i8 %5387 to i64
  %5389 = shl nuw nsw i64 %5388, 32
  %5390 = or i64 %5385, %5389
  %5391 = getelementptr inbounds i8, i8 addrspace(4)* %5362, i64 5
  %5392 = load i8, i8 addrspace(4)* %5391, align 1, !tbaa !14
  %5393 = zext i8 %5392 to i64
  %5394 = shl nuw nsw i64 %5393, 40
  %5395 = or i64 %5390, %5394
  %5396 = getelementptr inbounds i8, i8 addrspace(4)* %5362, i64 6
  %5397 = load i8, i8 addrspace(4)* %5396, align 1, !tbaa !14
  %5398 = zext i8 %5397 to i64
  %5399 = shl nuw nsw i64 %5398, 48
  %5400 = or i64 %5395, %5399
  %5401 = getelementptr inbounds i8, i8 addrspace(4)* %5362, i64 7
  %5402 = load i8, i8 addrspace(4)* %5401, align 1, !tbaa !14
  %5403 = zext i8 %5402 to i64
  %5404 = shl nuw i64 %5403, 56
  %5405 = or i64 %5400, %5404
  %5406 = add nsw i32 %5363, -8
  %5407 = getelementptr inbounds i8, i8 addrspace(4)* %5362, i64 8
  br label %5421

5408:                                             ; preds = %5366, %5408
  %5409 = phi i32 [ %5419, %5408 ], [ 0, %5366 ]
  %5410 = phi i64 [ %5418, %5408 ], [ 0, %5366 ]
  %5411 = zext i32 %5409 to i64
  %5412 = getelementptr inbounds i8, i8 addrspace(4)* %5362, i64 %5411
  %5413 = load i8, i8 addrspace(4)* %5412, align 1, !tbaa !14
  %5414 = zext i8 %5413 to i64
  %5415 = shl i32 %5409, 3
  %5416 = zext i32 %5415 to i64
  %5417 = shl nuw i64 %5414, %5416
  %5418 = or i64 %5417, %5410
  %5419 = add nuw nsw i32 %5409, 1
  %5420 = icmp eq i32 %5419, %5363
  br i1 %5420, label %5421, label %5408

5421:                                             ; preds = %5408, %5368, %5366
  %5422 = phi i8 addrspace(4)* [ %5407, %5368 ], [ %5362, %5366 ], [ %5362, %5408 ]
  %5423 = phi i32 [ %5406, %5368 ], [ 0, %5366 ], [ 0, %5408 ]
  %5424 = phi i64 [ %5405, %5368 ], [ 0, %5366 ], [ %5418, %5408 ]
  %5425 = icmp ugt i32 %5423, 7
  br i1 %5425, label %5428, label %5426

5426:                                             ; preds = %5421
  %5427 = icmp eq i32 %5423, 0
  br i1 %5427, label %5479, label %5466

5428:                                             ; preds = %5421
  %5429 = load i8, i8 addrspace(4)* %5422, align 1, !tbaa !14
  %5430 = zext i8 %5429 to i64
  %5431 = getelementptr inbounds i8, i8 addrspace(4)* %5422, i64 1
  %5432 = load i8, i8 addrspace(4)* %5431, align 1, !tbaa !14
  %5433 = zext i8 %5432 to i64
  %5434 = shl nuw nsw i64 %5433, 8
  %5435 = or i64 %5434, %5430
  %5436 = getelementptr inbounds i8, i8 addrspace(4)* %5422, i64 2
  %5437 = load i8, i8 addrspace(4)* %5436, align 1, !tbaa !14
  %5438 = zext i8 %5437 to i64
  %5439 = shl nuw nsw i64 %5438, 16
  %5440 = or i64 %5435, %5439
  %5441 = getelementptr inbounds i8, i8 addrspace(4)* %5422, i64 3
  %5442 = load i8, i8 addrspace(4)* %5441, align 1, !tbaa !14
  %5443 = zext i8 %5442 to i64
  %5444 = shl nuw nsw i64 %5443, 24
  %5445 = or i64 %5440, %5444
  %5446 = getelementptr inbounds i8, i8 addrspace(4)* %5422, i64 4
  %5447 = load i8, i8 addrspace(4)* %5446, align 1, !tbaa !14
  %5448 = zext i8 %5447 to i64
  %5449 = shl nuw nsw i64 %5448, 32
  %5450 = or i64 %5445, %5449
  %5451 = getelementptr inbounds i8, i8 addrspace(4)* %5422, i64 5
  %5452 = load i8, i8 addrspace(4)* %5451, align 1, !tbaa !14
  %5453 = zext i8 %5452 to i64
  %5454 = shl nuw nsw i64 %5453, 40
  %5455 = or i64 %5450, %5454
  %5456 = getelementptr inbounds i8, i8 addrspace(4)* %5422, i64 6
  %5457 = load i8, i8 addrspace(4)* %5456, align 1, !tbaa !14
  %5458 = zext i8 %5457 to i64
  %5459 = shl nuw nsw i64 %5458, 48
  %5460 = or i64 %5455, %5459
  %5461 = getelementptr inbounds i8, i8 addrspace(4)* %5422, i64 7
  %5462 = load i8, i8 addrspace(4)* %5461, align 1, !tbaa !14
  %5463 = zext i8 %5462 to i64
  %5464 = shl nuw i64 %5463, 56
  %5465 = or i64 %5460, %5464
  br label %5479

5466:                                             ; preds = %5426, %5466
  %5467 = phi i32 [ %5477, %5466 ], [ 0, %5426 ]
  %5468 = phi i64 [ %5476, %5466 ], [ 0, %5426 ]
  %5469 = zext i32 %5467 to i64
  %5470 = getelementptr inbounds i8, i8 addrspace(4)* %5422, i64 %5469
  %5471 = load i8, i8 addrspace(4)* %5470, align 1, !tbaa !14
  %5472 = zext i8 %5471 to i64
  %5473 = shl i32 %5467, 3
  %5474 = zext i32 %5473 to i64
  %5475 = shl nuw i64 %5472, %5474
  %5476 = or i64 %5475, %5468
  %5477 = add nuw nsw i32 %5467, 1
  %5478 = icmp eq i32 %5477, %5423
  br i1 %5478, label %5479, label %5466

5479:                                             ; preds = %5466, %5428, %5426
  %5480 = phi i64 [ %5465, %5428 ], [ 0, %5426 ], [ %5476, %5466 ]
  %5481 = shl nuw nsw i64 %5062, 2
  %5482 = add nuw nsw i64 %5481, 28
  %5483 = and i64 %5482, 480
  %5484 = and i64 %5064, -225
  %5485 = or i64 %5484, %5483
  %5486 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %15, i64 noundef %5485, i64 noundef %5124, i64 noundef %5184, i64 noundef %5244, i64 noundef %5304, i64 noundef %5364, i64 noundef %5424, i64 noundef %5480) #11
  %5487 = sub i64 %5054, %5062
  %5488 = getelementptr inbounds i8, i8 addrspace(4)* %5055, i64 %5062
  %5489 = icmp eq i64 %5487, 0
  br i1 %5489, label %5490, label %5053

5490:                                             ; preds = %5479, %5045
  %5491 = phi <2 x i64> [ %5048, %5045 ], [ %5486, %5479 ]
  %5492 = extractelement <2 x i64> %5491, i64 0
  %5493 = and i64 %5492, -227
  %5494 = or i64 %5493, 34
  %5495 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %15, i64 noundef %5494, i64 noundef 1, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  store i32 0, i32 addrspace(3)* %7, align 4, !tbaa !5
  %5496 = icmp eq i32 %3, 2
  br i1 %5496, label %5497, label %8239

5497:                                             ; preds = %18, %5490
  %5498 = phi i8 addrspace(4)* [ %19, %18 ], [ %9, %5490 ]
  %5499 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 2
  store i32 1, i32 addrspace(1)* %5499, align 4, !tbaa !5
  %5500 = getelementptr inbounds i8, i8 addrspace(4)* %5498, i64 24
  %5501 = bitcast i8 addrspace(4)* %5500 to i64 addrspace(4)*
  %5502 = load i64, i64 addrspace(4)* %5501, align 8, !tbaa !10
  %5503 = inttoptr i64 %5502 to i8 addrspace(1)*
  %5504 = addrspacecast i8 addrspace(1)* %5503 to i8*
  %5505 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %5504, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %5506 = extractelement <2 x i64> %5505, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([21 x i8], [21 x i8] addrspace(4)* @.str.3, i64 0, i64 0) to i8*), i8* null), label %5507, label %5511

5507:                                             ; preds = %5497
  %5508 = and i64 %5506, -225
  %5509 = or i64 %5508, 32
  %5510 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %5504, i64 noundef %5509, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  br label %5952

5511:                                             ; preds = %5497
  %5512 = and i64 %5506, 2
  %5513 = and i64 %5506, -3
  %5514 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %5513, i64 0
  br label %5515

5515:                                             ; preds = %5941, %5511
  %5516 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([21 x i8], [21 x i8] addrspace(4)* @.str.3, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([21 x i8], [21 x i8] addrspace(4)* @.str.3, i64 0, i64 20) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([21 x i8]* addrspacecast ([21 x i8] addrspace(4)* @.str.3 to [21 x i8]*) to i64)), i64 1))), %5511 ], [ %5949, %5941 ]
  %5517 = phi i8 addrspace(4)* [ getelementptr inbounds ([21 x i8], [21 x i8] addrspace(4)* @.str.3, i64 0, i64 0), %5511 ], [ %5950, %5941 ]
  %5518 = phi <2 x i64> [ %5514, %5511 ], [ %5948, %5941 ]
  %5519 = icmp ugt i64 %5516, 56
  %5520 = extractelement <2 x i64> %5518, i64 0
  %5521 = or i64 %5520, %5512
  %5522 = insertelement <2 x i64> poison, i64 %5521, i64 0
  %5523 = select i1 %5519, <2 x i64> %5518, <2 x i64> %5522
  %5524 = tail call i64 @llvm.umin.i64(i64 %5516, i64 56)
  %5525 = trunc i64 %5524 to i32
  %5526 = extractelement <2 x i64> %5523, i64 0
  %5527 = icmp ugt i32 %5525, 7
  br i1 %5527, label %5530, label %5528

5528:                                             ; preds = %5515
  %5529 = icmp eq i32 %5525, 0
  br i1 %5529, label %5583, label %5570

5530:                                             ; preds = %5515
  %5531 = load i8, i8 addrspace(4)* %5517, align 1, !tbaa !14
  %5532 = zext i8 %5531 to i64
  %5533 = getelementptr inbounds i8, i8 addrspace(4)* %5517, i64 1
  %5534 = load i8, i8 addrspace(4)* %5533, align 1, !tbaa !14
  %5535 = zext i8 %5534 to i64
  %5536 = shl nuw nsw i64 %5535, 8
  %5537 = or i64 %5536, %5532
  %5538 = getelementptr inbounds i8, i8 addrspace(4)* %5517, i64 2
  %5539 = load i8, i8 addrspace(4)* %5538, align 1, !tbaa !14
  %5540 = zext i8 %5539 to i64
  %5541 = shl nuw nsw i64 %5540, 16
  %5542 = or i64 %5537, %5541
  %5543 = getelementptr inbounds i8, i8 addrspace(4)* %5517, i64 3
  %5544 = load i8, i8 addrspace(4)* %5543, align 1, !tbaa !14
  %5545 = zext i8 %5544 to i64
  %5546 = shl nuw nsw i64 %5545, 24
  %5547 = or i64 %5542, %5546
  %5548 = getelementptr inbounds i8, i8 addrspace(4)* %5517, i64 4
  %5549 = load i8, i8 addrspace(4)* %5548, align 1, !tbaa !14
  %5550 = zext i8 %5549 to i64
  %5551 = shl nuw nsw i64 %5550, 32
  %5552 = or i64 %5547, %5551
  %5553 = getelementptr inbounds i8, i8 addrspace(4)* %5517, i64 5
  %5554 = load i8, i8 addrspace(4)* %5553, align 1, !tbaa !14
  %5555 = zext i8 %5554 to i64
  %5556 = shl nuw nsw i64 %5555, 40
  %5557 = or i64 %5552, %5556
  %5558 = getelementptr inbounds i8, i8 addrspace(4)* %5517, i64 6
  %5559 = load i8, i8 addrspace(4)* %5558, align 1, !tbaa !14
  %5560 = zext i8 %5559 to i64
  %5561 = shl nuw nsw i64 %5560, 48
  %5562 = or i64 %5557, %5561
  %5563 = getelementptr inbounds i8, i8 addrspace(4)* %5517, i64 7
  %5564 = load i8, i8 addrspace(4)* %5563, align 1, !tbaa !14
  %5565 = zext i8 %5564 to i64
  %5566 = shl nuw i64 %5565, 56
  %5567 = or i64 %5562, %5566
  %5568 = add nsw i32 %5525, -8
  %5569 = getelementptr inbounds i8, i8 addrspace(4)* %5517, i64 8
  br label %5583

5570:                                             ; preds = %5528, %5570
  %5571 = phi i32 [ %5581, %5570 ], [ 0, %5528 ]
  %5572 = phi i64 [ %5580, %5570 ], [ 0, %5528 ]
  %5573 = zext i32 %5571 to i64
  %5574 = getelementptr inbounds i8, i8 addrspace(4)* %5517, i64 %5573
  %5575 = load i8, i8 addrspace(4)* %5574, align 1, !tbaa !14
  %5576 = zext i8 %5575 to i64
  %5577 = shl i32 %5571, 3
  %5578 = zext i32 %5577 to i64
  %5579 = shl nuw i64 %5576, %5578
  %5580 = or i64 %5579, %5572
  %5581 = add nuw nsw i32 %5571, 1
  %5582 = icmp eq i32 %5581, %5525
  br i1 %5582, label %5583, label %5570, !llvm.loop !15

5583:                                             ; preds = %5570, %5530, %5528
  %5584 = phi i8 addrspace(4)* [ %5569, %5530 ], [ %5517, %5528 ], [ %5517, %5570 ]
  %5585 = phi i32 [ %5568, %5530 ], [ 0, %5528 ], [ 0, %5570 ]
  %5586 = phi i64 [ %5567, %5530 ], [ 0, %5528 ], [ %5580, %5570 ]
  %5587 = icmp ugt i32 %5585, 7
  br i1 %5587, label %5590, label %5588

5588:                                             ; preds = %5583
  %5589 = icmp eq i32 %5585, 0
  br i1 %5589, label %5643, label %5630

5590:                                             ; preds = %5583
  %5591 = load i8, i8 addrspace(4)* %5584, align 1, !tbaa !14
  %5592 = zext i8 %5591 to i64
  %5593 = getelementptr inbounds i8, i8 addrspace(4)* %5584, i64 1
  %5594 = load i8, i8 addrspace(4)* %5593, align 1, !tbaa !14
  %5595 = zext i8 %5594 to i64
  %5596 = shl nuw nsw i64 %5595, 8
  %5597 = or i64 %5596, %5592
  %5598 = getelementptr inbounds i8, i8 addrspace(4)* %5584, i64 2
  %5599 = load i8, i8 addrspace(4)* %5598, align 1, !tbaa !14
  %5600 = zext i8 %5599 to i64
  %5601 = shl nuw nsw i64 %5600, 16
  %5602 = or i64 %5597, %5601
  %5603 = getelementptr inbounds i8, i8 addrspace(4)* %5584, i64 3
  %5604 = load i8, i8 addrspace(4)* %5603, align 1, !tbaa !14
  %5605 = zext i8 %5604 to i64
  %5606 = shl nuw nsw i64 %5605, 24
  %5607 = or i64 %5602, %5606
  %5608 = getelementptr inbounds i8, i8 addrspace(4)* %5584, i64 4
  %5609 = load i8, i8 addrspace(4)* %5608, align 1, !tbaa !14
  %5610 = zext i8 %5609 to i64
  %5611 = shl nuw nsw i64 %5610, 32
  %5612 = or i64 %5607, %5611
  %5613 = getelementptr inbounds i8, i8 addrspace(4)* %5584, i64 5
  %5614 = load i8, i8 addrspace(4)* %5613, align 1, !tbaa !14
  %5615 = zext i8 %5614 to i64
  %5616 = shl nuw nsw i64 %5615, 40
  %5617 = or i64 %5612, %5616
  %5618 = getelementptr inbounds i8, i8 addrspace(4)* %5584, i64 6
  %5619 = load i8, i8 addrspace(4)* %5618, align 1, !tbaa !14
  %5620 = zext i8 %5619 to i64
  %5621 = shl nuw nsw i64 %5620, 48
  %5622 = or i64 %5617, %5621
  %5623 = getelementptr inbounds i8, i8 addrspace(4)* %5584, i64 7
  %5624 = load i8, i8 addrspace(4)* %5623, align 1, !tbaa !14
  %5625 = zext i8 %5624 to i64
  %5626 = shl nuw i64 %5625, 56
  %5627 = or i64 %5622, %5626
  %5628 = add nsw i32 %5585, -8
  %5629 = getelementptr inbounds i8, i8 addrspace(4)* %5584, i64 8
  br label %5643

5630:                                             ; preds = %5588, %5630
  %5631 = phi i32 [ %5641, %5630 ], [ 0, %5588 ]
  %5632 = phi i64 [ %5640, %5630 ], [ 0, %5588 ]
  %5633 = zext i32 %5631 to i64
  %5634 = getelementptr inbounds i8, i8 addrspace(4)* %5584, i64 %5633
  %5635 = load i8, i8 addrspace(4)* %5634, align 1, !tbaa !14
  %5636 = zext i8 %5635 to i64
  %5637 = shl i32 %5631, 3
  %5638 = zext i32 %5637 to i64
  %5639 = shl nuw i64 %5636, %5638
  %5640 = or i64 %5639, %5632
  %5641 = add nuw nsw i32 %5631, 1
  %5642 = icmp eq i32 %5641, %5585
  br i1 %5642, label %5643, label %5630

5643:                                             ; preds = %5630, %5590, %5588
  %5644 = phi i8 addrspace(4)* [ %5629, %5590 ], [ %5584, %5588 ], [ %5584, %5630 ]
  %5645 = phi i32 [ %5628, %5590 ], [ 0, %5588 ], [ 0, %5630 ]
  %5646 = phi i64 [ %5627, %5590 ], [ 0, %5588 ], [ %5640, %5630 ]
  %5647 = icmp ugt i32 %5645, 7
  br i1 %5647, label %5650, label %5648

5648:                                             ; preds = %5643
  %5649 = icmp eq i32 %5645, 0
  br i1 %5649, label %5703, label %5690

5650:                                             ; preds = %5643
  %5651 = load i8, i8 addrspace(4)* %5644, align 1, !tbaa !14
  %5652 = zext i8 %5651 to i64
  %5653 = getelementptr inbounds i8, i8 addrspace(4)* %5644, i64 1
  %5654 = load i8, i8 addrspace(4)* %5653, align 1, !tbaa !14
  %5655 = zext i8 %5654 to i64
  %5656 = shl nuw nsw i64 %5655, 8
  %5657 = or i64 %5656, %5652
  %5658 = getelementptr inbounds i8, i8 addrspace(4)* %5644, i64 2
  %5659 = load i8, i8 addrspace(4)* %5658, align 1, !tbaa !14
  %5660 = zext i8 %5659 to i64
  %5661 = shl nuw nsw i64 %5660, 16
  %5662 = or i64 %5657, %5661
  %5663 = getelementptr inbounds i8, i8 addrspace(4)* %5644, i64 3
  %5664 = load i8, i8 addrspace(4)* %5663, align 1, !tbaa !14
  %5665 = zext i8 %5664 to i64
  %5666 = shl nuw nsw i64 %5665, 24
  %5667 = or i64 %5662, %5666
  %5668 = getelementptr inbounds i8, i8 addrspace(4)* %5644, i64 4
  %5669 = load i8, i8 addrspace(4)* %5668, align 1, !tbaa !14
  %5670 = zext i8 %5669 to i64
  %5671 = shl nuw nsw i64 %5670, 32
  %5672 = or i64 %5667, %5671
  %5673 = getelementptr inbounds i8, i8 addrspace(4)* %5644, i64 5
  %5674 = load i8, i8 addrspace(4)* %5673, align 1, !tbaa !14
  %5675 = zext i8 %5674 to i64
  %5676 = shl nuw nsw i64 %5675, 40
  %5677 = or i64 %5672, %5676
  %5678 = getelementptr inbounds i8, i8 addrspace(4)* %5644, i64 6
  %5679 = load i8, i8 addrspace(4)* %5678, align 1, !tbaa !14
  %5680 = zext i8 %5679 to i64
  %5681 = shl nuw nsw i64 %5680, 48
  %5682 = or i64 %5677, %5681
  %5683 = getelementptr inbounds i8, i8 addrspace(4)* %5644, i64 7
  %5684 = load i8, i8 addrspace(4)* %5683, align 1, !tbaa !14
  %5685 = zext i8 %5684 to i64
  %5686 = shl nuw i64 %5685, 56
  %5687 = or i64 %5682, %5686
  %5688 = add nsw i32 %5645, -8
  %5689 = getelementptr inbounds i8, i8 addrspace(4)* %5644, i64 8
  br label %5703

5690:                                             ; preds = %5648, %5690
  %5691 = phi i32 [ %5701, %5690 ], [ 0, %5648 ]
  %5692 = phi i64 [ %5700, %5690 ], [ 0, %5648 ]
  %5693 = zext i32 %5691 to i64
  %5694 = getelementptr inbounds i8, i8 addrspace(4)* %5644, i64 %5693
  %5695 = load i8, i8 addrspace(4)* %5694, align 1, !tbaa !14
  %5696 = zext i8 %5695 to i64
  %5697 = shl i32 %5691, 3
  %5698 = zext i32 %5697 to i64
  %5699 = shl nuw i64 %5696, %5698
  %5700 = or i64 %5699, %5692
  %5701 = add nuw nsw i32 %5691, 1
  %5702 = icmp eq i32 %5701, %5645
  br i1 %5702, label %5703, label %5690

5703:                                             ; preds = %5690, %5650, %5648
  %5704 = phi i8 addrspace(4)* [ %5689, %5650 ], [ %5644, %5648 ], [ %5644, %5690 ]
  %5705 = phi i32 [ %5688, %5650 ], [ 0, %5648 ], [ 0, %5690 ]
  %5706 = phi i64 [ %5687, %5650 ], [ 0, %5648 ], [ %5700, %5690 ]
  %5707 = icmp ugt i32 %5705, 7
  br i1 %5707, label %5710, label %5708

5708:                                             ; preds = %5703
  %5709 = icmp eq i32 %5705, 0
  br i1 %5709, label %5763, label %5750

5710:                                             ; preds = %5703
  %5711 = load i8, i8 addrspace(4)* %5704, align 1, !tbaa !14
  %5712 = zext i8 %5711 to i64
  %5713 = getelementptr inbounds i8, i8 addrspace(4)* %5704, i64 1
  %5714 = load i8, i8 addrspace(4)* %5713, align 1, !tbaa !14
  %5715 = zext i8 %5714 to i64
  %5716 = shl nuw nsw i64 %5715, 8
  %5717 = or i64 %5716, %5712
  %5718 = getelementptr inbounds i8, i8 addrspace(4)* %5704, i64 2
  %5719 = load i8, i8 addrspace(4)* %5718, align 1, !tbaa !14
  %5720 = zext i8 %5719 to i64
  %5721 = shl nuw nsw i64 %5720, 16
  %5722 = or i64 %5717, %5721
  %5723 = getelementptr inbounds i8, i8 addrspace(4)* %5704, i64 3
  %5724 = load i8, i8 addrspace(4)* %5723, align 1, !tbaa !14
  %5725 = zext i8 %5724 to i64
  %5726 = shl nuw nsw i64 %5725, 24
  %5727 = or i64 %5722, %5726
  %5728 = getelementptr inbounds i8, i8 addrspace(4)* %5704, i64 4
  %5729 = load i8, i8 addrspace(4)* %5728, align 1, !tbaa !14
  %5730 = zext i8 %5729 to i64
  %5731 = shl nuw nsw i64 %5730, 32
  %5732 = or i64 %5727, %5731
  %5733 = getelementptr inbounds i8, i8 addrspace(4)* %5704, i64 5
  %5734 = load i8, i8 addrspace(4)* %5733, align 1, !tbaa !14
  %5735 = zext i8 %5734 to i64
  %5736 = shl nuw nsw i64 %5735, 40
  %5737 = or i64 %5732, %5736
  %5738 = getelementptr inbounds i8, i8 addrspace(4)* %5704, i64 6
  %5739 = load i8, i8 addrspace(4)* %5738, align 1, !tbaa !14
  %5740 = zext i8 %5739 to i64
  %5741 = shl nuw nsw i64 %5740, 48
  %5742 = or i64 %5737, %5741
  %5743 = getelementptr inbounds i8, i8 addrspace(4)* %5704, i64 7
  %5744 = load i8, i8 addrspace(4)* %5743, align 1, !tbaa !14
  %5745 = zext i8 %5744 to i64
  %5746 = shl nuw i64 %5745, 56
  %5747 = or i64 %5742, %5746
  %5748 = add nsw i32 %5705, -8
  %5749 = getelementptr inbounds i8, i8 addrspace(4)* %5704, i64 8
  br label %5763

5750:                                             ; preds = %5708, %5750
  %5751 = phi i32 [ %5761, %5750 ], [ 0, %5708 ]
  %5752 = phi i64 [ %5760, %5750 ], [ 0, %5708 ]
  %5753 = zext i32 %5751 to i64
  %5754 = getelementptr inbounds i8, i8 addrspace(4)* %5704, i64 %5753
  %5755 = load i8, i8 addrspace(4)* %5754, align 1, !tbaa !14
  %5756 = zext i8 %5755 to i64
  %5757 = shl i32 %5751, 3
  %5758 = zext i32 %5757 to i64
  %5759 = shl nuw i64 %5756, %5758
  %5760 = or i64 %5759, %5752
  %5761 = add nuw nsw i32 %5751, 1
  %5762 = icmp eq i32 %5761, %5705
  br i1 %5762, label %5763, label %5750

5763:                                             ; preds = %5750, %5710, %5708
  %5764 = phi i8 addrspace(4)* [ %5749, %5710 ], [ %5704, %5708 ], [ %5704, %5750 ]
  %5765 = phi i32 [ %5748, %5710 ], [ 0, %5708 ], [ 0, %5750 ]
  %5766 = phi i64 [ %5747, %5710 ], [ 0, %5708 ], [ %5760, %5750 ]
  %5767 = icmp ugt i32 %5765, 7
  br i1 %5767, label %5770, label %5768

5768:                                             ; preds = %5763
  %5769 = icmp eq i32 %5765, 0
  br i1 %5769, label %5823, label %5810

5770:                                             ; preds = %5763
  %5771 = load i8, i8 addrspace(4)* %5764, align 1, !tbaa !14
  %5772 = zext i8 %5771 to i64
  %5773 = getelementptr inbounds i8, i8 addrspace(4)* %5764, i64 1
  %5774 = load i8, i8 addrspace(4)* %5773, align 1, !tbaa !14
  %5775 = zext i8 %5774 to i64
  %5776 = shl nuw nsw i64 %5775, 8
  %5777 = or i64 %5776, %5772
  %5778 = getelementptr inbounds i8, i8 addrspace(4)* %5764, i64 2
  %5779 = load i8, i8 addrspace(4)* %5778, align 1, !tbaa !14
  %5780 = zext i8 %5779 to i64
  %5781 = shl nuw nsw i64 %5780, 16
  %5782 = or i64 %5777, %5781
  %5783 = getelementptr inbounds i8, i8 addrspace(4)* %5764, i64 3
  %5784 = load i8, i8 addrspace(4)* %5783, align 1, !tbaa !14
  %5785 = zext i8 %5784 to i64
  %5786 = shl nuw nsw i64 %5785, 24
  %5787 = or i64 %5782, %5786
  %5788 = getelementptr inbounds i8, i8 addrspace(4)* %5764, i64 4
  %5789 = load i8, i8 addrspace(4)* %5788, align 1, !tbaa !14
  %5790 = zext i8 %5789 to i64
  %5791 = shl nuw nsw i64 %5790, 32
  %5792 = or i64 %5787, %5791
  %5793 = getelementptr inbounds i8, i8 addrspace(4)* %5764, i64 5
  %5794 = load i8, i8 addrspace(4)* %5793, align 1, !tbaa !14
  %5795 = zext i8 %5794 to i64
  %5796 = shl nuw nsw i64 %5795, 40
  %5797 = or i64 %5792, %5796
  %5798 = getelementptr inbounds i8, i8 addrspace(4)* %5764, i64 6
  %5799 = load i8, i8 addrspace(4)* %5798, align 1, !tbaa !14
  %5800 = zext i8 %5799 to i64
  %5801 = shl nuw nsw i64 %5800, 48
  %5802 = or i64 %5797, %5801
  %5803 = getelementptr inbounds i8, i8 addrspace(4)* %5764, i64 7
  %5804 = load i8, i8 addrspace(4)* %5803, align 1, !tbaa !14
  %5805 = zext i8 %5804 to i64
  %5806 = shl nuw i64 %5805, 56
  %5807 = or i64 %5802, %5806
  %5808 = add nsw i32 %5765, -8
  %5809 = getelementptr inbounds i8, i8 addrspace(4)* %5764, i64 8
  br label %5823

5810:                                             ; preds = %5768, %5810
  %5811 = phi i32 [ %5821, %5810 ], [ 0, %5768 ]
  %5812 = phi i64 [ %5820, %5810 ], [ 0, %5768 ]
  %5813 = zext i32 %5811 to i64
  %5814 = getelementptr inbounds i8, i8 addrspace(4)* %5764, i64 %5813
  %5815 = load i8, i8 addrspace(4)* %5814, align 1, !tbaa !14
  %5816 = zext i8 %5815 to i64
  %5817 = shl i32 %5811, 3
  %5818 = zext i32 %5817 to i64
  %5819 = shl nuw i64 %5816, %5818
  %5820 = or i64 %5819, %5812
  %5821 = add nuw nsw i32 %5811, 1
  %5822 = icmp eq i32 %5821, %5765
  br i1 %5822, label %5823, label %5810

5823:                                             ; preds = %5810, %5770, %5768
  %5824 = phi i8 addrspace(4)* [ %5809, %5770 ], [ %5764, %5768 ], [ %5764, %5810 ]
  %5825 = phi i32 [ %5808, %5770 ], [ 0, %5768 ], [ 0, %5810 ]
  %5826 = phi i64 [ %5807, %5770 ], [ 0, %5768 ], [ %5820, %5810 ]
  %5827 = icmp ugt i32 %5825, 7
  br i1 %5827, label %5830, label %5828

5828:                                             ; preds = %5823
  %5829 = icmp eq i32 %5825, 0
  br i1 %5829, label %5883, label %5870

5830:                                             ; preds = %5823
  %5831 = load i8, i8 addrspace(4)* %5824, align 1, !tbaa !14
  %5832 = zext i8 %5831 to i64
  %5833 = getelementptr inbounds i8, i8 addrspace(4)* %5824, i64 1
  %5834 = load i8, i8 addrspace(4)* %5833, align 1, !tbaa !14
  %5835 = zext i8 %5834 to i64
  %5836 = shl nuw nsw i64 %5835, 8
  %5837 = or i64 %5836, %5832
  %5838 = getelementptr inbounds i8, i8 addrspace(4)* %5824, i64 2
  %5839 = load i8, i8 addrspace(4)* %5838, align 1, !tbaa !14
  %5840 = zext i8 %5839 to i64
  %5841 = shl nuw nsw i64 %5840, 16
  %5842 = or i64 %5837, %5841
  %5843 = getelementptr inbounds i8, i8 addrspace(4)* %5824, i64 3
  %5844 = load i8, i8 addrspace(4)* %5843, align 1, !tbaa !14
  %5845 = zext i8 %5844 to i64
  %5846 = shl nuw nsw i64 %5845, 24
  %5847 = or i64 %5842, %5846
  %5848 = getelementptr inbounds i8, i8 addrspace(4)* %5824, i64 4
  %5849 = load i8, i8 addrspace(4)* %5848, align 1, !tbaa !14
  %5850 = zext i8 %5849 to i64
  %5851 = shl nuw nsw i64 %5850, 32
  %5852 = or i64 %5847, %5851
  %5853 = getelementptr inbounds i8, i8 addrspace(4)* %5824, i64 5
  %5854 = load i8, i8 addrspace(4)* %5853, align 1, !tbaa !14
  %5855 = zext i8 %5854 to i64
  %5856 = shl nuw nsw i64 %5855, 40
  %5857 = or i64 %5852, %5856
  %5858 = getelementptr inbounds i8, i8 addrspace(4)* %5824, i64 6
  %5859 = load i8, i8 addrspace(4)* %5858, align 1, !tbaa !14
  %5860 = zext i8 %5859 to i64
  %5861 = shl nuw nsw i64 %5860, 48
  %5862 = or i64 %5857, %5861
  %5863 = getelementptr inbounds i8, i8 addrspace(4)* %5824, i64 7
  %5864 = load i8, i8 addrspace(4)* %5863, align 1, !tbaa !14
  %5865 = zext i8 %5864 to i64
  %5866 = shl nuw i64 %5865, 56
  %5867 = or i64 %5862, %5866
  %5868 = add nsw i32 %5825, -8
  %5869 = getelementptr inbounds i8, i8 addrspace(4)* %5824, i64 8
  br label %5883

5870:                                             ; preds = %5828, %5870
  %5871 = phi i32 [ %5881, %5870 ], [ 0, %5828 ]
  %5872 = phi i64 [ %5880, %5870 ], [ 0, %5828 ]
  %5873 = zext i32 %5871 to i64
  %5874 = getelementptr inbounds i8, i8 addrspace(4)* %5824, i64 %5873
  %5875 = load i8, i8 addrspace(4)* %5874, align 1, !tbaa !14
  %5876 = zext i8 %5875 to i64
  %5877 = shl i32 %5871, 3
  %5878 = zext i32 %5877 to i64
  %5879 = shl nuw i64 %5876, %5878
  %5880 = or i64 %5879, %5872
  %5881 = add nuw nsw i32 %5871, 1
  %5882 = icmp eq i32 %5881, %5825
  br i1 %5882, label %5883, label %5870

5883:                                             ; preds = %5870, %5830, %5828
  %5884 = phi i8 addrspace(4)* [ %5869, %5830 ], [ %5824, %5828 ], [ %5824, %5870 ]
  %5885 = phi i32 [ %5868, %5830 ], [ 0, %5828 ], [ 0, %5870 ]
  %5886 = phi i64 [ %5867, %5830 ], [ 0, %5828 ], [ %5880, %5870 ]
  %5887 = icmp ugt i32 %5885, 7
  br i1 %5887, label %5890, label %5888

5888:                                             ; preds = %5883
  %5889 = icmp eq i32 %5885, 0
  br i1 %5889, label %5941, label %5928

5890:                                             ; preds = %5883
  %5891 = load i8, i8 addrspace(4)* %5884, align 1, !tbaa !14
  %5892 = zext i8 %5891 to i64
  %5893 = getelementptr inbounds i8, i8 addrspace(4)* %5884, i64 1
  %5894 = load i8, i8 addrspace(4)* %5893, align 1, !tbaa !14
  %5895 = zext i8 %5894 to i64
  %5896 = shl nuw nsw i64 %5895, 8
  %5897 = or i64 %5896, %5892
  %5898 = getelementptr inbounds i8, i8 addrspace(4)* %5884, i64 2
  %5899 = load i8, i8 addrspace(4)* %5898, align 1, !tbaa !14
  %5900 = zext i8 %5899 to i64
  %5901 = shl nuw nsw i64 %5900, 16
  %5902 = or i64 %5897, %5901
  %5903 = getelementptr inbounds i8, i8 addrspace(4)* %5884, i64 3
  %5904 = load i8, i8 addrspace(4)* %5903, align 1, !tbaa !14
  %5905 = zext i8 %5904 to i64
  %5906 = shl nuw nsw i64 %5905, 24
  %5907 = or i64 %5902, %5906
  %5908 = getelementptr inbounds i8, i8 addrspace(4)* %5884, i64 4
  %5909 = load i8, i8 addrspace(4)* %5908, align 1, !tbaa !14
  %5910 = zext i8 %5909 to i64
  %5911 = shl nuw nsw i64 %5910, 32
  %5912 = or i64 %5907, %5911
  %5913 = getelementptr inbounds i8, i8 addrspace(4)* %5884, i64 5
  %5914 = load i8, i8 addrspace(4)* %5913, align 1, !tbaa !14
  %5915 = zext i8 %5914 to i64
  %5916 = shl nuw nsw i64 %5915, 40
  %5917 = or i64 %5912, %5916
  %5918 = getelementptr inbounds i8, i8 addrspace(4)* %5884, i64 6
  %5919 = load i8, i8 addrspace(4)* %5918, align 1, !tbaa !14
  %5920 = zext i8 %5919 to i64
  %5921 = shl nuw nsw i64 %5920, 48
  %5922 = or i64 %5917, %5921
  %5923 = getelementptr inbounds i8, i8 addrspace(4)* %5884, i64 7
  %5924 = load i8, i8 addrspace(4)* %5923, align 1, !tbaa !14
  %5925 = zext i8 %5924 to i64
  %5926 = shl nuw i64 %5925, 56
  %5927 = or i64 %5922, %5926
  br label %5941

5928:                                             ; preds = %5888, %5928
  %5929 = phi i32 [ %5939, %5928 ], [ 0, %5888 ]
  %5930 = phi i64 [ %5938, %5928 ], [ 0, %5888 ]
  %5931 = zext i32 %5929 to i64
  %5932 = getelementptr inbounds i8, i8 addrspace(4)* %5884, i64 %5931
  %5933 = load i8, i8 addrspace(4)* %5932, align 1, !tbaa !14
  %5934 = zext i8 %5933 to i64
  %5935 = shl i32 %5929, 3
  %5936 = zext i32 %5935 to i64
  %5937 = shl nuw i64 %5934, %5936
  %5938 = or i64 %5937, %5930
  %5939 = add nuw nsw i32 %5929, 1
  %5940 = icmp eq i32 %5939, %5885
  br i1 %5940, label %5941, label %5928

5941:                                             ; preds = %5928, %5890, %5888
  %5942 = phi i64 [ %5927, %5890 ], [ 0, %5888 ], [ %5938, %5928 ]
  %5943 = shl nuw nsw i64 %5524, 2
  %5944 = add nuw nsw i64 %5943, 28
  %5945 = and i64 %5944, 480
  %5946 = and i64 %5526, -225
  %5947 = or i64 %5946, %5945
  %5948 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %5504, i64 noundef %5947, i64 noundef %5586, i64 noundef %5646, i64 noundef %5706, i64 noundef %5766, i64 noundef %5826, i64 noundef %5886, i64 noundef %5942) #11
  %5949 = sub i64 %5516, %5524
  %5950 = getelementptr inbounds i8, i8 addrspace(4)* %5517, i64 %5524
  %5951 = icmp eq i64 %5949, 0
  br i1 %5951, label %5952, label %5515

5952:                                             ; preds = %5941, %5507
  %5953 = phi <2 x i64> [ %5510, %5507 ], [ %5948, %5941 ]
  %5954 = extractelement <2 x i64> %5953, i64 0
  %5955 = and i64 %5954, -227
  %5956 = or i64 %5955, 34
  %5957 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %5504, i64 noundef %5956, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %5958 = load i32, i32 addrspace(3)* getelementptr inbounds ([0 x i32], [0 x i32] addrspace(3)* @seme, i32 0, i32 0), align 4, !tbaa !5
  %5959 = load i32, i32 addrspace(1)* %5499, align 4, !tbaa !5
  %5960 = mul nsw i32 %5959, %5958
  store i32 %5960, i32 addrspace(1)* %5499, align 4, !tbaa !5
  %5961 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %5504, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %5962 = extractelement <2 x i64> %5961, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([21 x i8], [21 x i8] addrspace(4)* @.str.3, i64 0, i64 0) to i8*), i8* null), label %6404, label %5963

5963:                                             ; preds = %5952
  %5964 = and i64 %5962, 2
  %5965 = and i64 %5962, -3
  %5966 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %5965, i64 0
  br label %5967

5967:                                             ; preds = %6393, %5963
  %5968 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([21 x i8], [21 x i8] addrspace(4)* @.str.3, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([21 x i8], [21 x i8] addrspace(4)* @.str.3, i64 0, i64 20) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([21 x i8]* addrspacecast ([21 x i8] addrspace(4)* @.str.3 to [21 x i8]*) to i64)), i64 1))), %5963 ], [ %6401, %6393 ]
  %5969 = phi i8 addrspace(4)* [ getelementptr inbounds ([21 x i8], [21 x i8] addrspace(4)* @.str.3, i64 0, i64 0), %5963 ], [ %6402, %6393 ]
  %5970 = phi <2 x i64> [ %5966, %5963 ], [ %6400, %6393 ]
  %5971 = icmp ugt i64 %5968, 56
  %5972 = extractelement <2 x i64> %5970, i64 0
  %5973 = or i64 %5972, %5964
  %5974 = insertelement <2 x i64> poison, i64 %5973, i64 0
  %5975 = select i1 %5971, <2 x i64> %5970, <2 x i64> %5974
  %5976 = tail call i64 @llvm.umin.i64(i64 %5968, i64 56)
  %5977 = trunc i64 %5976 to i32
  %5978 = extractelement <2 x i64> %5975, i64 0
  %5979 = icmp ugt i32 %5977, 7
  br i1 %5979, label %5995, label %5980

5980:                                             ; preds = %5967
  %5981 = icmp eq i32 %5977, 0
  br i1 %5981, label %6035, label %5982

5982:                                             ; preds = %5980, %5982
  %5983 = phi i32 [ %5993, %5982 ], [ 0, %5980 ]
  %5984 = phi i64 [ %5992, %5982 ], [ 0, %5980 ]
  %5985 = zext i32 %5983 to i64
  %5986 = getelementptr inbounds i8, i8 addrspace(4)* %5969, i64 %5985
  %5987 = load i8, i8 addrspace(4)* %5986, align 1, !tbaa !14
  %5988 = zext i8 %5987 to i64
  %5989 = shl i32 %5983, 3
  %5990 = zext i32 %5989 to i64
  %5991 = shl nuw i64 %5988, %5990
  %5992 = or i64 %5991, %5984
  %5993 = add nuw nsw i32 %5983, 1
  %5994 = icmp eq i32 %5993, %5977
  br i1 %5994, label %6035, label %5982, !llvm.loop !15

5995:                                             ; preds = %5967
  %5996 = load i8, i8 addrspace(4)* %5969, align 1, !tbaa !14
  %5997 = zext i8 %5996 to i64
  %5998 = getelementptr inbounds i8, i8 addrspace(4)* %5969, i64 1
  %5999 = load i8, i8 addrspace(4)* %5998, align 1, !tbaa !14
  %6000 = zext i8 %5999 to i64
  %6001 = shl nuw nsw i64 %6000, 8
  %6002 = or i64 %6001, %5997
  %6003 = getelementptr inbounds i8, i8 addrspace(4)* %5969, i64 2
  %6004 = load i8, i8 addrspace(4)* %6003, align 1, !tbaa !14
  %6005 = zext i8 %6004 to i64
  %6006 = shl nuw nsw i64 %6005, 16
  %6007 = or i64 %6002, %6006
  %6008 = getelementptr inbounds i8, i8 addrspace(4)* %5969, i64 3
  %6009 = load i8, i8 addrspace(4)* %6008, align 1, !tbaa !14
  %6010 = zext i8 %6009 to i64
  %6011 = shl nuw nsw i64 %6010, 24
  %6012 = or i64 %6007, %6011
  %6013 = getelementptr inbounds i8, i8 addrspace(4)* %5969, i64 4
  %6014 = load i8, i8 addrspace(4)* %6013, align 1, !tbaa !14
  %6015 = zext i8 %6014 to i64
  %6016 = shl nuw nsw i64 %6015, 32
  %6017 = or i64 %6012, %6016
  %6018 = getelementptr inbounds i8, i8 addrspace(4)* %5969, i64 5
  %6019 = load i8, i8 addrspace(4)* %6018, align 1, !tbaa !14
  %6020 = zext i8 %6019 to i64
  %6021 = shl nuw nsw i64 %6020, 40
  %6022 = or i64 %6017, %6021
  %6023 = getelementptr inbounds i8, i8 addrspace(4)* %5969, i64 6
  %6024 = load i8, i8 addrspace(4)* %6023, align 1, !tbaa !14
  %6025 = zext i8 %6024 to i64
  %6026 = shl nuw nsw i64 %6025, 48
  %6027 = or i64 %6022, %6026
  %6028 = getelementptr inbounds i8, i8 addrspace(4)* %5969, i64 7
  %6029 = load i8, i8 addrspace(4)* %6028, align 1, !tbaa !14
  %6030 = zext i8 %6029 to i64
  %6031 = shl nuw i64 %6030, 56
  %6032 = or i64 %6027, %6031
  %6033 = add nsw i32 %5977, -8
  %6034 = getelementptr inbounds i8, i8 addrspace(4)* %5969, i64 8
  br label %6035

6035:                                             ; preds = %5982, %5995, %5980
  %6036 = phi i8 addrspace(4)* [ %6034, %5995 ], [ %5969, %5980 ], [ %5969, %5982 ]
  %6037 = phi i32 [ %6033, %5995 ], [ 0, %5980 ], [ 0, %5982 ]
  %6038 = phi i64 [ %6032, %5995 ], [ 0, %5980 ], [ %5992, %5982 ]
  %6039 = icmp ugt i32 %6037, 7
  br i1 %6039, label %6055, label %6040

6040:                                             ; preds = %6035
  %6041 = icmp eq i32 %6037, 0
  br i1 %6041, label %6095, label %6042

6042:                                             ; preds = %6040, %6042
  %6043 = phi i32 [ %6053, %6042 ], [ 0, %6040 ]
  %6044 = phi i64 [ %6052, %6042 ], [ 0, %6040 ]
  %6045 = zext i32 %6043 to i64
  %6046 = getelementptr inbounds i8, i8 addrspace(4)* %6036, i64 %6045
  %6047 = load i8, i8 addrspace(4)* %6046, align 1, !tbaa !14
  %6048 = zext i8 %6047 to i64
  %6049 = shl i32 %6043, 3
  %6050 = zext i32 %6049 to i64
  %6051 = shl nuw i64 %6048, %6050
  %6052 = or i64 %6051, %6044
  %6053 = add nuw nsw i32 %6043, 1
  %6054 = icmp eq i32 %6053, %6037
  br i1 %6054, label %6095, label %6042

6055:                                             ; preds = %6035
  %6056 = load i8, i8 addrspace(4)* %6036, align 1, !tbaa !14
  %6057 = zext i8 %6056 to i64
  %6058 = getelementptr inbounds i8, i8 addrspace(4)* %6036, i64 1
  %6059 = load i8, i8 addrspace(4)* %6058, align 1, !tbaa !14
  %6060 = zext i8 %6059 to i64
  %6061 = shl nuw nsw i64 %6060, 8
  %6062 = or i64 %6061, %6057
  %6063 = getelementptr inbounds i8, i8 addrspace(4)* %6036, i64 2
  %6064 = load i8, i8 addrspace(4)* %6063, align 1, !tbaa !14
  %6065 = zext i8 %6064 to i64
  %6066 = shl nuw nsw i64 %6065, 16
  %6067 = or i64 %6062, %6066
  %6068 = getelementptr inbounds i8, i8 addrspace(4)* %6036, i64 3
  %6069 = load i8, i8 addrspace(4)* %6068, align 1, !tbaa !14
  %6070 = zext i8 %6069 to i64
  %6071 = shl nuw nsw i64 %6070, 24
  %6072 = or i64 %6067, %6071
  %6073 = getelementptr inbounds i8, i8 addrspace(4)* %6036, i64 4
  %6074 = load i8, i8 addrspace(4)* %6073, align 1, !tbaa !14
  %6075 = zext i8 %6074 to i64
  %6076 = shl nuw nsw i64 %6075, 32
  %6077 = or i64 %6072, %6076
  %6078 = getelementptr inbounds i8, i8 addrspace(4)* %6036, i64 5
  %6079 = load i8, i8 addrspace(4)* %6078, align 1, !tbaa !14
  %6080 = zext i8 %6079 to i64
  %6081 = shl nuw nsw i64 %6080, 40
  %6082 = or i64 %6077, %6081
  %6083 = getelementptr inbounds i8, i8 addrspace(4)* %6036, i64 6
  %6084 = load i8, i8 addrspace(4)* %6083, align 1, !tbaa !14
  %6085 = zext i8 %6084 to i64
  %6086 = shl nuw nsw i64 %6085, 48
  %6087 = or i64 %6082, %6086
  %6088 = getelementptr inbounds i8, i8 addrspace(4)* %6036, i64 7
  %6089 = load i8, i8 addrspace(4)* %6088, align 1, !tbaa !14
  %6090 = zext i8 %6089 to i64
  %6091 = shl nuw i64 %6090, 56
  %6092 = or i64 %6087, %6091
  %6093 = add nsw i32 %6037, -8
  %6094 = getelementptr inbounds i8, i8 addrspace(4)* %6036, i64 8
  br label %6095

6095:                                             ; preds = %6042, %6055, %6040
  %6096 = phi i8 addrspace(4)* [ %6094, %6055 ], [ %6036, %6040 ], [ %6036, %6042 ]
  %6097 = phi i32 [ %6093, %6055 ], [ 0, %6040 ], [ 0, %6042 ]
  %6098 = phi i64 [ %6092, %6055 ], [ 0, %6040 ], [ %6052, %6042 ]
  %6099 = icmp ugt i32 %6097, 7
  br i1 %6099, label %6115, label %6100

6100:                                             ; preds = %6095
  %6101 = icmp eq i32 %6097, 0
  br i1 %6101, label %6155, label %6102

6102:                                             ; preds = %6100, %6102
  %6103 = phi i32 [ %6113, %6102 ], [ 0, %6100 ]
  %6104 = phi i64 [ %6112, %6102 ], [ 0, %6100 ]
  %6105 = zext i32 %6103 to i64
  %6106 = getelementptr inbounds i8, i8 addrspace(4)* %6096, i64 %6105
  %6107 = load i8, i8 addrspace(4)* %6106, align 1, !tbaa !14
  %6108 = zext i8 %6107 to i64
  %6109 = shl i32 %6103, 3
  %6110 = zext i32 %6109 to i64
  %6111 = shl nuw i64 %6108, %6110
  %6112 = or i64 %6111, %6104
  %6113 = add nuw nsw i32 %6103, 1
  %6114 = icmp eq i32 %6113, %6097
  br i1 %6114, label %6155, label %6102

6115:                                             ; preds = %6095
  %6116 = load i8, i8 addrspace(4)* %6096, align 1, !tbaa !14
  %6117 = zext i8 %6116 to i64
  %6118 = getelementptr inbounds i8, i8 addrspace(4)* %6096, i64 1
  %6119 = load i8, i8 addrspace(4)* %6118, align 1, !tbaa !14
  %6120 = zext i8 %6119 to i64
  %6121 = shl nuw nsw i64 %6120, 8
  %6122 = or i64 %6121, %6117
  %6123 = getelementptr inbounds i8, i8 addrspace(4)* %6096, i64 2
  %6124 = load i8, i8 addrspace(4)* %6123, align 1, !tbaa !14
  %6125 = zext i8 %6124 to i64
  %6126 = shl nuw nsw i64 %6125, 16
  %6127 = or i64 %6122, %6126
  %6128 = getelementptr inbounds i8, i8 addrspace(4)* %6096, i64 3
  %6129 = load i8, i8 addrspace(4)* %6128, align 1, !tbaa !14
  %6130 = zext i8 %6129 to i64
  %6131 = shl nuw nsw i64 %6130, 24
  %6132 = or i64 %6127, %6131
  %6133 = getelementptr inbounds i8, i8 addrspace(4)* %6096, i64 4
  %6134 = load i8, i8 addrspace(4)* %6133, align 1, !tbaa !14
  %6135 = zext i8 %6134 to i64
  %6136 = shl nuw nsw i64 %6135, 32
  %6137 = or i64 %6132, %6136
  %6138 = getelementptr inbounds i8, i8 addrspace(4)* %6096, i64 5
  %6139 = load i8, i8 addrspace(4)* %6138, align 1, !tbaa !14
  %6140 = zext i8 %6139 to i64
  %6141 = shl nuw nsw i64 %6140, 40
  %6142 = or i64 %6137, %6141
  %6143 = getelementptr inbounds i8, i8 addrspace(4)* %6096, i64 6
  %6144 = load i8, i8 addrspace(4)* %6143, align 1, !tbaa !14
  %6145 = zext i8 %6144 to i64
  %6146 = shl nuw nsw i64 %6145, 48
  %6147 = or i64 %6142, %6146
  %6148 = getelementptr inbounds i8, i8 addrspace(4)* %6096, i64 7
  %6149 = load i8, i8 addrspace(4)* %6148, align 1, !tbaa !14
  %6150 = zext i8 %6149 to i64
  %6151 = shl nuw i64 %6150, 56
  %6152 = or i64 %6147, %6151
  %6153 = add nsw i32 %6097, -8
  %6154 = getelementptr inbounds i8, i8 addrspace(4)* %6096, i64 8
  br label %6155

6155:                                             ; preds = %6102, %6115, %6100
  %6156 = phi i8 addrspace(4)* [ %6154, %6115 ], [ %6096, %6100 ], [ %6096, %6102 ]
  %6157 = phi i32 [ %6153, %6115 ], [ 0, %6100 ], [ 0, %6102 ]
  %6158 = phi i64 [ %6152, %6115 ], [ 0, %6100 ], [ %6112, %6102 ]
  %6159 = icmp ugt i32 %6157, 7
  br i1 %6159, label %6175, label %6160

6160:                                             ; preds = %6155
  %6161 = icmp eq i32 %6157, 0
  br i1 %6161, label %6215, label %6162

6162:                                             ; preds = %6160, %6162
  %6163 = phi i32 [ %6173, %6162 ], [ 0, %6160 ]
  %6164 = phi i64 [ %6172, %6162 ], [ 0, %6160 ]
  %6165 = zext i32 %6163 to i64
  %6166 = getelementptr inbounds i8, i8 addrspace(4)* %6156, i64 %6165
  %6167 = load i8, i8 addrspace(4)* %6166, align 1, !tbaa !14
  %6168 = zext i8 %6167 to i64
  %6169 = shl i32 %6163, 3
  %6170 = zext i32 %6169 to i64
  %6171 = shl nuw i64 %6168, %6170
  %6172 = or i64 %6171, %6164
  %6173 = add nuw nsw i32 %6163, 1
  %6174 = icmp eq i32 %6173, %6157
  br i1 %6174, label %6215, label %6162

6175:                                             ; preds = %6155
  %6176 = load i8, i8 addrspace(4)* %6156, align 1, !tbaa !14
  %6177 = zext i8 %6176 to i64
  %6178 = getelementptr inbounds i8, i8 addrspace(4)* %6156, i64 1
  %6179 = load i8, i8 addrspace(4)* %6178, align 1, !tbaa !14
  %6180 = zext i8 %6179 to i64
  %6181 = shl nuw nsw i64 %6180, 8
  %6182 = or i64 %6181, %6177
  %6183 = getelementptr inbounds i8, i8 addrspace(4)* %6156, i64 2
  %6184 = load i8, i8 addrspace(4)* %6183, align 1, !tbaa !14
  %6185 = zext i8 %6184 to i64
  %6186 = shl nuw nsw i64 %6185, 16
  %6187 = or i64 %6182, %6186
  %6188 = getelementptr inbounds i8, i8 addrspace(4)* %6156, i64 3
  %6189 = load i8, i8 addrspace(4)* %6188, align 1, !tbaa !14
  %6190 = zext i8 %6189 to i64
  %6191 = shl nuw nsw i64 %6190, 24
  %6192 = or i64 %6187, %6191
  %6193 = getelementptr inbounds i8, i8 addrspace(4)* %6156, i64 4
  %6194 = load i8, i8 addrspace(4)* %6193, align 1, !tbaa !14
  %6195 = zext i8 %6194 to i64
  %6196 = shl nuw nsw i64 %6195, 32
  %6197 = or i64 %6192, %6196
  %6198 = getelementptr inbounds i8, i8 addrspace(4)* %6156, i64 5
  %6199 = load i8, i8 addrspace(4)* %6198, align 1, !tbaa !14
  %6200 = zext i8 %6199 to i64
  %6201 = shl nuw nsw i64 %6200, 40
  %6202 = or i64 %6197, %6201
  %6203 = getelementptr inbounds i8, i8 addrspace(4)* %6156, i64 6
  %6204 = load i8, i8 addrspace(4)* %6203, align 1, !tbaa !14
  %6205 = zext i8 %6204 to i64
  %6206 = shl nuw nsw i64 %6205, 48
  %6207 = or i64 %6202, %6206
  %6208 = getelementptr inbounds i8, i8 addrspace(4)* %6156, i64 7
  %6209 = load i8, i8 addrspace(4)* %6208, align 1, !tbaa !14
  %6210 = zext i8 %6209 to i64
  %6211 = shl nuw i64 %6210, 56
  %6212 = or i64 %6207, %6211
  %6213 = add nsw i32 %6157, -8
  %6214 = getelementptr inbounds i8, i8 addrspace(4)* %6156, i64 8
  br label %6215

6215:                                             ; preds = %6162, %6175, %6160
  %6216 = phi i8 addrspace(4)* [ %6214, %6175 ], [ %6156, %6160 ], [ %6156, %6162 ]
  %6217 = phi i32 [ %6213, %6175 ], [ 0, %6160 ], [ 0, %6162 ]
  %6218 = phi i64 [ %6212, %6175 ], [ 0, %6160 ], [ %6172, %6162 ]
  %6219 = icmp ugt i32 %6217, 7
  br i1 %6219, label %6235, label %6220

6220:                                             ; preds = %6215
  %6221 = icmp eq i32 %6217, 0
  br i1 %6221, label %6275, label %6222

6222:                                             ; preds = %6220, %6222
  %6223 = phi i32 [ %6233, %6222 ], [ 0, %6220 ]
  %6224 = phi i64 [ %6232, %6222 ], [ 0, %6220 ]
  %6225 = zext i32 %6223 to i64
  %6226 = getelementptr inbounds i8, i8 addrspace(4)* %6216, i64 %6225
  %6227 = load i8, i8 addrspace(4)* %6226, align 1, !tbaa !14
  %6228 = zext i8 %6227 to i64
  %6229 = shl i32 %6223, 3
  %6230 = zext i32 %6229 to i64
  %6231 = shl nuw i64 %6228, %6230
  %6232 = or i64 %6231, %6224
  %6233 = add nuw nsw i32 %6223, 1
  %6234 = icmp eq i32 %6233, %6217
  br i1 %6234, label %6275, label %6222

6235:                                             ; preds = %6215
  %6236 = load i8, i8 addrspace(4)* %6216, align 1, !tbaa !14
  %6237 = zext i8 %6236 to i64
  %6238 = getelementptr inbounds i8, i8 addrspace(4)* %6216, i64 1
  %6239 = load i8, i8 addrspace(4)* %6238, align 1, !tbaa !14
  %6240 = zext i8 %6239 to i64
  %6241 = shl nuw nsw i64 %6240, 8
  %6242 = or i64 %6241, %6237
  %6243 = getelementptr inbounds i8, i8 addrspace(4)* %6216, i64 2
  %6244 = load i8, i8 addrspace(4)* %6243, align 1, !tbaa !14
  %6245 = zext i8 %6244 to i64
  %6246 = shl nuw nsw i64 %6245, 16
  %6247 = or i64 %6242, %6246
  %6248 = getelementptr inbounds i8, i8 addrspace(4)* %6216, i64 3
  %6249 = load i8, i8 addrspace(4)* %6248, align 1, !tbaa !14
  %6250 = zext i8 %6249 to i64
  %6251 = shl nuw nsw i64 %6250, 24
  %6252 = or i64 %6247, %6251
  %6253 = getelementptr inbounds i8, i8 addrspace(4)* %6216, i64 4
  %6254 = load i8, i8 addrspace(4)* %6253, align 1, !tbaa !14
  %6255 = zext i8 %6254 to i64
  %6256 = shl nuw nsw i64 %6255, 32
  %6257 = or i64 %6252, %6256
  %6258 = getelementptr inbounds i8, i8 addrspace(4)* %6216, i64 5
  %6259 = load i8, i8 addrspace(4)* %6258, align 1, !tbaa !14
  %6260 = zext i8 %6259 to i64
  %6261 = shl nuw nsw i64 %6260, 40
  %6262 = or i64 %6257, %6261
  %6263 = getelementptr inbounds i8, i8 addrspace(4)* %6216, i64 6
  %6264 = load i8, i8 addrspace(4)* %6263, align 1, !tbaa !14
  %6265 = zext i8 %6264 to i64
  %6266 = shl nuw nsw i64 %6265, 48
  %6267 = or i64 %6262, %6266
  %6268 = getelementptr inbounds i8, i8 addrspace(4)* %6216, i64 7
  %6269 = load i8, i8 addrspace(4)* %6268, align 1, !tbaa !14
  %6270 = zext i8 %6269 to i64
  %6271 = shl nuw i64 %6270, 56
  %6272 = or i64 %6267, %6271
  %6273 = add nsw i32 %6217, -8
  %6274 = getelementptr inbounds i8, i8 addrspace(4)* %6216, i64 8
  br label %6275

6275:                                             ; preds = %6222, %6235, %6220
  %6276 = phi i8 addrspace(4)* [ %6274, %6235 ], [ %6216, %6220 ], [ %6216, %6222 ]
  %6277 = phi i32 [ %6273, %6235 ], [ 0, %6220 ], [ 0, %6222 ]
  %6278 = phi i64 [ %6272, %6235 ], [ 0, %6220 ], [ %6232, %6222 ]
  %6279 = icmp ugt i32 %6277, 7
  br i1 %6279, label %6295, label %6280

6280:                                             ; preds = %6275
  %6281 = icmp eq i32 %6277, 0
  br i1 %6281, label %6335, label %6282

6282:                                             ; preds = %6280, %6282
  %6283 = phi i32 [ %6293, %6282 ], [ 0, %6280 ]
  %6284 = phi i64 [ %6292, %6282 ], [ 0, %6280 ]
  %6285 = zext i32 %6283 to i64
  %6286 = getelementptr inbounds i8, i8 addrspace(4)* %6276, i64 %6285
  %6287 = load i8, i8 addrspace(4)* %6286, align 1, !tbaa !14
  %6288 = zext i8 %6287 to i64
  %6289 = shl i32 %6283, 3
  %6290 = zext i32 %6289 to i64
  %6291 = shl nuw i64 %6288, %6290
  %6292 = or i64 %6291, %6284
  %6293 = add nuw nsw i32 %6283, 1
  %6294 = icmp eq i32 %6293, %6277
  br i1 %6294, label %6335, label %6282

6295:                                             ; preds = %6275
  %6296 = load i8, i8 addrspace(4)* %6276, align 1, !tbaa !14
  %6297 = zext i8 %6296 to i64
  %6298 = getelementptr inbounds i8, i8 addrspace(4)* %6276, i64 1
  %6299 = load i8, i8 addrspace(4)* %6298, align 1, !tbaa !14
  %6300 = zext i8 %6299 to i64
  %6301 = shl nuw nsw i64 %6300, 8
  %6302 = or i64 %6301, %6297
  %6303 = getelementptr inbounds i8, i8 addrspace(4)* %6276, i64 2
  %6304 = load i8, i8 addrspace(4)* %6303, align 1, !tbaa !14
  %6305 = zext i8 %6304 to i64
  %6306 = shl nuw nsw i64 %6305, 16
  %6307 = or i64 %6302, %6306
  %6308 = getelementptr inbounds i8, i8 addrspace(4)* %6276, i64 3
  %6309 = load i8, i8 addrspace(4)* %6308, align 1, !tbaa !14
  %6310 = zext i8 %6309 to i64
  %6311 = shl nuw nsw i64 %6310, 24
  %6312 = or i64 %6307, %6311
  %6313 = getelementptr inbounds i8, i8 addrspace(4)* %6276, i64 4
  %6314 = load i8, i8 addrspace(4)* %6313, align 1, !tbaa !14
  %6315 = zext i8 %6314 to i64
  %6316 = shl nuw nsw i64 %6315, 32
  %6317 = or i64 %6312, %6316
  %6318 = getelementptr inbounds i8, i8 addrspace(4)* %6276, i64 5
  %6319 = load i8, i8 addrspace(4)* %6318, align 1, !tbaa !14
  %6320 = zext i8 %6319 to i64
  %6321 = shl nuw nsw i64 %6320, 40
  %6322 = or i64 %6317, %6321
  %6323 = getelementptr inbounds i8, i8 addrspace(4)* %6276, i64 6
  %6324 = load i8, i8 addrspace(4)* %6323, align 1, !tbaa !14
  %6325 = zext i8 %6324 to i64
  %6326 = shl nuw nsw i64 %6325, 48
  %6327 = or i64 %6322, %6326
  %6328 = getelementptr inbounds i8, i8 addrspace(4)* %6276, i64 7
  %6329 = load i8, i8 addrspace(4)* %6328, align 1, !tbaa !14
  %6330 = zext i8 %6329 to i64
  %6331 = shl nuw i64 %6330, 56
  %6332 = or i64 %6327, %6331
  %6333 = add nsw i32 %6277, -8
  %6334 = getelementptr inbounds i8, i8 addrspace(4)* %6276, i64 8
  br label %6335

6335:                                             ; preds = %6282, %6295, %6280
  %6336 = phi i8 addrspace(4)* [ %6334, %6295 ], [ %6276, %6280 ], [ %6276, %6282 ]
  %6337 = phi i32 [ %6333, %6295 ], [ 0, %6280 ], [ 0, %6282 ]
  %6338 = phi i64 [ %6332, %6295 ], [ 0, %6280 ], [ %6292, %6282 ]
  %6339 = icmp ugt i32 %6337, 7
  br i1 %6339, label %6355, label %6340

6340:                                             ; preds = %6335
  %6341 = icmp eq i32 %6337, 0
  br i1 %6341, label %6393, label %6342

6342:                                             ; preds = %6340, %6342
  %6343 = phi i32 [ %6353, %6342 ], [ 0, %6340 ]
  %6344 = phi i64 [ %6352, %6342 ], [ 0, %6340 ]
  %6345 = zext i32 %6343 to i64
  %6346 = getelementptr inbounds i8, i8 addrspace(4)* %6336, i64 %6345
  %6347 = load i8, i8 addrspace(4)* %6346, align 1, !tbaa !14
  %6348 = zext i8 %6347 to i64
  %6349 = shl i32 %6343, 3
  %6350 = zext i32 %6349 to i64
  %6351 = shl nuw i64 %6348, %6350
  %6352 = or i64 %6351, %6344
  %6353 = add nuw nsw i32 %6343, 1
  %6354 = icmp eq i32 %6353, %6337
  br i1 %6354, label %6393, label %6342

6355:                                             ; preds = %6335
  %6356 = load i8, i8 addrspace(4)* %6336, align 1, !tbaa !14
  %6357 = zext i8 %6356 to i64
  %6358 = getelementptr inbounds i8, i8 addrspace(4)* %6336, i64 1
  %6359 = load i8, i8 addrspace(4)* %6358, align 1, !tbaa !14
  %6360 = zext i8 %6359 to i64
  %6361 = shl nuw nsw i64 %6360, 8
  %6362 = or i64 %6361, %6357
  %6363 = getelementptr inbounds i8, i8 addrspace(4)* %6336, i64 2
  %6364 = load i8, i8 addrspace(4)* %6363, align 1, !tbaa !14
  %6365 = zext i8 %6364 to i64
  %6366 = shl nuw nsw i64 %6365, 16
  %6367 = or i64 %6362, %6366
  %6368 = getelementptr inbounds i8, i8 addrspace(4)* %6336, i64 3
  %6369 = load i8, i8 addrspace(4)* %6368, align 1, !tbaa !14
  %6370 = zext i8 %6369 to i64
  %6371 = shl nuw nsw i64 %6370, 24
  %6372 = or i64 %6367, %6371
  %6373 = getelementptr inbounds i8, i8 addrspace(4)* %6336, i64 4
  %6374 = load i8, i8 addrspace(4)* %6373, align 1, !tbaa !14
  %6375 = zext i8 %6374 to i64
  %6376 = shl nuw nsw i64 %6375, 32
  %6377 = or i64 %6372, %6376
  %6378 = getelementptr inbounds i8, i8 addrspace(4)* %6336, i64 5
  %6379 = load i8, i8 addrspace(4)* %6378, align 1, !tbaa !14
  %6380 = zext i8 %6379 to i64
  %6381 = shl nuw nsw i64 %6380, 40
  %6382 = or i64 %6377, %6381
  %6383 = getelementptr inbounds i8, i8 addrspace(4)* %6336, i64 6
  %6384 = load i8, i8 addrspace(4)* %6383, align 1, !tbaa !14
  %6385 = zext i8 %6384 to i64
  %6386 = shl nuw nsw i64 %6385, 48
  %6387 = or i64 %6382, %6386
  %6388 = getelementptr inbounds i8, i8 addrspace(4)* %6336, i64 7
  %6389 = load i8, i8 addrspace(4)* %6388, align 1, !tbaa !14
  %6390 = zext i8 %6389 to i64
  %6391 = shl nuw i64 %6390, 56
  %6392 = or i64 %6387, %6391
  br label %6393

6393:                                             ; preds = %6342, %6355, %6340
  %6394 = phi i64 [ %6392, %6355 ], [ 0, %6340 ], [ %6352, %6342 ]
  %6395 = shl nuw nsw i64 %5976, 2
  %6396 = add nuw nsw i64 %6395, 28
  %6397 = and i64 %6396, 480
  %6398 = and i64 %5978, -225
  %6399 = or i64 %6398, %6397
  %6400 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %5504, i64 noundef %6399, i64 noundef %6038, i64 noundef %6098, i64 noundef %6158, i64 noundef %6218, i64 noundef %6278, i64 noundef %6338, i64 noundef %6394) #11
  %6401 = sub i64 %5968, %5976
  %6402 = getelementptr inbounds i8, i8 addrspace(4)* %5969, i64 %5976
  %6403 = icmp eq i64 %6401, 0
  br i1 %6403, label %6408, label %5967

6404:                                             ; preds = %5952
  %6405 = and i64 %5962, -225
  %6406 = or i64 %6405, 32
  %6407 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %5504, i64 noundef %6406, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  br label %6408

6408:                                             ; preds = %6393, %6404
  %6409 = phi <2 x i64> [ %6407, %6404 ], [ %6400, %6393 ]
  %6410 = extractelement <2 x i64> %6409, i64 0
  %6411 = and i64 %6410, -227
  %6412 = or i64 %6411, 34
  %6413 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %5504, i64 noundef %6412, i64 noundef 1, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %6414 = load i32, i32 addrspace(3)* getelementptr inbounds ([0 x i32], [0 x i32] addrspace(3)* @seme, i32 0, i32 1), align 4, !tbaa !5
  %6415 = load i32, i32 addrspace(1)* %5499, align 4, !tbaa !5
  %6416 = mul nsw i32 %6415, %6414
  store i32 %6416, i32 addrspace(1)* %5499, align 4, !tbaa !5
  %6417 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %5504, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %6418 = extractelement <2 x i64> %6417, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([21 x i8], [21 x i8] addrspace(4)* @.str.3, i64 0, i64 0) to i8*), i8* null), label %6860, label %6419

6419:                                             ; preds = %6408
  %6420 = and i64 %6418, 2
  %6421 = and i64 %6418, -3
  %6422 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %6421, i64 0
  br label %6423

6423:                                             ; preds = %6849, %6419
  %6424 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([21 x i8], [21 x i8] addrspace(4)* @.str.3, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([21 x i8], [21 x i8] addrspace(4)* @.str.3, i64 0, i64 20) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([21 x i8]* addrspacecast ([21 x i8] addrspace(4)* @.str.3 to [21 x i8]*) to i64)), i64 1))), %6419 ], [ %6857, %6849 ]
  %6425 = phi i8 addrspace(4)* [ getelementptr inbounds ([21 x i8], [21 x i8] addrspace(4)* @.str.3, i64 0, i64 0), %6419 ], [ %6858, %6849 ]
  %6426 = phi <2 x i64> [ %6422, %6419 ], [ %6856, %6849 ]
  %6427 = icmp ugt i64 %6424, 56
  %6428 = extractelement <2 x i64> %6426, i64 0
  %6429 = or i64 %6428, %6420
  %6430 = insertelement <2 x i64> poison, i64 %6429, i64 0
  %6431 = select i1 %6427, <2 x i64> %6426, <2 x i64> %6430
  %6432 = tail call i64 @llvm.umin.i64(i64 %6424, i64 56)
  %6433 = trunc i64 %6432 to i32
  %6434 = extractelement <2 x i64> %6431, i64 0
  %6435 = icmp ugt i32 %6433, 7
  br i1 %6435, label %6451, label %6436

6436:                                             ; preds = %6423
  %6437 = icmp eq i32 %6433, 0
  br i1 %6437, label %6491, label %6438

6438:                                             ; preds = %6436, %6438
  %6439 = phi i32 [ %6449, %6438 ], [ 0, %6436 ]
  %6440 = phi i64 [ %6448, %6438 ], [ 0, %6436 ]
  %6441 = zext i32 %6439 to i64
  %6442 = getelementptr inbounds i8, i8 addrspace(4)* %6425, i64 %6441
  %6443 = load i8, i8 addrspace(4)* %6442, align 1, !tbaa !14
  %6444 = zext i8 %6443 to i64
  %6445 = shl i32 %6439, 3
  %6446 = zext i32 %6445 to i64
  %6447 = shl nuw i64 %6444, %6446
  %6448 = or i64 %6447, %6440
  %6449 = add nuw nsw i32 %6439, 1
  %6450 = icmp eq i32 %6449, %6433
  br i1 %6450, label %6491, label %6438, !llvm.loop !15

6451:                                             ; preds = %6423
  %6452 = load i8, i8 addrspace(4)* %6425, align 1, !tbaa !14
  %6453 = zext i8 %6452 to i64
  %6454 = getelementptr inbounds i8, i8 addrspace(4)* %6425, i64 1
  %6455 = load i8, i8 addrspace(4)* %6454, align 1, !tbaa !14
  %6456 = zext i8 %6455 to i64
  %6457 = shl nuw nsw i64 %6456, 8
  %6458 = or i64 %6457, %6453
  %6459 = getelementptr inbounds i8, i8 addrspace(4)* %6425, i64 2
  %6460 = load i8, i8 addrspace(4)* %6459, align 1, !tbaa !14
  %6461 = zext i8 %6460 to i64
  %6462 = shl nuw nsw i64 %6461, 16
  %6463 = or i64 %6458, %6462
  %6464 = getelementptr inbounds i8, i8 addrspace(4)* %6425, i64 3
  %6465 = load i8, i8 addrspace(4)* %6464, align 1, !tbaa !14
  %6466 = zext i8 %6465 to i64
  %6467 = shl nuw nsw i64 %6466, 24
  %6468 = or i64 %6463, %6467
  %6469 = getelementptr inbounds i8, i8 addrspace(4)* %6425, i64 4
  %6470 = load i8, i8 addrspace(4)* %6469, align 1, !tbaa !14
  %6471 = zext i8 %6470 to i64
  %6472 = shl nuw nsw i64 %6471, 32
  %6473 = or i64 %6468, %6472
  %6474 = getelementptr inbounds i8, i8 addrspace(4)* %6425, i64 5
  %6475 = load i8, i8 addrspace(4)* %6474, align 1, !tbaa !14
  %6476 = zext i8 %6475 to i64
  %6477 = shl nuw nsw i64 %6476, 40
  %6478 = or i64 %6473, %6477
  %6479 = getelementptr inbounds i8, i8 addrspace(4)* %6425, i64 6
  %6480 = load i8, i8 addrspace(4)* %6479, align 1, !tbaa !14
  %6481 = zext i8 %6480 to i64
  %6482 = shl nuw nsw i64 %6481, 48
  %6483 = or i64 %6478, %6482
  %6484 = getelementptr inbounds i8, i8 addrspace(4)* %6425, i64 7
  %6485 = load i8, i8 addrspace(4)* %6484, align 1, !tbaa !14
  %6486 = zext i8 %6485 to i64
  %6487 = shl nuw i64 %6486, 56
  %6488 = or i64 %6483, %6487
  %6489 = add nsw i32 %6433, -8
  %6490 = getelementptr inbounds i8, i8 addrspace(4)* %6425, i64 8
  br label %6491

6491:                                             ; preds = %6438, %6451, %6436
  %6492 = phi i8 addrspace(4)* [ %6490, %6451 ], [ %6425, %6436 ], [ %6425, %6438 ]
  %6493 = phi i32 [ %6489, %6451 ], [ 0, %6436 ], [ 0, %6438 ]
  %6494 = phi i64 [ %6488, %6451 ], [ 0, %6436 ], [ %6448, %6438 ]
  %6495 = icmp ugt i32 %6493, 7
  br i1 %6495, label %6511, label %6496

6496:                                             ; preds = %6491
  %6497 = icmp eq i32 %6493, 0
  br i1 %6497, label %6551, label %6498

6498:                                             ; preds = %6496, %6498
  %6499 = phi i32 [ %6509, %6498 ], [ 0, %6496 ]
  %6500 = phi i64 [ %6508, %6498 ], [ 0, %6496 ]
  %6501 = zext i32 %6499 to i64
  %6502 = getelementptr inbounds i8, i8 addrspace(4)* %6492, i64 %6501
  %6503 = load i8, i8 addrspace(4)* %6502, align 1, !tbaa !14
  %6504 = zext i8 %6503 to i64
  %6505 = shl i32 %6499, 3
  %6506 = zext i32 %6505 to i64
  %6507 = shl nuw i64 %6504, %6506
  %6508 = or i64 %6507, %6500
  %6509 = add nuw nsw i32 %6499, 1
  %6510 = icmp eq i32 %6509, %6493
  br i1 %6510, label %6551, label %6498

6511:                                             ; preds = %6491
  %6512 = load i8, i8 addrspace(4)* %6492, align 1, !tbaa !14
  %6513 = zext i8 %6512 to i64
  %6514 = getelementptr inbounds i8, i8 addrspace(4)* %6492, i64 1
  %6515 = load i8, i8 addrspace(4)* %6514, align 1, !tbaa !14
  %6516 = zext i8 %6515 to i64
  %6517 = shl nuw nsw i64 %6516, 8
  %6518 = or i64 %6517, %6513
  %6519 = getelementptr inbounds i8, i8 addrspace(4)* %6492, i64 2
  %6520 = load i8, i8 addrspace(4)* %6519, align 1, !tbaa !14
  %6521 = zext i8 %6520 to i64
  %6522 = shl nuw nsw i64 %6521, 16
  %6523 = or i64 %6518, %6522
  %6524 = getelementptr inbounds i8, i8 addrspace(4)* %6492, i64 3
  %6525 = load i8, i8 addrspace(4)* %6524, align 1, !tbaa !14
  %6526 = zext i8 %6525 to i64
  %6527 = shl nuw nsw i64 %6526, 24
  %6528 = or i64 %6523, %6527
  %6529 = getelementptr inbounds i8, i8 addrspace(4)* %6492, i64 4
  %6530 = load i8, i8 addrspace(4)* %6529, align 1, !tbaa !14
  %6531 = zext i8 %6530 to i64
  %6532 = shl nuw nsw i64 %6531, 32
  %6533 = or i64 %6528, %6532
  %6534 = getelementptr inbounds i8, i8 addrspace(4)* %6492, i64 5
  %6535 = load i8, i8 addrspace(4)* %6534, align 1, !tbaa !14
  %6536 = zext i8 %6535 to i64
  %6537 = shl nuw nsw i64 %6536, 40
  %6538 = or i64 %6533, %6537
  %6539 = getelementptr inbounds i8, i8 addrspace(4)* %6492, i64 6
  %6540 = load i8, i8 addrspace(4)* %6539, align 1, !tbaa !14
  %6541 = zext i8 %6540 to i64
  %6542 = shl nuw nsw i64 %6541, 48
  %6543 = or i64 %6538, %6542
  %6544 = getelementptr inbounds i8, i8 addrspace(4)* %6492, i64 7
  %6545 = load i8, i8 addrspace(4)* %6544, align 1, !tbaa !14
  %6546 = zext i8 %6545 to i64
  %6547 = shl nuw i64 %6546, 56
  %6548 = or i64 %6543, %6547
  %6549 = add nsw i32 %6493, -8
  %6550 = getelementptr inbounds i8, i8 addrspace(4)* %6492, i64 8
  br label %6551

6551:                                             ; preds = %6498, %6511, %6496
  %6552 = phi i8 addrspace(4)* [ %6550, %6511 ], [ %6492, %6496 ], [ %6492, %6498 ]
  %6553 = phi i32 [ %6549, %6511 ], [ 0, %6496 ], [ 0, %6498 ]
  %6554 = phi i64 [ %6548, %6511 ], [ 0, %6496 ], [ %6508, %6498 ]
  %6555 = icmp ugt i32 %6553, 7
  br i1 %6555, label %6571, label %6556

6556:                                             ; preds = %6551
  %6557 = icmp eq i32 %6553, 0
  br i1 %6557, label %6611, label %6558

6558:                                             ; preds = %6556, %6558
  %6559 = phi i32 [ %6569, %6558 ], [ 0, %6556 ]
  %6560 = phi i64 [ %6568, %6558 ], [ 0, %6556 ]
  %6561 = zext i32 %6559 to i64
  %6562 = getelementptr inbounds i8, i8 addrspace(4)* %6552, i64 %6561
  %6563 = load i8, i8 addrspace(4)* %6562, align 1, !tbaa !14
  %6564 = zext i8 %6563 to i64
  %6565 = shl i32 %6559, 3
  %6566 = zext i32 %6565 to i64
  %6567 = shl nuw i64 %6564, %6566
  %6568 = or i64 %6567, %6560
  %6569 = add nuw nsw i32 %6559, 1
  %6570 = icmp eq i32 %6569, %6553
  br i1 %6570, label %6611, label %6558

6571:                                             ; preds = %6551
  %6572 = load i8, i8 addrspace(4)* %6552, align 1, !tbaa !14
  %6573 = zext i8 %6572 to i64
  %6574 = getelementptr inbounds i8, i8 addrspace(4)* %6552, i64 1
  %6575 = load i8, i8 addrspace(4)* %6574, align 1, !tbaa !14
  %6576 = zext i8 %6575 to i64
  %6577 = shl nuw nsw i64 %6576, 8
  %6578 = or i64 %6577, %6573
  %6579 = getelementptr inbounds i8, i8 addrspace(4)* %6552, i64 2
  %6580 = load i8, i8 addrspace(4)* %6579, align 1, !tbaa !14
  %6581 = zext i8 %6580 to i64
  %6582 = shl nuw nsw i64 %6581, 16
  %6583 = or i64 %6578, %6582
  %6584 = getelementptr inbounds i8, i8 addrspace(4)* %6552, i64 3
  %6585 = load i8, i8 addrspace(4)* %6584, align 1, !tbaa !14
  %6586 = zext i8 %6585 to i64
  %6587 = shl nuw nsw i64 %6586, 24
  %6588 = or i64 %6583, %6587
  %6589 = getelementptr inbounds i8, i8 addrspace(4)* %6552, i64 4
  %6590 = load i8, i8 addrspace(4)* %6589, align 1, !tbaa !14
  %6591 = zext i8 %6590 to i64
  %6592 = shl nuw nsw i64 %6591, 32
  %6593 = or i64 %6588, %6592
  %6594 = getelementptr inbounds i8, i8 addrspace(4)* %6552, i64 5
  %6595 = load i8, i8 addrspace(4)* %6594, align 1, !tbaa !14
  %6596 = zext i8 %6595 to i64
  %6597 = shl nuw nsw i64 %6596, 40
  %6598 = or i64 %6593, %6597
  %6599 = getelementptr inbounds i8, i8 addrspace(4)* %6552, i64 6
  %6600 = load i8, i8 addrspace(4)* %6599, align 1, !tbaa !14
  %6601 = zext i8 %6600 to i64
  %6602 = shl nuw nsw i64 %6601, 48
  %6603 = or i64 %6598, %6602
  %6604 = getelementptr inbounds i8, i8 addrspace(4)* %6552, i64 7
  %6605 = load i8, i8 addrspace(4)* %6604, align 1, !tbaa !14
  %6606 = zext i8 %6605 to i64
  %6607 = shl nuw i64 %6606, 56
  %6608 = or i64 %6603, %6607
  %6609 = add nsw i32 %6553, -8
  %6610 = getelementptr inbounds i8, i8 addrspace(4)* %6552, i64 8
  br label %6611

6611:                                             ; preds = %6558, %6571, %6556
  %6612 = phi i8 addrspace(4)* [ %6610, %6571 ], [ %6552, %6556 ], [ %6552, %6558 ]
  %6613 = phi i32 [ %6609, %6571 ], [ 0, %6556 ], [ 0, %6558 ]
  %6614 = phi i64 [ %6608, %6571 ], [ 0, %6556 ], [ %6568, %6558 ]
  %6615 = icmp ugt i32 %6613, 7
  br i1 %6615, label %6631, label %6616

6616:                                             ; preds = %6611
  %6617 = icmp eq i32 %6613, 0
  br i1 %6617, label %6671, label %6618

6618:                                             ; preds = %6616, %6618
  %6619 = phi i32 [ %6629, %6618 ], [ 0, %6616 ]
  %6620 = phi i64 [ %6628, %6618 ], [ 0, %6616 ]
  %6621 = zext i32 %6619 to i64
  %6622 = getelementptr inbounds i8, i8 addrspace(4)* %6612, i64 %6621
  %6623 = load i8, i8 addrspace(4)* %6622, align 1, !tbaa !14
  %6624 = zext i8 %6623 to i64
  %6625 = shl i32 %6619, 3
  %6626 = zext i32 %6625 to i64
  %6627 = shl nuw i64 %6624, %6626
  %6628 = or i64 %6627, %6620
  %6629 = add nuw nsw i32 %6619, 1
  %6630 = icmp eq i32 %6629, %6613
  br i1 %6630, label %6671, label %6618

6631:                                             ; preds = %6611
  %6632 = load i8, i8 addrspace(4)* %6612, align 1, !tbaa !14
  %6633 = zext i8 %6632 to i64
  %6634 = getelementptr inbounds i8, i8 addrspace(4)* %6612, i64 1
  %6635 = load i8, i8 addrspace(4)* %6634, align 1, !tbaa !14
  %6636 = zext i8 %6635 to i64
  %6637 = shl nuw nsw i64 %6636, 8
  %6638 = or i64 %6637, %6633
  %6639 = getelementptr inbounds i8, i8 addrspace(4)* %6612, i64 2
  %6640 = load i8, i8 addrspace(4)* %6639, align 1, !tbaa !14
  %6641 = zext i8 %6640 to i64
  %6642 = shl nuw nsw i64 %6641, 16
  %6643 = or i64 %6638, %6642
  %6644 = getelementptr inbounds i8, i8 addrspace(4)* %6612, i64 3
  %6645 = load i8, i8 addrspace(4)* %6644, align 1, !tbaa !14
  %6646 = zext i8 %6645 to i64
  %6647 = shl nuw nsw i64 %6646, 24
  %6648 = or i64 %6643, %6647
  %6649 = getelementptr inbounds i8, i8 addrspace(4)* %6612, i64 4
  %6650 = load i8, i8 addrspace(4)* %6649, align 1, !tbaa !14
  %6651 = zext i8 %6650 to i64
  %6652 = shl nuw nsw i64 %6651, 32
  %6653 = or i64 %6648, %6652
  %6654 = getelementptr inbounds i8, i8 addrspace(4)* %6612, i64 5
  %6655 = load i8, i8 addrspace(4)* %6654, align 1, !tbaa !14
  %6656 = zext i8 %6655 to i64
  %6657 = shl nuw nsw i64 %6656, 40
  %6658 = or i64 %6653, %6657
  %6659 = getelementptr inbounds i8, i8 addrspace(4)* %6612, i64 6
  %6660 = load i8, i8 addrspace(4)* %6659, align 1, !tbaa !14
  %6661 = zext i8 %6660 to i64
  %6662 = shl nuw nsw i64 %6661, 48
  %6663 = or i64 %6658, %6662
  %6664 = getelementptr inbounds i8, i8 addrspace(4)* %6612, i64 7
  %6665 = load i8, i8 addrspace(4)* %6664, align 1, !tbaa !14
  %6666 = zext i8 %6665 to i64
  %6667 = shl nuw i64 %6666, 56
  %6668 = or i64 %6663, %6667
  %6669 = add nsw i32 %6613, -8
  %6670 = getelementptr inbounds i8, i8 addrspace(4)* %6612, i64 8
  br label %6671

6671:                                             ; preds = %6618, %6631, %6616
  %6672 = phi i8 addrspace(4)* [ %6670, %6631 ], [ %6612, %6616 ], [ %6612, %6618 ]
  %6673 = phi i32 [ %6669, %6631 ], [ 0, %6616 ], [ 0, %6618 ]
  %6674 = phi i64 [ %6668, %6631 ], [ 0, %6616 ], [ %6628, %6618 ]
  %6675 = icmp ugt i32 %6673, 7
  br i1 %6675, label %6691, label %6676

6676:                                             ; preds = %6671
  %6677 = icmp eq i32 %6673, 0
  br i1 %6677, label %6731, label %6678

6678:                                             ; preds = %6676, %6678
  %6679 = phi i32 [ %6689, %6678 ], [ 0, %6676 ]
  %6680 = phi i64 [ %6688, %6678 ], [ 0, %6676 ]
  %6681 = zext i32 %6679 to i64
  %6682 = getelementptr inbounds i8, i8 addrspace(4)* %6672, i64 %6681
  %6683 = load i8, i8 addrspace(4)* %6682, align 1, !tbaa !14
  %6684 = zext i8 %6683 to i64
  %6685 = shl i32 %6679, 3
  %6686 = zext i32 %6685 to i64
  %6687 = shl nuw i64 %6684, %6686
  %6688 = or i64 %6687, %6680
  %6689 = add nuw nsw i32 %6679, 1
  %6690 = icmp eq i32 %6689, %6673
  br i1 %6690, label %6731, label %6678

6691:                                             ; preds = %6671
  %6692 = load i8, i8 addrspace(4)* %6672, align 1, !tbaa !14
  %6693 = zext i8 %6692 to i64
  %6694 = getelementptr inbounds i8, i8 addrspace(4)* %6672, i64 1
  %6695 = load i8, i8 addrspace(4)* %6694, align 1, !tbaa !14
  %6696 = zext i8 %6695 to i64
  %6697 = shl nuw nsw i64 %6696, 8
  %6698 = or i64 %6697, %6693
  %6699 = getelementptr inbounds i8, i8 addrspace(4)* %6672, i64 2
  %6700 = load i8, i8 addrspace(4)* %6699, align 1, !tbaa !14
  %6701 = zext i8 %6700 to i64
  %6702 = shl nuw nsw i64 %6701, 16
  %6703 = or i64 %6698, %6702
  %6704 = getelementptr inbounds i8, i8 addrspace(4)* %6672, i64 3
  %6705 = load i8, i8 addrspace(4)* %6704, align 1, !tbaa !14
  %6706 = zext i8 %6705 to i64
  %6707 = shl nuw nsw i64 %6706, 24
  %6708 = or i64 %6703, %6707
  %6709 = getelementptr inbounds i8, i8 addrspace(4)* %6672, i64 4
  %6710 = load i8, i8 addrspace(4)* %6709, align 1, !tbaa !14
  %6711 = zext i8 %6710 to i64
  %6712 = shl nuw nsw i64 %6711, 32
  %6713 = or i64 %6708, %6712
  %6714 = getelementptr inbounds i8, i8 addrspace(4)* %6672, i64 5
  %6715 = load i8, i8 addrspace(4)* %6714, align 1, !tbaa !14
  %6716 = zext i8 %6715 to i64
  %6717 = shl nuw nsw i64 %6716, 40
  %6718 = or i64 %6713, %6717
  %6719 = getelementptr inbounds i8, i8 addrspace(4)* %6672, i64 6
  %6720 = load i8, i8 addrspace(4)* %6719, align 1, !tbaa !14
  %6721 = zext i8 %6720 to i64
  %6722 = shl nuw nsw i64 %6721, 48
  %6723 = or i64 %6718, %6722
  %6724 = getelementptr inbounds i8, i8 addrspace(4)* %6672, i64 7
  %6725 = load i8, i8 addrspace(4)* %6724, align 1, !tbaa !14
  %6726 = zext i8 %6725 to i64
  %6727 = shl nuw i64 %6726, 56
  %6728 = or i64 %6723, %6727
  %6729 = add nsw i32 %6673, -8
  %6730 = getelementptr inbounds i8, i8 addrspace(4)* %6672, i64 8
  br label %6731

6731:                                             ; preds = %6678, %6691, %6676
  %6732 = phi i8 addrspace(4)* [ %6730, %6691 ], [ %6672, %6676 ], [ %6672, %6678 ]
  %6733 = phi i32 [ %6729, %6691 ], [ 0, %6676 ], [ 0, %6678 ]
  %6734 = phi i64 [ %6728, %6691 ], [ 0, %6676 ], [ %6688, %6678 ]
  %6735 = icmp ugt i32 %6733, 7
  br i1 %6735, label %6751, label %6736

6736:                                             ; preds = %6731
  %6737 = icmp eq i32 %6733, 0
  br i1 %6737, label %6791, label %6738

6738:                                             ; preds = %6736, %6738
  %6739 = phi i32 [ %6749, %6738 ], [ 0, %6736 ]
  %6740 = phi i64 [ %6748, %6738 ], [ 0, %6736 ]
  %6741 = zext i32 %6739 to i64
  %6742 = getelementptr inbounds i8, i8 addrspace(4)* %6732, i64 %6741
  %6743 = load i8, i8 addrspace(4)* %6742, align 1, !tbaa !14
  %6744 = zext i8 %6743 to i64
  %6745 = shl i32 %6739, 3
  %6746 = zext i32 %6745 to i64
  %6747 = shl nuw i64 %6744, %6746
  %6748 = or i64 %6747, %6740
  %6749 = add nuw nsw i32 %6739, 1
  %6750 = icmp eq i32 %6749, %6733
  br i1 %6750, label %6791, label %6738

6751:                                             ; preds = %6731
  %6752 = load i8, i8 addrspace(4)* %6732, align 1, !tbaa !14
  %6753 = zext i8 %6752 to i64
  %6754 = getelementptr inbounds i8, i8 addrspace(4)* %6732, i64 1
  %6755 = load i8, i8 addrspace(4)* %6754, align 1, !tbaa !14
  %6756 = zext i8 %6755 to i64
  %6757 = shl nuw nsw i64 %6756, 8
  %6758 = or i64 %6757, %6753
  %6759 = getelementptr inbounds i8, i8 addrspace(4)* %6732, i64 2
  %6760 = load i8, i8 addrspace(4)* %6759, align 1, !tbaa !14
  %6761 = zext i8 %6760 to i64
  %6762 = shl nuw nsw i64 %6761, 16
  %6763 = or i64 %6758, %6762
  %6764 = getelementptr inbounds i8, i8 addrspace(4)* %6732, i64 3
  %6765 = load i8, i8 addrspace(4)* %6764, align 1, !tbaa !14
  %6766 = zext i8 %6765 to i64
  %6767 = shl nuw nsw i64 %6766, 24
  %6768 = or i64 %6763, %6767
  %6769 = getelementptr inbounds i8, i8 addrspace(4)* %6732, i64 4
  %6770 = load i8, i8 addrspace(4)* %6769, align 1, !tbaa !14
  %6771 = zext i8 %6770 to i64
  %6772 = shl nuw nsw i64 %6771, 32
  %6773 = or i64 %6768, %6772
  %6774 = getelementptr inbounds i8, i8 addrspace(4)* %6732, i64 5
  %6775 = load i8, i8 addrspace(4)* %6774, align 1, !tbaa !14
  %6776 = zext i8 %6775 to i64
  %6777 = shl nuw nsw i64 %6776, 40
  %6778 = or i64 %6773, %6777
  %6779 = getelementptr inbounds i8, i8 addrspace(4)* %6732, i64 6
  %6780 = load i8, i8 addrspace(4)* %6779, align 1, !tbaa !14
  %6781 = zext i8 %6780 to i64
  %6782 = shl nuw nsw i64 %6781, 48
  %6783 = or i64 %6778, %6782
  %6784 = getelementptr inbounds i8, i8 addrspace(4)* %6732, i64 7
  %6785 = load i8, i8 addrspace(4)* %6784, align 1, !tbaa !14
  %6786 = zext i8 %6785 to i64
  %6787 = shl nuw i64 %6786, 56
  %6788 = or i64 %6783, %6787
  %6789 = add nsw i32 %6733, -8
  %6790 = getelementptr inbounds i8, i8 addrspace(4)* %6732, i64 8
  br label %6791

6791:                                             ; preds = %6738, %6751, %6736
  %6792 = phi i8 addrspace(4)* [ %6790, %6751 ], [ %6732, %6736 ], [ %6732, %6738 ]
  %6793 = phi i32 [ %6789, %6751 ], [ 0, %6736 ], [ 0, %6738 ]
  %6794 = phi i64 [ %6788, %6751 ], [ 0, %6736 ], [ %6748, %6738 ]
  %6795 = icmp ugt i32 %6793, 7
  br i1 %6795, label %6811, label %6796

6796:                                             ; preds = %6791
  %6797 = icmp eq i32 %6793, 0
  br i1 %6797, label %6849, label %6798

6798:                                             ; preds = %6796, %6798
  %6799 = phi i32 [ %6809, %6798 ], [ 0, %6796 ]
  %6800 = phi i64 [ %6808, %6798 ], [ 0, %6796 ]
  %6801 = zext i32 %6799 to i64
  %6802 = getelementptr inbounds i8, i8 addrspace(4)* %6792, i64 %6801
  %6803 = load i8, i8 addrspace(4)* %6802, align 1, !tbaa !14
  %6804 = zext i8 %6803 to i64
  %6805 = shl i32 %6799, 3
  %6806 = zext i32 %6805 to i64
  %6807 = shl nuw i64 %6804, %6806
  %6808 = or i64 %6807, %6800
  %6809 = add nuw nsw i32 %6799, 1
  %6810 = icmp eq i32 %6809, %6793
  br i1 %6810, label %6849, label %6798

6811:                                             ; preds = %6791
  %6812 = load i8, i8 addrspace(4)* %6792, align 1, !tbaa !14
  %6813 = zext i8 %6812 to i64
  %6814 = getelementptr inbounds i8, i8 addrspace(4)* %6792, i64 1
  %6815 = load i8, i8 addrspace(4)* %6814, align 1, !tbaa !14
  %6816 = zext i8 %6815 to i64
  %6817 = shl nuw nsw i64 %6816, 8
  %6818 = or i64 %6817, %6813
  %6819 = getelementptr inbounds i8, i8 addrspace(4)* %6792, i64 2
  %6820 = load i8, i8 addrspace(4)* %6819, align 1, !tbaa !14
  %6821 = zext i8 %6820 to i64
  %6822 = shl nuw nsw i64 %6821, 16
  %6823 = or i64 %6818, %6822
  %6824 = getelementptr inbounds i8, i8 addrspace(4)* %6792, i64 3
  %6825 = load i8, i8 addrspace(4)* %6824, align 1, !tbaa !14
  %6826 = zext i8 %6825 to i64
  %6827 = shl nuw nsw i64 %6826, 24
  %6828 = or i64 %6823, %6827
  %6829 = getelementptr inbounds i8, i8 addrspace(4)* %6792, i64 4
  %6830 = load i8, i8 addrspace(4)* %6829, align 1, !tbaa !14
  %6831 = zext i8 %6830 to i64
  %6832 = shl nuw nsw i64 %6831, 32
  %6833 = or i64 %6828, %6832
  %6834 = getelementptr inbounds i8, i8 addrspace(4)* %6792, i64 5
  %6835 = load i8, i8 addrspace(4)* %6834, align 1, !tbaa !14
  %6836 = zext i8 %6835 to i64
  %6837 = shl nuw nsw i64 %6836, 40
  %6838 = or i64 %6833, %6837
  %6839 = getelementptr inbounds i8, i8 addrspace(4)* %6792, i64 6
  %6840 = load i8, i8 addrspace(4)* %6839, align 1, !tbaa !14
  %6841 = zext i8 %6840 to i64
  %6842 = shl nuw nsw i64 %6841, 48
  %6843 = or i64 %6838, %6842
  %6844 = getelementptr inbounds i8, i8 addrspace(4)* %6792, i64 7
  %6845 = load i8, i8 addrspace(4)* %6844, align 1, !tbaa !14
  %6846 = zext i8 %6845 to i64
  %6847 = shl nuw i64 %6846, 56
  %6848 = or i64 %6843, %6847
  br label %6849

6849:                                             ; preds = %6798, %6811, %6796
  %6850 = phi i64 [ %6848, %6811 ], [ 0, %6796 ], [ %6808, %6798 ]
  %6851 = shl nuw nsw i64 %6432, 2
  %6852 = add nuw nsw i64 %6851, 28
  %6853 = and i64 %6852, 480
  %6854 = and i64 %6434, -225
  %6855 = or i64 %6854, %6853
  %6856 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %5504, i64 noundef %6855, i64 noundef %6494, i64 noundef %6554, i64 noundef %6614, i64 noundef %6674, i64 noundef %6734, i64 noundef %6794, i64 noundef %6850) #11
  %6857 = sub i64 %6424, %6432
  %6858 = getelementptr inbounds i8, i8 addrspace(4)* %6425, i64 %6432
  %6859 = icmp eq i64 %6857, 0
  br i1 %6859, label %6864, label %6423

6860:                                             ; preds = %6408
  %6861 = and i64 %6418, -225
  %6862 = or i64 %6861, 32
  %6863 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %5504, i64 noundef %6862, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  br label %6864

6864:                                             ; preds = %6849, %6860
  %6865 = phi <2 x i64> [ %6863, %6860 ], [ %6856, %6849 ]
  %6866 = extractelement <2 x i64> %6865, i64 0
  %6867 = and i64 %6866, -227
  %6868 = or i64 %6867, 34
  %6869 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %5504, i64 noundef %6868, i64 noundef 2, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %6870 = load i32, i32 addrspace(3)* getelementptr inbounds ([0 x i32], [0 x i32] addrspace(3)* @seme, i32 0, i32 2), align 4, !tbaa !5
  %6871 = load i32, i32 addrspace(1)* %5499, align 4, !tbaa !5
  %6872 = mul nsw i32 %6871, %6870
  store i32 %6872, i32 addrspace(1)* %5499, align 4, !tbaa !5
  %6873 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %5504, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %6874 = extractelement <2 x i64> %6873, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([21 x i8], [21 x i8] addrspace(4)* @.str.3, i64 0, i64 0) to i8*), i8* null), label %7316, label %6875

6875:                                             ; preds = %6864
  %6876 = and i64 %6874, 2
  %6877 = and i64 %6874, -3
  %6878 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %6877, i64 0
  br label %6879

6879:                                             ; preds = %7305, %6875
  %6880 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([21 x i8], [21 x i8] addrspace(4)* @.str.3, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([21 x i8], [21 x i8] addrspace(4)* @.str.3, i64 0, i64 20) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([21 x i8]* addrspacecast ([21 x i8] addrspace(4)* @.str.3 to [21 x i8]*) to i64)), i64 1))), %6875 ], [ %7313, %7305 ]
  %6881 = phi i8 addrspace(4)* [ getelementptr inbounds ([21 x i8], [21 x i8] addrspace(4)* @.str.3, i64 0, i64 0), %6875 ], [ %7314, %7305 ]
  %6882 = phi <2 x i64> [ %6878, %6875 ], [ %7312, %7305 ]
  %6883 = icmp ugt i64 %6880, 56
  %6884 = extractelement <2 x i64> %6882, i64 0
  %6885 = or i64 %6884, %6876
  %6886 = insertelement <2 x i64> poison, i64 %6885, i64 0
  %6887 = select i1 %6883, <2 x i64> %6882, <2 x i64> %6886
  %6888 = tail call i64 @llvm.umin.i64(i64 %6880, i64 56)
  %6889 = trunc i64 %6888 to i32
  %6890 = extractelement <2 x i64> %6887, i64 0
  %6891 = icmp ugt i32 %6889, 7
  br i1 %6891, label %6907, label %6892

6892:                                             ; preds = %6879
  %6893 = icmp eq i32 %6889, 0
  br i1 %6893, label %6947, label %6894

6894:                                             ; preds = %6892, %6894
  %6895 = phi i32 [ %6905, %6894 ], [ 0, %6892 ]
  %6896 = phi i64 [ %6904, %6894 ], [ 0, %6892 ]
  %6897 = zext i32 %6895 to i64
  %6898 = getelementptr inbounds i8, i8 addrspace(4)* %6881, i64 %6897
  %6899 = load i8, i8 addrspace(4)* %6898, align 1, !tbaa !14
  %6900 = zext i8 %6899 to i64
  %6901 = shl i32 %6895, 3
  %6902 = zext i32 %6901 to i64
  %6903 = shl nuw i64 %6900, %6902
  %6904 = or i64 %6903, %6896
  %6905 = add nuw nsw i32 %6895, 1
  %6906 = icmp eq i32 %6905, %6889
  br i1 %6906, label %6947, label %6894, !llvm.loop !15

6907:                                             ; preds = %6879
  %6908 = load i8, i8 addrspace(4)* %6881, align 1, !tbaa !14
  %6909 = zext i8 %6908 to i64
  %6910 = getelementptr inbounds i8, i8 addrspace(4)* %6881, i64 1
  %6911 = load i8, i8 addrspace(4)* %6910, align 1, !tbaa !14
  %6912 = zext i8 %6911 to i64
  %6913 = shl nuw nsw i64 %6912, 8
  %6914 = or i64 %6913, %6909
  %6915 = getelementptr inbounds i8, i8 addrspace(4)* %6881, i64 2
  %6916 = load i8, i8 addrspace(4)* %6915, align 1, !tbaa !14
  %6917 = zext i8 %6916 to i64
  %6918 = shl nuw nsw i64 %6917, 16
  %6919 = or i64 %6914, %6918
  %6920 = getelementptr inbounds i8, i8 addrspace(4)* %6881, i64 3
  %6921 = load i8, i8 addrspace(4)* %6920, align 1, !tbaa !14
  %6922 = zext i8 %6921 to i64
  %6923 = shl nuw nsw i64 %6922, 24
  %6924 = or i64 %6919, %6923
  %6925 = getelementptr inbounds i8, i8 addrspace(4)* %6881, i64 4
  %6926 = load i8, i8 addrspace(4)* %6925, align 1, !tbaa !14
  %6927 = zext i8 %6926 to i64
  %6928 = shl nuw nsw i64 %6927, 32
  %6929 = or i64 %6924, %6928
  %6930 = getelementptr inbounds i8, i8 addrspace(4)* %6881, i64 5
  %6931 = load i8, i8 addrspace(4)* %6930, align 1, !tbaa !14
  %6932 = zext i8 %6931 to i64
  %6933 = shl nuw nsw i64 %6932, 40
  %6934 = or i64 %6929, %6933
  %6935 = getelementptr inbounds i8, i8 addrspace(4)* %6881, i64 6
  %6936 = load i8, i8 addrspace(4)* %6935, align 1, !tbaa !14
  %6937 = zext i8 %6936 to i64
  %6938 = shl nuw nsw i64 %6937, 48
  %6939 = or i64 %6934, %6938
  %6940 = getelementptr inbounds i8, i8 addrspace(4)* %6881, i64 7
  %6941 = load i8, i8 addrspace(4)* %6940, align 1, !tbaa !14
  %6942 = zext i8 %6941 to i64
  %6943 = shl nuw i64 %6942, 56
  %6944 = or i64 %6939, %6943
  %6945 = add nsw i32 %6889, -8
  %6946 = getelementptr inbounds i8, i8 addrspace(4)* %6881, i64 8
  br label %6947

6947:                                             ; preds = %6894, %6907, %6892
  %6948 = phi i8 addrspace(4)* [ %6946, %6907 ], [ %6881, %6892 ], [ %6881, %6894 ]
  %6949 = phi i32 [ %6945, %6907 ], [ 0, %6892 ], [ 0, %6894 ]
  %6950 = phi i64 [ %6944, %6907 ], [ 0, %6892 ], [ %6904, %6894 ]
  %6951 = icmp ugt i32 %6949, 7
  br i1 %6951, label %6967, label %6952

6952:                                             ; preds = %6947
  %6953 = icmp eq i32 %6949, 0
  br i1 %6953, label %7007, label %6954

6954:                                             ; preds = %6952, %6954
  %6955 = phi i32 [ %6965, %6954 ], [ 0, %6952 ]
  %6956 = phi i64 [ %6964, %6954 ], [ 0, %6952 ]
  %6957 = zext i32 %6955 to i64
  %6958 = getelementptr inbounds i8, i8 addrspace(4)* %6948, i64 %6957
  %6959 = load i8, i8 addrspace(4)* %6958, align 1, !tbaa !14
  %6960 = zext i8 %6959 to i64
  %6961 = shl i32 %6955, 3
  %6962 = zext i32 %6961 to i64
  %6963 = shl nuw i64 %6960, %6962
  %6964 = or i64 %6963, %6956
  %6965 = add nuw nsw i32 %6955, 1
  %6966 = icmp eq i32 %6965, %6949
  br i1 %6966, label %7007, label %6954

6967:                                             ; preds = %6947
  %6968 = load i8, i8 addrspace(4)* %6948, align 1, !tbaa !14
  %6969 = zext i8 %6968 to i64
  %6970 = getelementptr inbounds i8, i8 addrspace(4)* %6948, i64 1
  %6971 = load i8, i8 addrspace(4)* %6970, align 1, !tbaa !14
  %6972 = zext i8 %6971 to i64
  %6973 = shl nuw nsw i64 %6972, 8
  %6974 = or i64 %6973, %6969
  %6975 = getelementptr inbounds i8, i8 addrspace(4)* %6948, i64 2
  %6976 = load i8, i8 addrspace(4)* %6975, align 1, !tbaa !14
  %6977 = zext i8 %6976 to i64
  %6978 = shl nuw nsw i64 %6977, 16
  %6979 = or i64 %6974, %6978
  %6980 = getelementptr inbounds i8, i8 addrspace(4)* %6948, i64 3
  %6981 = load i8, i8 addrspace(4)* %6980, align 1, !tbaa !14
  %6982 = zext i8 %6981 to i64
  %6983 = shl nuw nsw i64 %6982, 24
  %6984 = or i64 %6979, %6983
  %6985 = getelementptr inbounds i8, i8 addrspace(4)* %6948, i64 4
  %6986 = load i8, i8 addrspace(4)* %6985, align 1, !tbaa !14
  %6987 = zext i8 %6986 to i64
  %6988 = shl nuw nsw i64 %6987, 32
  %6989 = or i64 %6984, %6988
  %6990 = getelementptr inbounds i8, i8 addrspace(4)* %6948, i64 5
  %6991 = load i8, i8 addrspace(4)* %6990, align 1, !tbaa !14
  %6992 = zext i8 %6991 to i64
  %6993 = shl nuw nsw i64 %6992, 40
  %6994 = or i64 %6989, %6993
  %6995 = getelementptr inbounds i8, i8 addrspace(4)* %6948, i64 6
  %6996 = load i8, i8 addrspace(4)* %6995, align 1, !tbaa !14
  %6997 = zext i8 %6996 to i64
  %6998 = shl nuw nsw i64 %6997, 48
  %6999 = or i64 %6994, %6998
  %7000 = getelementptr inbounds i8, i8 addrspace(4)* %6948, i64 7
  %7001 = load i8, i8 addrspace(4)* %7000, align 1, !tbaa !14
  %7002 = zext i8 %7001 to i64
  %7003 = shl nuw i64 %7002, 56
  %7004 = or i64 %6999, %7003
  %7005 = add nsw i32 %6949, -8
  %7006 = getelementptr inbounds i8, i8 addrspace(4)* %6948, i64 8
  br label %7007

7007:                                             ; preds = %6954, %6967, %6952
  %7008 = phi i8 addrspace(4)* [ %7006, %6967 ], [ %6948, %6952 ], [ %6948, %6954 ]
  %7009 = phi i32 [ %7005, %6967 ], [ 0, %6952 ], [ 0, %6954 ]
  %7010 = phi i64 [ %7004, %6967 ], [ 0, %6952 ], [ %6964, %6954 ]
  %7011 = icmp ugt i32 %7009, 7
  br i1 %7011, label %7027, label %7012

7012:                                             ; preds = %7007
  %7013 = icmp eq i32 %7009, 0
  br i1 %7013, label %7067, label %7014

7014:                                             ; preds = %7012, %7014
  %7015 = phi i32 [ %7025, %7014 ], [ 0, %7012 ]
  %7016 = phi i64 [ %7024, %7014 ], [ 0, %7012 ]
  %7017 = zext i32 %7015 to i64
  %7018 = getelementptr inbounds i8, i8 addrspace(4)* %7008, i64 %7017
  %7019 = load i8, i8 addrspace(4)* %7018, align 1, !tbaa !14
  %7020 = zext i8 %7019 to i64
  %7021 = shl i32 %7015, 3
  %7022 = zext i32 %7021 to i64
  %7023 = shl nuw i64 %7020, %7022
  %7024 = or i64 %7023, %7016
  %7025 = add nuw nsw i32 %7015, 1
  %7026 = icmp eq i32 %7025, %7009
  br i1 %7026, label %7067, label %7014

7027:                                             ; preds = %7007
  %7028 = load i8, i8 addrspace(4)* %7008, align 1, !tbaa !14
  %7029 = zext i8 %7028 to i64
  %7030 = getelementptr inbounds i8, i8 addrspace(4)* %7008, i64 1
  %7031 = load i8, i8 addrspace(4)* %7030, align 1, !tbaa !14
  %7032 = zext i8 %7031 to i64
  %7033 = shl nuw nsw i64 %7032, 8
  %7034 = or i64 %7033, %7029
  %7035 = getelementptr inbounds i8, i8 addrspace(4)* %7008, i64 2
  %7036 = load i8, i8 addrspace(4)* %7035, align 1, !tbaa !14
  %7037 = zext i8 %7036 to i64
  %7038 = shl nuw nsw i64 %7037, 16
  %7039 = or i64 %7034, %7038
  %7040 = getelementptr inbounds i8, i8 addrspace(4)* %7008, i64 3
  %7041 = load i8, i8 addrspace(4)* %7040, align 1, !tbaa !14
  %7042 = zext i8 %7041 to i64
  %7043 = shl nuw nsw i64 %7042, 24
  %7044 = or i64 %7039, %7043
  %7045 = getelementptr inbounds i8, i8 addrspace(4)* %7008, i64 4
  %7046 = load i8, i8 addrspace(4)* %7045, align 1, !tbaa !14
  %7047 = zext i8 %7046 to i64
  %7048 = shl nuw nsw i64 %7047, 32
  %7049 = or i64 %7044, %7048
  %7050 = getelementptr inbounds i8, i8 addrspace(4)* %7008, i64 5
  %7051 = load i8, i8 addrspace(4)* %7050, align 1, !tbaa !14
  %7052 = zext i8 %7051 to i64
  %7053 = shl nuw nsw i64 %7052, 40
  %7054 = or i64 %7049, %7053
  %7055 = getelementptr inbounds i8, i8 addrspace(4)* %7008, i64 6
  %7056 = load i8, i8 addrspace(4)* %7055, align 1, !tbaa !14
  %7057 = zext i8 %7056 to i64
  %7058 = shl nuw nsw i64 %7057, 48
  %7059 = or i64 %7054, %7058
  %7060 = getelementptr inbounds i8, i8 addrspace(4)* %7008, i64 7
  %7061 = load i8, i8 addrspace(4)* %7060, align 1, !tbaa !14
  %7062 = zext i8 %7061 to i64
  %7063 = shl nuw i64 %7062, 56
  %7064 = or i64 %7059, %7063
  %7065 = add nsw i32 %7009, -8
  %7066 = getelementptr inbounds i8, i8 addrspace(4)* %7008, i64 8
  br label %7067

7067:                                             ; preds = %7014, %7027, %7012
  %7068 = phi i8 addrspace(4)* [ %7066, %7027 ], [ %7008, %7012 ], [ %7008, %7014 ]
  %7069 = phi i32 [ %7065, %7027 ], [ 0, %7012 ], [ 0, %7014 ]
  %7070 = phi i64 [ %7064, %7027 ], [ 0, %7012 ], [ %7024, %7014 ]
  %7071 = icmp ugt i32 %7069, 7
  br i1 %7071, label %7087, label %7072

7072:                                             ; preds = %7067
  %7073 = icmp eq i32 %7069, 0
  br i1 %7073, label %7127, label %7074

7074:                                             ; preds = %7072, %7074
  %7075 = phi i32 [ %7085, %7074 ], [ 0, %7072 ]
  %7076 = phi i64 [ %7084, %7074 ], [ 0, %7072 ]
  %7077 = zext i32 %7075 to i64
  %7078 = getelementptr inbounds i8, i8 addrspace(4)* %7068, i64 %7077
  %7079 = load i8, i8 addrspace(4)* %7078, align 1, !tbaa !14
  %7080 = zext i8 %7079 to i64
  %7081 = shl i32 %7075, 3
  %7082 = zext i32 %7081 to i64
  %7083 = shl nuw i64 %7080, %7082
  %7084 = or i64 %7083, %7076
  %7085 = add nuw nsw i32 %7075, 1
  %7086 = icmp eq i32 %7085, %7069
  br i1 %7086, label %7127, label %7074

7087:                                             ; preds = %7067
  %7088 = load i8, i8 addrspace(4)* %7068, align 1, !tbaa !14
  %7089 = zext i8 %7088 to i64
  %7090 = getelementptr inbounds i8, i8 addrspace(4)* %7068, i64 1
  %7091 = load i8, i8 addrspace(4)* %7090, align 1, !tbaa !14
  %7092 = zext i8 %7091 to i64
  %7093 = shl nuw nsw i64 %7092, 8
  %7094 = or i64 %7093, %7089
  %7095 = getelementptr inbounds i8, i8 addrspace(4)* %7068, i64 2
  %7096 = load i8, i8 addrspace(4)* %7095, align 1, !tbaa !14
  %7097 = zext i8 %7096 to i64
  %7098 = shl nuw nsw i64 %7097, 16
  %7099 = or i64 %7094, %7098
  %7100 = getelementptr inbounds i8, i8 addrspace(4)* %7068, i64 3
  %7101 = load i8, i8 addrspace(4)* %7100, align 1, !tbaa !14
  %7102 = zext i8 %7101 to i64
  %7103 = shl nuw nsw i64 %7102, 24
  %7104 = or i64 %7099, %7103
  %7105 = getelementptr inbounds i8, i8 addrspace(4)* %7068, i64 4
  %7106 = load i8, i8 addrspace(4)* %7105, align 1, !tbaa !14
  %7107 = zext i8 %7106 to i64
  %7108 = shl nuw nsw i64 %7107, 32
  %7109 = or i64 %7104, %7108
  %7110 = getelementptr inbounds i8, i8 addrspace(4)* %7068, i64 5
  %7111 = load i8, i8 addrspace(4)* %7110, align 1, !tbaa !14
  %7112 = zext i8 %7111 to i64
  %7113 = shl nuw nsw i64 %7112, 40
  %7114 = or i64 %7109, %7113
  %7115 = getelementptr inbounds i8, i8 addrspace(4)* %7068, i64 6
  %7116 = load i8, i8 addrspace(4)* %7115, align 1, !tbaa !14
  %7117 = zext i8 %7116 to i64
  %7118 = shl nuw nsw i64 %7117, 48
  %7119 = or i64 %7114, %7118
  %7120 = getelementptr inbounds i8, i8 addrspace(4)* %7068, i64 7
  %7121 = load i8, i8 addrspace(4)* %7120, align 1, !tbaa !14
  %7122 = zext i8 %7121 to i64
  %7123 = shl nuw i64 %7122, 56
  %7124 = or i64 %7119, %7123
  %7125 = add nsw i32 %7069, -8
  %7126 = getelementptr inbounds i8, i8 addrspace(4)* %7068, i64 8
  br label %7127

7127:                                             ; preds = %7074, %7087, %7072
  %7128 = phi i8 addrspace(4)* [ %7126, %7087 ], [ %7068, %7072 ], [ %7068, %7074 ]
  %7129 = phi i32 [ %7125, %7087 ], [ 0, %7072 ], [ 0, %7074 ]
  %7130 = phi i64 [ %7124, %7087 ], [ 0, %7072 ], [ %7084, %7074 ]
  %7131 = icmp ugt i32 %7129, 7
  br i1 %7131, label %7147, label %7132

7132:                                             ; preds = %7127
  %7133 = icmp eq i32 %7129, 0
  br i1 %7133, label %7187, label %7134

7134:                                             ; preds = %7132, %7134
  %7135 = phi i32 [ %7145, %7134 ], [ 0, %7132 ]
  %7136 = phi i64 [ %7144, %7134 ], [ 0, %7132 ]
  %7137 = zext i32 %7135 to i64
  %7138 = getelementptr inbounds i8, i8 addrspace(4)* %7128, i64 %7137
  %7139 = load i8, i8 addrspace(4)* %7138, align 1, !tbaa !14
  %7140 = zext i8 %7139 to i64
  %7141 = shl i32 %7135, 3
  %7142 = zext i32 %7141 to i64
  %7143 = shl nuw i64 %7140, %7142
  %7144 = or i64 %7143, %7136
  %7145 = add nuw nsw i32 %7135, 1
  %7146 = icmp eq i32 %7145, %7129
  br i1 %7146, label %7187, label %7134

7147:                                             ; preds = %7127
  %7148 = load i8, i8 addrspace(4)* %7128, align 1, !tbaa !14
  %7149 = zext i8 %7148 to i64
  %7150 = getelementptr inbounds i8, i8 addrspace(4)* %7128, i64 1
  %7151 = load i8, i8 addrspace(4)* %7150, align 1, !tbaa !14
  %7152 = zext i8 %7151 to i64
  %7153 = shl nuw nsw i64 %7152, 8
  %7154 = or i64 %7153, %7149
  %7155 = getelementptr inbounds i8, i8 addrspace(4)* %7128, i64 2
  %7156 = load i8, i8 addrspace(4)* %7155, align 1, !tbaa !14
  %7157 = zext i8 %7156 to i64
  %7158 = shl nuw nsw i64 %7157, 16
  %7159 = or i64 %7154, %7158
  %7160 = getelementptr inbounds i8, i8 addrspace(4)* %7128, i64 3
  %7161 = load i8, i8 addrspace(4)* %7160, align 1, !tbaa !14
  %7162 = zext i8 %7161 to i64
  %7163 = shl nuw nsw i64 %7162, 24
  %7164 = or i64 %7159, %7163
  %7165 = getelementptr inbounds i8, i8 addrspace(4)* %7128, i64 4
  %7166 = load i8, i8 addrspace(4)* %7165, align 1, !tbaa !14
  %7167 = zext i8 %7166 to i64
  %7168 = shl nuw nsw i64 %7167, 32
  %7169 = or i64 %7164, %7168
  %7170 = getelementptr inbounds i8, i8 addrspace(4)* %7128, i64 5
  %7171 = load i8, i8 addrspace(4)* %7170, align 1, !tbaa !14
  %7172 = zext i8 %7171 to i64
  %7173 = shl nuw nsw i64 %7172, 40
  %7174 = or i64 %7169, %7173
  %7175 = getelementptr inbounds i8, i8 addrspace(4)* %7128, i64 6
  %7176 = load i8, i8 addrspace(4)* %7175, align 1, !tbaa !14
  %7177 = zext i8 %7176 to i64
  %7178 = shl nuw nsw i64 %7177, 48
  %7179 = or i64 %7174, %7178
  %7180 = getelementptr inbounds i8, i8 addrspace(4)* %7128, i64 7
  %7181 = load i8, i8 addrspace(4)* %7180, align 1, !tbaa !14
  %7182 = zext i8 %7181 to i64
  %7183 = shl nuw i64 %7182, 56
  %7184 = or i64 %7179, %7183
  %7185 = add nsw i32 %7129, -8
  %7186 = getelementptr inbounds i8, i8 addrspace(4)* %7128, i64 8
  br label %7187

7187:                                             ; preds = %7134, %7147, %7132
  %7188 = phi i8 addrspace(4)* [ %7186, %7147 ], [ %7128, %7132 ], [ %7128, %7134 ]
  %7189 = phi i32 [ %7185, %7147 ], [ 0, %7132 ], [ 0, %7134 ]
  %7190 = phi i64 [ %7184, %7147 ], [ 0, %7132 ], [ %7144, %7134 ]
  %7191 = icmp ugt i32 %7189, 7
  br i1 %7191, label %7207, label %7192

7192:                                             ; preds = %7187
  %7193 = icmp eq i32 %7189, 0
  br i1 %7193, label %7247, label %7194

7194:                                             ; preds = %7192, %7194
  %7195 = phi i32 [ %7205, %7194 ], [ 0, %7192 ]
  %7196 = phi i64 [ %7204, %7194 ], [ 0, %7192 ]
  %7197 = zext i32 %7195 to i64
  %7198 = getelementptr inbounds i8, i8 addrspace(4)* %7188, i64 %7197
  %7199 = load i8, i8 addrspace(4)* %7198, align 1, !tbaa !14
  %7200 = zext i8 %7199 to i64
  %7201 = shl i32 %7195, 3
  %7202 = zext i32 %7201 to i64
  %7203 = shl nuw i64 %7200, %7202
  %7204 = or i64 %7203, %7196
  %7205 = add nuw nsw i32 %7195, 1
  %7206 = icmp eq i32 %7205, %7189
  br i1 %7206, label %7247, label %7194

7207:                                             ; preds = %7187
  %7208 = load i8, i8 addrspace(4)* %7188, align 1, !tbaa !14
  %7209 = zext i8 %7208 to i64
  %7210 = getelementptr inbounds i8, i8 addrspace(4)* %7188, i64 1
  %7211 = load i8, i8 addrspace(4)* %7210, align 1, !tbaa !14
  %7212 = zext i8 %7211 to i64
  %7213 = shl nuw nsw i64 %7212, 8
  %7214 = or i64 %7213, %7209
  %7215 = getelementptr inbounds i8, i8 addrspace(4)* %7188, i64 2
  %7216 = load i8, i8 addrspace(4)* %7215, align 1, !tbaa !14
  %7217 = zext i8 %7216 to i64
  %7218 = shl nuw nsw i64 %7217, 16
  %7219 = or i64 %7214, %7218
  %7220 = getelementptr inbounds i8, i8 addrspace(4)* %7188, i64 3
  %7221 = load i8, i8 addrspace(4)* %7220, align 1, !tbaa !14
  %7222 = zext i8 %7221 to i64
  %7223 = shl nuw nsw i64 %7222, 24
  %7224 = or i64 %7219, %7223
  %7225 = getelementptr inbounds i8, i8 addrspace(4)* %7188, i64 4
  %7226 = load i8, i8 addrspace(4)* %7225, align 1, !tbaa !14
  %7227 = zext i8 %7226 to i64
  %7228 = shl nuw nsw i64 %7227, 32
  %7229 = or i64 %7224, %7228
  %7230 = getelementptr inbounds i8, i8 addrspace(4)* %7188, i64 5
  %7231 = load i8, i8 addrspace(4)* %7230, align 1, !tbaa !14
  %7232 = zext i8 %7231 to i64
  %7233 = shl nuw nsw i64 %7232, 40
  %7234 = or i64 %7229, %7233
  %7235 = getelementptr inbounds i8, i8 addrspace(4)* %7188, i64 6
  %7236 = load i8, i8 addrspace(4)* %7235, align 1, !tbaa !14
  %7237 = zext i8 %7236 to i64
  %7238 = shl nuw nsw i64 %7237, 48
  %7239 = or i64 %7234, %7238
  %7240 = getelementptr inbounds i8, i8 addrspace(4)* %7188, i64 7
  %7241 = load i8, i8 addrspace(4)* %7240, align 1, !tbaa !14
  %7242 = zext i8 %7241 to i64
  %7243 = shl nuw i64 %7242, 56
  %7244 = or i64 %7239, %7243
  %7245 = add nsw i32 %7189, -8
  %7246 = getelementptr inbounds i8, i8 addrspace(4)* %7188, i64 8
  br label %7247

7247:                                             ; preds = %7194, %7207, %7192
  %7248 = phi i8 addrspace(4)* [ %7246, %7207 ], [ %7188, %7192 ], [ %7188, %7194 ]
  %7249 = phi i32 [ %7245, %7207 ], [ 0, %7192 ], [ 0, %7194 ]
  %7250 = phi i64 [ %7244, %7207 ], [ 0, %7192 ], [ %7204, %7194 ]
  %7251 = icmp ugt i32 %7249, 7
  br i1 %7251, label %7267, label %7252

7252:                                             ; preds = %7247
  %7253 = icmp eq i32 %7249, 0
  br i1 %7253, label %7305, label %7254

7254:                                             ; preds = %7252, %7254
  %7255 = phi i32 [ %7265, %7254 ], [ 0, %7252 ]
  %7256 = phi i64 [ %7264, %7254 ], [ 0, %7252 ]
  %7257 = zext i32 %7255 to i64
  %7258 = getelementptr inbounds i8, i8 addrspace(4)* %7248, i64 %7257
  %7259 = load i8, i8 addrspace(4)* %7258, align 1, !tbaa !14
  %7260 = zext i8 %7259 to i64
  %7261 = shl i32 %7255, 3
  %7262 = zext i32 %7261 to i64
  %7263 = shl nuw i64 %7260, %7262
  %7264 = or i64 %7263, %7256
  %7265 = add nuw nsw i32 %7255, 1
  %7266 = icmp eq i32 %7265, %7249
  br i1 %7266, label %7305, label %7254

7267:                                             ; preds = %7247
  %7268 = load i8, i8 addrspace(4)* %7248, align 1, !tbaa !14
  %7269 = zext i8 %7268 to i64
  %7270 = getelementptr inbounds i8, i8 addrspace(4)* %7248, i64 1
  %7271 = load i8, i8 addrspace(4)* %7270, align 1, !tbaa !14
  %7272 = zext i8 %7271 to i64
  %7273 = shl nuw nsw i64 %7272, 8
  %7274 = or i64 %7273, %7269
  %7275 = getelementptr inbounds i8, i8 addrspace(4)* %7248, i64 2
  %7276 = load i8, i8 addrspace(4)* %7275, align 1, !tbaa !14
  %7277 = zext i8 %7276 to i64
  %7278 = shl nuw nsw i64 %7277, 16
  %7279 = or i64 %7274, %7278
  %7280 = getelementptr inbounds i8, i8 addrspace(4)* %7248, i64 3
  %7281 = load i8, i8 addrspace(4)* %7280, align 1, !tbaa !14
  %7282 = zext i8 %7281 to i64
  %7283 = shl nuw nsw i64 %7282, 24
  %7284 = or i64 %7279, %7283
  %7285 = getelementptr inbounds i8, i8 addrspace(4)* %7248, i64 4
  %7286 = load i8, i8 addrspace(4)* %7285, align 1, !tbaa !14
  %7287 = zext i8 %7286 to i64
  %7288 = shl nuw nsw i64 %7287, 32
  %7289 = or i64 %7284, %7288
  %7290 = getelementptr inbounds i8, i8 addrspace(4)* %7248, i64 5
  %7291 = load i8, i8 addrspace(4)* %7290, align 1, !tbaa !14
  %7292 = zext i8 %7291 to i64
  %7293 = shl nuw nsw i64 %7292, 40
  %7294 = or i64 %7289, %7293
  %7295 = getelementptr inbounds i8, i8 addrspace(4)* %7248, i64 6
  %7296 = load i8, i8 addrspace(4)* %7295, align 1, !tbaa !14
  %7297 = zext i8 %7296 to i64
  %7298 = shl nuw nsw i64 %7297, 48
  %7299 = or i64 %7294, %7298
  %7300 = getelementptr inbounds i8, i8 addrspace(4)* %7248, i64 7
  %7301 = load i8, i8 addrspace(4)* %7300, align 1, !tbaa !14
  %7302 = zext i8 %7301 to i64
  %7303 = shl nuw i64 %7302, 56
  %7304 = or i64 %7299, %7303
  br label %7305

7305:                                             ; preds = %7254, %7267, %7252
  %7306 = phi i64 [ %7304, %7267 ], [ 0, %7252 ], [ %7264, %7254 ]
  %7307 = shl nuw nsw i64 %6888, 2
  %7308 = add nuw nsw i64 %7307, 28
  %7309 = and i64 %7308, 480
  %7310 = and i64 %6890, -225
  %7311 = or i64 %7310, %7309
  %7312 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %5504, i64 noundef %7311, i64 noundef %6950, i64 noundef %7010, i64 noundef %7070, i64 noundef %7130, i64 noundef %7190, i64 noundef %7250, i64 noundef %7306) #11
  %7313 = sub i64 %6880, %6888
  %7314 = getelementptr inbounds i8, i8 addrspace(4)* %6881, i64 %6888
  %7315 = icmp eq i64 %7313, 0
  br i1 %7315, label %7320, label %6879

7316:                                             ; preds = %6864
  %7317 = and i64 %6874, -225
  %7318 = or i64 %7317, 32
  %7319 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %5504, i64 noundef %7318, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  br label %7320

7320:                                             ; preds = %7305, %7316
  %7321 = phi <2 x i64> [ %7319, %7316 ], [ %7312, %7305 ]
  %7322 = extractelement <2 x i64> %7321, i64 0
  %7323 = and i64 %7322, -227
  %7324 = or i64 %7323, 34
  %7325 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %5504, i64 noundef %7324, i64 noundef 3, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %7326 = load i32, i32 addrspace(3)* getelementptr inbounds ([0 x i32], [0 x i32] addrspace(3)* @seme, i32 0, i32 3), align 4, !tbaa !5
  %7327 = load i32, i32 addrspace(1)* %5499, align 4, !tbaa !5
  %7328 = mul nsw i32 %7327, %7326
  store i32 %7328, i32 addrspace(1)* %5499, align 4, !tbaa !5
  %7329 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %5504, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %7330 = extractelement <2 x i64> %7329, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([21 x i8], [21 x i8] addrspace(4)* @.str.3, i64 0, i64 0) to i8*), i8* null), label %7772, label %7331

7331:                                             ; preds = %7320
  %7332 = and i64 %7330, 2
  %7333 = and i64 %7330, -3
  %7334 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %7333, i64 0
  br label %7335

7335:                                             ; preds = %7761, %7331
  %7336 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([21 x i8], [21 x i8] addrspace(4)* @.str.3, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([21 x i8], [21 x i8] addrspace(4)* @.str.3, i64 0, i64 20) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([21 x i8]* addrspacecast ([21 x i8] addrspace(4)* @.str.3 to [21 x i8]*) to i64)), i64 1))), %7331 ], [ %7769, %7761 ]
  %7337 = phi i8 addrspace(4)* [ getelementptr inbounds ([21 x i8], [21 x i8] addrspace(4)* @.str.3, i64 0, i64 0), %7331 ], [ %7770, %7761 ]
  %7338 = phi <2 x i64> [ %7334, %7331 ], [ %7768, %7761 ]
  %7339 = icmp ugt i64 %7336, 56
  %7340 = extractelement <2 x i64> %7338, i64 0
  %7341 = or i64 %7340, %7332
  %7342 = insertelement <2 x i64> poison, i64 %7341, i64 0
  %7343 = select i1 %7339, <2 x i64> %7338, <2 x i64> %7342
  %7344 = tail call i64 @llvm.umin.i64(i64 %7336, i64 56)
  %7345 = trunc i64 %7344 to i32
  %7346 = extractelement <2 x i64> %7343, i64 0
  %7347 = icmp ugt i32 %7345, 7
  br i1 %7347, label %7363, label %7348

7348:                                             ; preds = %7335
  %7349 = icmp eq i32 %7345, 0
  br i1 %7349, label %7403, label %7350

7350:                                             ; preds = %7348, %7350
  %7351 = phi i32 [ %7361, %7350 ], [ 0, %7348 ]
  %7352 = phi i64 [ %7360, %7350 ], [ 0, %7348 ]
  %7353 = zext i32 %7351 to i64
  %7354 = getelementptr inbounds i8, i8 addrspace(4)* %7337, i64 %7353
  %7355 = load i8, i8 addrspace(4)* %7354, align 1, !tbaa !14
  %7356 = zext i8 %7355 to i64
  %7357 = shl i32 %7351, 3
  %7358 = zext i32 %7357 to i64
  %7359 = shl nuw i64 %7356, %7358
  %7360 = or i64 %7359, %7352
  %7361 = add nuw nsw i32 %7351, 1
  %7362 = icmp eq i32 %7361, %7345
  br i1 %7362, label %7403, label %7350, !llvm.loop !15

7363:                                             ; preds = %7335
  %7364 = load i8, i8 addrspace(4)* %7337, align 1, !tbaa !14
  %7365 = zext i8 %7364 to i64
  %7366 = getelementptr inbounds i8, i8 addrspace(4)* %7337, i64 1
  %7367 = load i8, i8 addrspace(4)* %7366, align 1, !tbaa !14
  %7368 = zext i8 %7367 to i64
  %7369 = shl nuw nsw i64 %7368, 8
  %7370 = or i64 %7369, %7365
  %7371 = getelementptr inbounds i8, i8 addrspace(4)* %7337, i64 2
  %7372 = load i8, i8 addrspace(4)* %7371, align 1, !tbaa !14
  %7373 = zext i8 %7372 to i64
  %7374 = shl nuw nsw i64 %7373, 16
  %7375 = or i64 %7370, %7374
  %7376 = getelementptr inbounds i8, i8 addrspace(4)* %7337, i64 3
  %7377 = load i8, i8 addrspace(4)* %7376, align 1, !tbaa !14
  %7378 = zext i8 %7377 to i64
  %7379 = shl nuw nsw i64 %7378, 24
  %7380 = or i64 %7375, %7379
  %7381 = getelementptr inbounds i8, i8 addrspace(4)* %7337, i64 4
  %7382 = load i8, i8 addrspace(4)* %7381, align 1, !tbaa !14
  %7383 = zext i8 %7382 to i64
  %7384 = shl nuw nsw i64 %7383, 32
  %7385 = or i64 %7380, %7384
  %7386 = getelementptr inbounds i8, i8 addrspace(4)* %7337, i64 5
  %7387 = load i8, i8 addrspace(4)* %7386, align 1, !tbaa !14
  %7388 = zext i8 %7387 to i64
  %7389 = shl nuw nsw i64 %7388, 40
  %7390 = or i64 %7385, %7389
  %7391 = getelementptr inbounds i8, i8 addrspace(4)* %7337, i64 6
  %7392 = load i8, i8 addrspace(4)* %7391, align 1, !tbaa !14
  %7393 = zext i8 %7392 to i64
  %7394 = shl nuw nsw i64 %7393, 48
  %7395 = or i64 %7390, %7394
  %7396 = getelementptr inbounds i8, i8 addrspace(4)* %7337, i64 7
  %7397 = load i8, i8 addrspace(4)* %7396, align 1, !tbaa !14
  %7398 = zext i8 %7397 to i64
  %7399 = shl nuw i64 %7398, 56
  %7400 = or i64 %7395, %7399
  %7401 = add nsw i32 %7345, -8
  %7402 = getelementptr inbounds i8, i8 addrspace(4)* %7337, i64 8
  br label %7403

7403:                                             ; preds = %7350, %7363, %7348
  %7404 = phi i8 addrspace(4)* [ %7402, %7363 ], [ %7337, %7348 ], [ %7337, %7350 ]
  %7405 = phi i32 [ %7401, %7363 ], [ 0, %7348 ], [ 0, %7350 ]
  %7406 = phi i64 [ %7400, %7363 ], [ 0, %7348 ], [ %7360, %7350 ]
  %7407 = icmp ugt i32 %7405, 7
  br i1 %7407, label %7423, label %7408

7408:                                             ; preds = %7403
  %7409 = icmp eq i32 %7405, 0
  br i1 %7409, label %7463, label %7410

7410:                                             ; preds = %7408, %7410
  %7411 = phi i32 [ %7421, %7410 ], [ 0, %7408 ]
  %7412 = phi i64 [ %7420, %7410 ], [ 0, %7408 ]
  %7413 = zext i32 %7411 to i64
  %7414 = getelementptr inbounds i8, i8 addrspace(4)* %7404, i64 %7413
  %7415 = load i8, i8 addrspace(4)* %7414, align 1, !tbaa !14
  %7416 = zext i8 %7415 to i64
  %7417 = shl i32 %7411, 3
  %7418 = zext i32 %7417 to i64
  %7419 = shl nuw i64 %7416, %7418
  %7420 = or i64 %7419, %7412
  %7421 = add nuw nsw i32 %7411, 1
  %7422 = icmp eq i32 %7421, %7405
  br i1 %7422, label %7463, label %7410

7423:                                             ; preds = %7403
  %7424 = load i8, i8 addrspace(4)* %7404, align 1, !tbaa !14
  %7425 = zext i8 %7424 to i64
  %7426 = getelementptr inbounds i8, i8 addrspace(4)* %7404, i64 1
  %7427 = load i8, i8 addrspace(4)* %7426, align 1, !tbaa !14
  %7428 = zext i8 %7427 to i64
  %7429 = shl nuw nsw i64 %7428, 8
  %7430 = or i64 %7429, %7425
  %7431 = getelementptr inbounds i8, i8 addrspace(4)* %7404, i64 2
  %7432 = load i8, i8 addrspace(4)* %7431, align 1, !tbaa !14
  %7433 = zext i8 %7432 to i64
  %7434 = shl nuw nsw i64 %7433, 16
  %7435 = or i64 %7430, %7434
  %7436 = getelementptr inbounds i8, i8 addrspace(4)* %7404, i64 3
  %7437 = load i8, i8 addrspace(4)* %7436, align 1, !tbaa !14
  %7438 = zext i8 %7437 to i64
  %7439 = shl nuw nsw i64 %7438, 24
  %7440 = or i64 %7435, %7439
  %7441 = getelementptr inbounds i8, i8 addrspace(4)* %7404, i64 4
  %7442 = load i8, i8 addrspace(4)* %7441, align 1, !tbaa !14
  %7443 = zext i8 %7442 to i64
  %7444 = shl nuw nsw i64 %7443, 32
  %7445 = or i64 %7440, %7444
  %7446 = getelementptr inbounds i8, i8 addrspace(4)* %7404, i64 5
  %7447 = load i8, i8 addrspace(4)* %7446, align 1, !tbaa !14
  %7448 = zext i8 %7447 to i64
  %7449 = shl nuw nsw i64 %7448, 40
  %7450 = or i64 %7445, %7449
  %7451 = getelementptr inbounds i8, i8 addrspace(4)* %7404, i64 6
  %7452 = load i8, i8 addrspace(4)* %7451, align 1, !tbaa !14
  %7453 = zext i8 %7452 to i64
  %7454 = shl nuw nsw i64 %7453, 48
  %7455 = or i64 %7450, %7454
  %7456 = getelementptr inbounds i8, i8 addrspace(4)* %7404, i64 7
  %7457 = load i8, i8 addrspace(4)* %7456, align 1, !tbaa !14
  %7458 = zext i8 %7457 to i64
  %7459 = shl nuw i64 %7458, 56
  %7460 = or i64 %7455, %7459
  %7461 = add nsw i32 %7405, -8
  %7462 = getelementptr inbounds i8, i8 addrspace(4)* %7404, i64 8
  br label %7463

7463:                                             ; preds = %7410, %7423, %7408
  %7464 = phi i8 addrspace(4)* [ %7462, %7423 ], [ %7404, %7408 ], [ %7404, %7410 ]
  %7465 = phi i32 [ %7461, %7423 ], [ 0, %7408 ], [ 0, %7410 ]
  %7466 = phi i64 [ %7460, %7423 ], [ 0, %7408 ], [ %7420, %7410 ]
  %7467 = icmp ugt i32 %7465, 7
  br i1 %7467, label %7483, label %7468

7468:                                             ; preds = %7463
  %7469 = icmp eq i32 %7465, 0
  br i1 %7469, label %7523, label %7470

7470:                                             ; preds = %7468, %7470
  %7471 = phi i32 [ %7481, %7470 ], [ 0, %7468 ]
  %7472 = phi i64 [ %7480, %7470 ], [ 0, %7468 ]
  %7473 = zext i32 %7471 to i64
  %7474 = getelementptr inbounds i8, i8 addrspace(4)* %7464, i64 %7473
  %7475 = load i8, i8 addrspace(4)* %7474, align 1, !tbaa !14
  %7476 = zext i8 %7475 to i64
  %7477 = shl i32 %7471, 3
  %7478 = zext i32 %7477 to i64
  %7479 = shl nuw i64 %7476, %7478
  %7480 = or i64 %7479, %7472
  %7481 = add nuw nsw i32 %7471, 1
  %7482 = icmp eq i32 %7481, %7465
  br i1 %7482, label %7523, label %7470

7483:                                             ; preds = %7463
  %7484 = load i8, i8 addrspace(4)* %7464, align 1, !tbaa !14
  %7485 = zext i8 %7484 to i64
  %7486 = getelementptr inbounds i8, i8 addrspace(4)* %7464, i64 1
  %7487 = load i8, i8 addrspace(4)* %7486, align 1, !tbaa !14
  %7488 = zext i8 %7487 to i64
  %7489 = shl nuw nsw i64 %7488, 8
  %7490 = or i64 %7489, %7485
  %7491 = getelementptr inbounds i8, i8 addrspace(4)* %7464, i64 2
  %7492 = load i8, i8 addrspace(4)* %7491, align 1, !tbaa !14
  %7493 = zext i8 %7492 to i64
  %7494 = shl nuw nsw i64 %7493, 16
  %7495 = or i64 %7490, %7494
  %7496 = getelementptr inbounds i8, i8 addrspace(4)* %7464, i64 3
  %7497 = load i8, i8 addrspace(4)* %7496, align 1, !tbaa !14
  %7498 = zext i8 %7497 to i64
  %7499 = shl nuw nsw i64 %7498, 24
  %7500 = or i64 %7495, %7499
  %7501 = getelementptr inbounds i8, i8 addrspace(4)* %7464, i64 4
  %7502 = load i8, i8 addrspace(4)* %7501, align 1, !tbaa !14
  %7503 = zext i8 %7502 to i64
  %7504 = shl nuw nsw i64 %7503, 32
  %7505 = or i64 %7500, %7504
  %7506 = getelementptr inbounds i8, i8 addrspace(4)* %7464, i64 5
  %7507 = load i8, i8 addrspace(4)* %7506, align 1, !tbaa !14
  %7508 = zext i8 %7507 to i64
  %7509 = shl nuw nsw i64 %7508, 40
  %7510 = or i64 %7505, %7509
  %7511 = getelementptr inbounds i8, i8 addrspace(4)* %7464, i64 6
  %7512 = load i8, i8 addrspace(4)* %7511, align 1, !tbaa !14
  %7513 = zext i8 %7512 to i64
  %7514 = shl nuw nsw i64 %7513, 48
  %7515 = or i64 %7510, %7514
  %7516 = getelementptr inbounds i8, i8 addrspace(4)* %7464, i64 7
  %7517 = load i8, i8 addrspace(4)* %7516, align 1, !tbaa !14
  %7518 = zext i8 %7517 to i64
  %7519 = shl nuw i64 %7518, 56
  %7520 = or i64 %7515, %7519
  %7521 = add nsw i32 %7465, -8
  %7522 = getelementptr inbounds i8, i8 addrspace(4)* %7464, i64 8
  br label %7523

7523:                                             ; preds = %7470, %7483, %7468
  %7524 = phi i8 addrspace(4)* [ %7522, %7483 ], [ %7464, %7468 ], [ %7464, %7470 ]
  %7525 = phi i32 [ %7521, %7483 ], [ 0, %7468 ], [ 0, %7470 ]
  %7526 = phi i64 [ %7520, %7483 ], [ 0, %7468 ], [ %7480, %7470 ]
  %7527 = icmp ugt i32 %7525, 7
  br i1 %7527, label %7543, label %7528

7528:                                             ; preds = %7523
  %7529 = icmp eq i32 %7525, 0
  br i1 %7529, label %7583, label %7530

7530:                                             ; preds = %7528, %7530
  %7531 = phi i32 [ %7541, %7530 ], [ 0, %7528 ]
  %7532 = phi i64 [ %7540, %7530 ], [ 0, %7528 ]
  %7533 = zext i32 %7531 to i64
  %7534 = getelementptr inbounds i8, i8 addrspace(4)* %7524, i64 %7533
  %7535 = load i8, i8 addrspace(4)* %7534, align 1, !tbaa !14
  %7536 = zext i8 %7535 to i64
  %7537 = shl i32 %7531, 3
  %7538 = zext i32 %7537 to i64
  %7539 = shl nuw i64 %7536, %7538
  %7540 = or i64 %7539, %7532
  %7541 = add nuw nsw i32 %7531, 1
  %7542 = icmp eq i32 %7541, %7525
  br i1 %7542, label %7583, label %7530

7543:                                             ; preds = %7523
  %7544 = load i8, i8 addrspace(4)* %7524, align 1, !tbaa !14
  %7545 = zext i8 %7544 to i64
  %7546 = getelementptr inbounds i8, i8 addrspace(4)* %7524, i64 1
  %7547 = load i8, i8 addrspace(4)* %7546, align 1, !tbaa !14
  %7548 = zext i8 %7547 to i64
  %7549 = shl nuw nsw i64 %7548, 8
  %7550 = or i64 %7549, %7545
  %7551 = getelementptr inbounds i8, i8 addrspace(4)* %7524, i64 2
  %7552 = load i8, i8 addrspace(4)* %7551, align 1, !tbaa !14
  %7553 = zext i8 %7552 to i64
  %7554 = shl nuw nsw i64 %7553, 16
  %7555 = or i64 %7550, %7554
  %7556 = getelementptr inbounds i8, i8 addrspace(4)* %7524, i64 3
  %7557 = load i8, i8 addrspace(4)* %7556, align 1, !tbaa !14
  %7558 = zext i8 %7557 to i64
  %7559 = shl nuw nsw i64 %7558, 24
  %7560 = or i64 %7555, %7559
  %7561 = getelementptr inbounds i8, i8 addrspace(4)* %7524, i64 4
  %7562 = load i8, i8 addrspace(4)* %7561, align 1, !tbaa !14
  %7563 = zext i8 %7562 to i64
  %7564 = shl nuw nsw i64 %7563, 32
  %7565 = or i64 %7560, %7564
  %7566 = getelementptr inbounds i8, i8 addrspace(4)* %7524, i64 5
  %7567 = load i8, i8 addrspace(4)* %7566, align 1, !tbaa !14
  %7568 = zext i8 %7567 to i64
  %7569 = shl nuw nsw i64 %7568, 40
  %7570 = or i64 %7565, %7569
  %7571 = getelementptr inbounds i8, i8 addrspace(4)* %7524, i64 6
  %7572 = load i8, i8 addrspace(4)* %7571, align 1, !tbaa !14
  %7573 = zext i8 %7572 to i64
  %7574 = shl nuw nsw i64 %7573, 48
  %7575 = or i64 %7570, %7574
  %7576 = getelementptr inbounds i8, i8 addrspace(4)* %7524, i64 7
  %7577 = load i8, i8 addrspace(4)* %7576, align 1, !tbaa !14
  %7578 = zext i8 %7577 to i64
  %7579 = shl nuw i64 %7578, 56
  %7580 = or i64 %7575, %7579
  %7581 = add nsw i32 %7525, -8
  %7582 = getelementptr inbounds i8, i8 addrspace(4)* %7524, i64 8
  br label %7583

7583:                                             ; preds = %7530, %7543, %7528
  %7584 = phi i8 addrspace(4)* [ %7582, %7543 ], [ %7524, %7528 ], [ %7524, %7530 ]
  %7585 = phi i32 [ %7581, %7543 ], [ 0, %7528 ], [ 0, %7530 ]
  %7586 = phi i64 [ %7580, %7543 ], [ 0, %7528 ], [ %7540, %7530 ]
  %7587 = icmp ugt i32 %7585, 7
  br i1 %7587, label %7603, label %7588

7588:                                             ; preds = %7583
  %7589 = icmp eq i32 %7585, 0
  br i1 %7589, label %7643, label %7590

7590:                                             ; preds = %7588, %7590
  %7591 = phi i32 [ %7601, %7590 ], [ 0, %7588 ]
  %7592 = phi i64 [ %7600, %7590 ], [ 0, %7588 ]
  %7593 = zext i32 %7591 to i64
  %7594 = getelementptr inbounds i8, i8 addrspace(4)* %7584, i64 %7593
  %7595 = load i8, i8 addrspace(4)* %7594, align 1, !tbaa !14
  %7596 = zext i8 %7595 to i64
  %7597 = shl i32 %7591, 3
  %7598 = zext i32 %7597 to i64
  %7599 = shl nuw i64 %7596, %7598
  %7600 = or i64 %7599, %7592
  %7601 = add nuw nsw i32 %7591, 1
  %7602 = icmp eq i32 %7601, %7585
  br i1 %7602, label %7643, label %7590

7603:                                             ; preds = %7583
  %7604 = load i8, i8 addrspace(4)* %7584, align 1, !tbaa !14
  %7605 = zext i8 %7604 to i64
  %7606 = getelementptr inbounds i8, i8 addrspace(4)* %7584, i64 1
  %7607 = load i8, i8 addrspace(4)* %7606, align 1, !tbaa !14
  %7608 = zext i8 %7607 to i64
  %7609 = shl nuw nsw i64 %7608, 8
  %7610 = or i64 %7609, %7605
  %7611 = getelementptr inbounds i8, i8 addrspace(4)* %7584, i64 2
  %7612 = load i8, i8 addrspace(4)* %7611, align 1, !tbaa !14
  %7613 = zext i8 %7612 to i64
  %7614 = shl nuw nsw i64 %7613, 16
  %7615 = or i64 %7610, %7614
  %7616 = getelementptr inbounds i8, i8 addrspace(4)* %7584, i64 3
  %7617 = load i8, i8 addrspace(4)* %7616, align 1, !tbaa !14
  %7618 = zext i8 %7617 to i64
  %7619 = shl nuw nsw i64 %7618, 24
  %7620 = or i64 %7615, %7619
  %7621 = getelementptr inbounds i8, i8 addrspace(4)* %7584, i64 4
  %7622 = load i8, i8 addrspace(4)* %7621, align 1, !tbaa !14
  %7623 = zext i8 %7622 to i64
  %7624 = shl nuw nsw i64 %7623, 32
  %7625 = or i64 %7620, %7624
  %7626 = getelementptr inbounds i8, i8 addrspace(4)* %7584, i64 5
  %7627 = load i8, i8 addrspace(4)* %7626, align 1, !tbaa !14
  %7628 = zext i8 %7627 to i64
  %7629 = shl nuw nsw i64 %7628, 40
  %7630 = or i64 %7625, %7629
  %7631 = getelementptr inbounds i8, i8 addrspace(4)* %7584, i64 6
  %7632 = load i8, i8 addrspace(4)* %7631, align 1, !tbaa !14
  %7633 = zext i8 %7632 to i64
  %7634 = shl nuw nsw i64 %7633, 48
  %7635 = or i64 %7630, %7634
  %7636 = getelementptr inbounds i8, i8 addrspace(4)* %7584, i64 7
  %7637 = load i8, i8 addrspace(4)* %7636, align 1, !tbaa !14
  %7638 = zext i8 %7637 to i64
  %7639 = shl nuw i64 %7638, 56
  %7640 = or i64 %7635, %7639
  %7641 = add nsw i32 %7585, -8
  %7642 = getelementptr inbounds i8, i8 addrspace(4)* %7584, i64 8
  br label %7643

7643:                                             ; preds = %7590, %7603, %7588
  %7644 = phi i8 addrspace(4)* [ %7642, %7603 ], [ %7584, %7588 ], [ %7584, %7590 ]
  %7645 = phi i32 [ %7641, %7603 ], [ 0, %7588 ], [ 0, %7590 ]
  %7646 = phi i64 [ %7640, %7603 ], [ 0, %7588 ], [ %7600, %7590 ]
  %7647 = icmp ugt i32 %7645, 7
  br i1 %7647, label %7663, label %7648

7648:                                             ; preds = %7643
  %7649 = icmp eq i32 %7645, 0
  br i1 %7649, label %7703, label %7650

7650:                                             ; preds = %7648, %7650
  %7651 = phi i32 [ %7661, %7650 ], [ 0, %7648 ]
  %7652 = phi i64 [ %7660, %7650 ], [ 0, %7648 ]
  %7653 = zext i32 %7651 to i64
  %7654 = getelementptr inbounds i8, i8 addrspace(4)* %7644, i64 %7653
  %7655 = load i8, i8 addrspace(4)* %7654, align 1, !tbaa !14
  %7656 = zext i8 %7655 to i64
  %7657 = shl i32 %7651, 3
  %7658 = zext i32 %7657 to i64
  %7659 = shl nuw i64 %7656, %7658
  %7660 = or i64 %7659, %7652
  %7661 = add nuw nsw i32 %7651, 1
  %7662 = icmp eq i32 %7661, %7645
  br i1 %7662, label %7703, label %7650

7663:                                             ; preds = %7643
  %7664 = load i8, i8 addrspace(4)* %7644, align 1, !tbaa !14
  %7665 = zext i8 %7664 to i64
  %7666 = getelementptr inbounds i8, i8 addrspace(4)* %7644, i64 1
  %7667 = load i8, i8 addrspace(4)* %7666, align 1, !tbaa !14
  %7668 = zext i8 %7667 to i64
  %7669 = shl nuw nsw i64 %7668, 8
  %7670 = or i64 %7669, %7665
  %7671 = getelementptr inbounds i8, i8 addrspace(4)* %7644, i64 2
  %7672 = load i8, i8 addrspace(4)* %7671, align 1, !tbaa !14
  %7673 = zext i8 %7672 to i64
  %7674 = shl nuw nsw i64 %7673, 16
  %7675 = or i64 %7670, %7674
  %7676 = getelementptr inbounds i8, i8 addrspace(4)* %7644, i64 3
  %7677 = load i8, i8 addrspace(4)* %7676, align 1, !tbaa !14
  %7678 = zext i8 %7677 to i64
  %7679 = shl nuw nsw i64 %7678, 24
  %7680 = or i64 %7675, %7679
  %7681 = getelementptr inbounds i8, i8 addrspace(4)* %7644, i64 4
  %7682 = load i8, i8 addrspace(4)* %7681, align 1, !tbaa !14
  %7683 = zext i8 %7682 to i64
  %7684 = shl nuw nsw i64 %7683, 32
  %7685 = or i64 %7680, %7684
  %7686 = getelementptr inbounds i8, i8 addrspace(4)* %7644, i64 5
  %7687 = load i8, i8 addrspace(4)* %7686, align 1, !tbaa !14
  %7688 = zext i8 %7687 to i64
  %7689 = shl nuw nsw i64 %7688, 40
  %7690 = or i64 %7685, %7689
  %7691 = getelementptr inbounds i8, i8 addrspace(4)* %7644, i64 6
  %7692 = load i8, i8 addrspace(4)* %7691, align 1, !tbaa !14
  %7693 = zext i8 %7692 to i64
  %7694 = shl nuw nsw i64 %7693, 48
  %7695 = or i64 %7690, %7694
  %7696 = getelementptr inbounds i8, i8 addrspace(4)* %7644, i64 7
  %7697 = load i8, i8 addrspace(4)* %7696, align 1, !tbaa !14
  %7698 = zext i8 %7697 to i64
  %7699 = shl nuw i64 %7698, 56
  %7700 = or i64 %7695, %7699
  %7701 = add nsw i32 %7645, -8
  %7702 = getelementptr inbounds i8, i8 addrspace(4)* %7644, i64 8
  br label %7703

7703:                                             ; preds = %7650, %7663, %7648
  %7704 = phi i8 addrspace(4)* [ %7702, %7663 ], [ %7644, %7648 ], [ %7644, %7650 ]
  %7705 = phi i32 [ %7701, %7663 ], [ 0, %7648 ], [ 0, %7650 ]
  %7706 = phi i64 [ %7700, %7663 ], [ 0, %7648 ], [ %7660, %7650 ]
  %7707 = icmp ugt i32 %7705, 7
  br i1 %7707, label %7723, label %7708

7708:                                             ; preds = %7703
  %7709 = icmp eq i32 %7705, 0
  br i1 %7709, label %7761, label %7710

7710:                                             ; preds = %7708, %7710
  %7711 = phi i32 [ %7721, %7710 ], [ 0, %7708 ]
  %7712 = phi i64 [ %7720, %7710 ], [ 0, %7708 ]
  %7713 = zext i32 %7711 to i64
  %7714 = getelementptr inbounds i8, i8 addrspace(4)* %7704, i64 %7713
  %7715 = load i8, i8 addrspace(4)* %7714, align 1, !tbaa !14
  %7716 = zext i8 %7715 to i64
  %7717 = shl i32 %7711, 3
  %7718 = zext i32 %7717 to i64
  %7719 = shl nuw i64 %7716, %7718
  %7720 = or i64 %7719, %7712
  %7721 = add nuw nsw i32 %7711, 1
  %7722 = icmp eq i32 %7721, %7705
  br i1 %7722, label %7761, label %7710

7723:                                             ; preds = %7703
  %7724 = load i8, i8 addrspace(4)* %7704, align 1, !tbaa !14
  %7725 = zext i8 %7724 to i64
  %7726 = getelementptr inbounds i8, i8 addrspace(4)* %7704, i64 1
  %7727 = load i8, i8 addrspace(4)* %7726, align 1, !tbaa !14
  %7728 = zext i8 %7727 to i64
  %7729 = shl nuw nsw i64 %7728, 8
  %7730 = or i64 %7729, %7725
  %7731 = getelementptr inbounds i8, i8 addrspace(4)* %7704, i64 2
  %7732 = load i8, i8 addrspace(4)* %7731, align 1, !tbaa !14
  %7733 = zext i8 %7732 to i64
  %7734 = shl nuw nsw i64 %7733, 16
  %7735 = or i64 %7730, %7734
  %7736 = getelementptr inbounds i8, i8 addrspace(4)* %7704, i64 3
  %7737 = load i8, i8 addrspace(4)* %7736, align 1, !tbaa !14
  %7738 = zext i8 %7737 to i64
  %7739 = shl nuw nsw i64 %7738, 24
  %7740 = or i64 %7735, %7739
  %7741 = getelementptr inbounds i8, i8 addrspace(4)* %7704, i64 4
  %7742 = load i8, i8 addrspace(4)* %7741, align 1, !tbaa !14
  %7743 = zext i8 %7742 to i64
  %7744 = shl nuw nsw i64 %7743, 32
  %7745 = or i64 %7740, %7744
  %7746 = getelementptr inbounds i8, i8 addrspace(4)* %7704, i64 5
  %7747 = load i8, i8 addrspace(4)* %7746, align 1, !tbaa !14
  %7748 = zext i8 %7747 to i64
  %7749 = shl nuw nsw i64 %7748, 40
  %7750 = or i64 %7745, %7749
  %7751 = getelementptr inbounds i8, i8 addrspace(4)* %7704, i64 6
  %7752 = load i8, i8 addrspace(4)* %7751, align 1, !tbaa !14
  %7753 = zext i8 %7752 to i64
  %7754 = shl nuw nsw i64 %7753, 48
  %7755 = or i64 %7750, %7754
  %7756 = getelementptr inbounds i8, i8 addrspace(4)* %7704, i64 7
  %7757 = load i8, i8 addrspace(4)* %7756, align 1, !tbaa !14
  %7758 = zext i8 %7757 to i64
  %7759 = shl nuw i64 %7758, 56
  %7760 = or i64 %7755, %7759
  br label %7761

7761:                                             ; preds = %7710, %7723, %7708
  %7762 = phi i64 [ %7760, %7723 ], [ 0, %7708 ], [ %7720, %7710 ]
  %7763 = shl nuw nsw i64 %7344, 2
  %7764 = add nuw nsw i64 %7763, 28
  %7765 = and i64 %7764, 480
  %7766 = and i64 %7346, -225
  %7767 = or i64 %7766, %7765
  %7768 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %5504, i64 noundef %7767, i64 noundef %7406, i64 noundef %7466, i64 noundef %7526, i64 noundef %7586, i64 noundef %7646, i64 noundef %7706, i64 noundef %7762) #11
  %7769 = sub i64 %7336, %7344
  %7770 = getelementptr inbounds i8, i8 addrspace(4)* %7337, i64 %7344
  %7771 = icmp eq i64 %7769, 0
  br i1 %7771, label %7776, label %7335

7772:                                             ; preds = %7320
  %7773 = and i64 %7330, -225
  %7774 = or i64 %7773, 32
  %7775 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %5504, i64 noundef %7774, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  br label %7776

7776:                                             ; preds = %7761, %7772
  %7777 = phi <2 x i64> [ %7775, %7772 ], [ %7768, %7761 ]
  %7778 = extractelement <2 x i64> %7777, i64 0
  %7779 = and i64 %7778, -227
  %7780 = or i64 %7779, 34
  %7781 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %5504, i64 noundef %7780, i64 noundef 4, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %7782 = load i32, i32 addrspace(3)* getelementptr inbounds ([0 x i32], [0 x i32] addrspace(3)* @seme, i32 0, i32 4), align 4, !tbaa !5
  %7783 = load i32, i32 addrspace(1)* %5499, align 4, !tbaa !5
  %7784 = mul nsw i32 %7783, %7782
  store i32 %7784, i32 addrspace(1)* %5499, align 4, !tbaa !5
  %7785 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %5504, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %7786 = extractelement <2 x i64> %7785, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([20 x i8], [20 x i8] addrspace(4)* @.str.1, i64 0, i64 0) to i8*), i8* null), label %7787, label %7791

7787:                                             ; preds = %7776
  %7788 = and i64 %7786, -225
  %7789 = or i64 %7788, 32
  %7790 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %5504, i64 noundef %7789, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  br label %8232

7791:                                             ; preds = %7776
  %7792 = and i64 %7786, 2
  %7793 = and i64 %7786, -3
  %7794 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %7793, i64 0
  br label %7795

7795:                                             ; preds = %8221, %7791
  %7796 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([20 x i8], [20 x i8] addrspace(4)* @.str.1, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([20 x i8], [20 x i8] addrspace(4)* @.str.1, i64 0, i64 19) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([20 x i8]* addrspacecast ([20 x i8] addrspace(4)* @.str.1 to [20 x i8]*) to i64)), i64 1))), %7791 ], [ %8229, %8221 ]
  %7797 = phi i8 addrspace(4)* [ getelementptr inbounds ([20 x i8], [20 x i8] addrspace(4)* @.str.1, i64 0, i64 0), %7791 ], [ %8230, %8221 ]
  %7798 = phi <2 x i64> [ %7794, %7791 ], [ %8228, %8221 ]
  %7799 = icmp ugt i64 %7796, 56
  %7800 = extractelement <2 x i64> %7798, i64 0
  %7801 = or i64 %7800, %7792
  %7802 = insertelement <2 x i64> poison, i64 %7801, i64 0
  %7803 = select i1 %7799, <2 x i64> %7798, <2 x i64> %7802
  %7804 = tail call i64 @llvm.umin.i64(i64 %7796, i64 56)
  %7805 = trunc i64 %7804 to i32
  %7806 = extractelement <2 x i64> %7803, i64 0
  %7807 = icmp ugt i32 %7805, 7
  br i1 %7807, label %7810, label %7808

7808:                                             ; preds = %7795
  %7809 = icmp eq i32 %7805, 0
  br i1 %7809, label %7863, label %7850

7810:                                             ; preds = %7795
  %7811 = load i8, i8 addrspace(4)* %7797, align 1, !tbaa !14
  %7812 = zext i8 %7811 to i64
  %7813 = getelementptr inbounds i8, i8 addrspace(4)* %7797, i64 1
  %7814 = load i8, i8 addrspace(4)* %7813, align 1, !tbaa !14
  %7815 = zext i8 %7814 to i64
  %7816 = shl nuw nsw i64 %7815, 8
  %7817 = or i64 %7816, %7812
  %7818 = getelementptr inbounds i8, i8 addrspace(4)* %7797, i64 2
  %7819 = load i8, i8 addrspace(4)* %7818, align 1, !tbaa !14
  %7820 = zext i8 %7819 to i64
  %7821 = shl nuw nsw i64 %7820, 16
  %7822 = or i64 %7817, %7821
  %7823 = getelementptr inbounds i8, i8 addrspace(4)* %7797, i64 3
  %7824 = load i8, i8 addrspace(4)* %7823, align 1, !tbaa !14
  %7825 = zext i8 %7824 to i64
  %7826 = shl nuw nsw i64 %7825, 24
  %7827 = or i64 %7822, %7826
  %7828 = getelementptr inbounds i8, i8 addrspace(4)* %7797, i64 4
  %7829 = load i8, i8 addrspace(4)* %7828, align 1, !tbaa !14
  %7830 = zext i8 %7829 to i64
  %7831 = shl nuw nsw i64 %7830, 32
  %7832 = or i64 %7827, %7831
  %7833 = getelementptr inbounds i8, i8 addrspace(4)* %7797, i64 5
  %7834 = load i8, i8 addrspace(4)* %7833, align 1, !tbaa !14
  %7835 = zext i8 %7834 to i64
  %7836 = shl nuw nsw i64 %7835, 40
  %7837 = or i64 %7832, %7836
  %7838 = getelementptr inbounds i8, i8 addrspace(4)* %7797, i64 6
  %7839 = load i8, i8 addrspace(4)* %7838, align 1, !tbaa !14
  %7840 = zext i8 %7839 to i64
  %7841 = shl nuw nsw i64 %7840, 48
  %7842 = or i64 %7837, %7841
  %7843 = getelementptr inbounds i8, i8 addrspace(4)* %7797, i64 7
  %7844 = load i8, i8 addrspace(4)* %7843, align 1, !tbaa !14
  %7845 = zext i8 %7844 to i64
  %7846 = shl nuw i64 %7845, 56
  %7847 = or i64 %7842, %7846
  %7848 = add nsw i32 %7805, -8
  %7849 = getelementptr inbounds i8, i8 addrspace(4)* %7797, i64 8
  br label %7863

7850:                                             ; preds = %7808, %7850
  %7851 = phi i32 [ %7861, %7850 ], [ 0, %7808 ]
  %7852 = phi i64 [ %7860, %7850 ], [ 0, %7808 ]
  %7853 = zext i32 %7851 to i64
  %7854 = getelementptr inbounds i8, i8 addrspace(4)* %7797, i64 %7853
  %7855 = load i8, i8 addrspace(4)* %7854, align 1, !tbaa !14
  %7856 = zext i8 %7855 to i64
  %7857 = shl i32 %7851, 3
  %7858 = zext i32 %7857 to i64
  %7859 = shl nuw i64 %7856, %7858
  %7860 = or i64 %7859, %7852
  %7861 = add nuw nsw i32 %7851, 1
  %7862 = icmp eq i32 %7861, %7805
  br i1 %7862, label %7863, label %7850, !llvm.loop !15

7863:                                             ; preds = %7850, %7810, %7808
  %7864 = phi i8 addrspace(4)* [ %7849, %7810 ], [ %7797, %7808 ], [ %7797, %7850 ]
  %7865 = phi i32 [ %7848, %7810 ], [ 0, %7808 ], [ 0, %7850 ]
  %7866 = phi i64 [ %7847, %7810 ], [ 0, %7808 ], [ %7860, %7850 ]
  %7867 = icmp ugt i32 %7865, 7
  br i1 %7867, label %7870, label %7868

7868:                                             ; preds = %7863
  %7869 = icmp eq i32 %7865, 0
  br i1 %7869, label %7923, label %7910

7870:                                             ; preds = %7863
  %7871 = load i8, i8 addrspace(4)* %7864, align 1, !tbaa !14
  %7872 = zext i8 %7871 to i64
  %7873 = getelementptr inbounds i8, i8 addrspace(4)* %7864, i64 1
  %7874 = load i8, i8 addrspace(4)* %7873, align 1, !tbaa !14
  %7875 = zext i8 %7874 to i64
  %7876 = shl nuw nsw i64 %7875, 8
  %7877 = or i64 %7876, %7872
  %7878 = getelementptr inbounds i8, i8 addrspace(4)* %7864, i64 2
  %7879 = load i8, i8 addrspace(4)* %7878, align 1, !tbaa !14
  %7880 = zext i8 %7879 to i64
  %7881 = shl nuw nsw i64 %7880, 16
  %7882 = or i64 %7877, %7881
  %7883 = getelementptr inbounds i8, i8 addrspace(4)* %7864, i64 3
  %7884 = load i8, i8 addrspace(4)* %7883, align 1, !tbaa !14
  %7885 = zext i8 %7884 to i64
  %7886 = shl nuw nsw i64 %7885, 24
  %7887 = or i64 %7882, %7886
  %7888 = getelementptr inbounds i8, i8 addrspace(4)* %7864, i64 4
  %7889 = load i8, i8 addrspace(4)* %7888, align 1, !tbaa !14
  %7890 = zext i8 %7889 to i64
  %7891 = shl nuw nsw i64 %7890, 32
  %7892 = or i64 %7887, %7891
  %7893 = getelementptr inbounds i8, i8 addrspace(4)* %7864, i64 5
  %7894 = load i8, i8 addrspace(4)* %7893, align 1, !tbaa !14
  %7895 = zext i8 %7894 to i64
  %7896 = shl nuw nsw i64 %7895, 40
  %7897 = or i64 %7892, %7896
  %7898 = getelementptr inbounds i8, i8 addrspace(4)* %7864, i64 6
  %7899 = load i8, i8 addrspace(4)* %7898, align 1, !tbaa !14
  %7900 = zext i8 %7899 to i64
  %7901 = shl nuw nsw i64 %7900, 48
  %7902 = or i64 %7897, %7901
  %7903 = getelementptr inbounds i8, i8 addrspace(4)* %7864, i64 7
  %7904 = load i8, i8 addrspace(4)* %7903, align 1, !tbaa !14
  %7905 = zext i8 %7904 to i64
  %7906 = shl nuw i64 %7905, 56
  %7907 = or i64 %7902, %7906
  %7908 = add nsw i32 %7865, -8
  %7909 = getelementptr inbounds i8, i8 addrspace(4)* %7864, i64 8
  br label %7923

7910:                                             ; preds = %7868, %7910
  %7911 = phi i32 [ %7921, %7910 ], [ 0, %7868 ]
  %7912 = phi i64 [ %7920, %7910 ], [ 0, %7868 ]
  %7913 = zext i32 %7911 to i64
  %7914 = getelementptr inbounds i8, i8 addrspace(4)* %7864, i64 %7913
  %7915 = load i8, i8 addrspace(4)* %7914, align 1, !tbaa !14
  %7916 = zext i8 %7915 to i64
  %7917 = shl i32 %7911, 3
  %7918 = zext i32 %7917 to i64
  %7919 = shl nuw i64 %7916, %7918
  %7920 = or i64 %7919, %7912
  %7921 = add nuw nsw i32 %7911, 1
  %7922 = icmp eq i32 %7921, %7865
  br i1 %7922, label %7923, label %7910

7923:                                             ; preds = %7910, %7870, %7868
  %7924 = phi i8 addrspace(4)* [ %7909, %7870 ], [ %7864, %7868 ], [ %7864, %7910 ]
  %7925 = phi i32 [ %7908, %7870 ], [ 0, %7868 ], [ 0, %7910 ]
  %7926 = phi i64 [ %7907, %7870 ], [ 0, %7868 ], [ %7920, %7910 ]
  %7927 = icmp ugt i32 %7925, 7
  br i1 %7927, label %7930, label %7928

7928:                                             ; preds = %7923
  %7929 = icmp eq i32 %7925, 0
  br i1 %7929, label %7983, label %7970

7930:                                             ; preds = %7923
  %7931 = load i8, i8 addrspace(4)* %7924, align 1, !tbaa !14
  %7932 = zext i8 %7931 to i64
  %7933 = getelementptr inbounds i8, i8 addrspace(4)* %7924, i64 1
  %7934 = load i8, i8 addrspace(4)* %7933, align 1, !tbaa !14
  %7935 = zext i8 %7934 to i64
  %7936 = shl nuw nsw i64 %7935, 8
  %7937 = or i64 %7936, %7932
  %7938 = getelementptr inbounds i8, i8 addrspace(4)* %7924, i64 2
  %7939 = load i8, i8 addrspace(4)* %7938, align 1, !tbaa !14
  %7940 = zext i8 %7939 to i64
  %7941 = shl nuw nsw i64 %7940, 16
  %7942 = or i64 %7937, %7941
  %7943 = getelementptr inbounds i8, i8 addrspace(4)* %7924, i64 3
  %7944 = load i8, i8 addrspace(4)* %7943, align 1, !tbaa !14
  %7945 = zext i8 %7944 to i64
  %7946 = shl nuw nsw i64 %7945, 24
  %7947 = or i64 %7942, %7946
  %7948 = getelementptr inbounds i8, i8 addrspace(4)* %7924, i64 4
  %7949 = load i8, i8 addrspace(4)* %7948, align 1, !tbaa !14
  %7950 = zext i8 %7949 to i64
  %7951 = shl nuw nsw i64 %7950, 32
  %7952 = or i64 %7947, %7951
  %7953 = getelementptr inbounds i8, i8 addrspace(4)* %7924, i64 5
  %7954 = load i8, i8 addrspace(4)* %7953, align 1, !tbaa !14
  %7955 = zext i8 %7954 to i64
  %7956 = shl nuw nsw i64 %7955, 40
  %7957 = or i64 %7952, %7956
  %7958 = getelementptr inbounds i8, i8 addrspace(4)* %7924, i64 6
  %7959 = load i8, i8 addrspace(4)* %7958, align 1, !tbaa !14
  %7960 = zext i8 %7959 to i64
  %7961 = shl nuw nsw i64 %7960, 48
  %7962 = or i64 %7957, %7961
  %7963 = getelementptr inbounds i8, i8 addrspace(4)* %7924, i64 7
  %7964 = load i8, i8 addrspace(4)* %7963, align 1, !tbaa !14
  %7965 = zext i8 %7964 to i64
  %7966 = shl nuw i64 %7965, 56
  %7967 = or i64 %7962, %7966
  %7968 = add nsw i32 %7925, -8
  %7969 = getelementptr inbounds i8, i8 addrspace(4)* %7924, i64 8
  br label %7983

7970:                                             ; preds = %7928, %7970
  %7971 = phi i32 [ %7981, %7970 ], [ 0, %7928 ]
  %7972 = phi i64 [ %7980, %7970 ], [ 0, %7928 ]
  %7973 = zext i32 %7971 to i64
  %7974 = getelementptr inbounds i8, i8 addrspace(4)* %7924, i64 %7973
  %7975 = load i8, i8 addrspace(4)* %7974, align 1, !tbaa !14
  %7976 = zext i8 %7975 to i64
  %7977 = shl i32 %7971, 3
  %7978 = zext i32 %7977 to i64
  %7979 = shl nuw i64 %7976, %7978
  %7980 = or i64 %7979, %7972
  %7981 = add nuw nsw i32 %7971, 1
  %7982 = icmp eq i32 %7981, %7925
  br i1 %7982, label %7983, label %7970

7983:                                             ; preds = %7970, %7930, %7928
  %7984 = phi i8 addrspace(4)* [ %7969, %7930 ], [ %7924, %7928 ], [ %7924, %7970 ]
  %7985 = phi i32 [ %7968, %7930 ], [ 0, %7928 ], [ 0, %7970 ]
  %7986 = phi i64 [ %7967, %7930 ], [ 0, %7928 ], [ %7980, %7970 ]
  %7987 = icmp ugt i32 %7985, 7
  br i1 %7987, label %7990, label %7988

7988:                                             ; preds = %7983
  %7989 = icmp eq i32 %7985, 0
  br i1 %7989, label %8043, label %8030

7990:                                             ; preds = %7983
  %7991 = load i8, i8 addrspace(4)* %7984, align 1, !tbaa !14
  %7992 = zext i8 %7991 to i64
  %7993 = getelementptr inbounds i8, i8 addrspace(4)* %7984, i64 1
  %7994 = load i8, i8 addrspace(4)* %7993, align 1, !tbaa !14
  %7995 = zext i8 %7994 to i64
  %7996 = shl nuw nsw i64 %7995, 8
  %7997 = or i64 %7996, %7992
  %7998 = getelementptr inbounds i8, i8 addrspace(4)* %7984, i64 2
  %7999 = load i8, i8 addrspace(4)* %7998, align 1, !tbaa !14
  %8000 = zext i8 %7999 to i64
  %8001 = shl nuw nsw i64 %8000, 16
  %8002 = or i64 %7997, %8001
  %8003 = getelementptr inbounds i8, i8 addrspace(4)* %7984, i64 3
  %8004 = load i8, i8 addrspace(4)* %8003, align 1, !tbaa !14
  %8005 = zext i8 %8004 to i64
  %8006 = shl nuw nsw i64 %8005, 24
  %8007 = or i64 %8002, %8006
  %8008 = getelementptr inbounds i8, i8 addrspace(4)* %7984, i64 4
  %8009 = load i8, i8 addrspace(4)* %8008, align 1, !tbaa !14
  %8010 = zext i8 %8009 to i64
  %8011 = shl nuw nsw i64 %8010, 32
  %8012 = or i64 %8007, %8011
  %8013 = getelementptr inbounds i8, i8 addrspace(4)* %7984, i64 5
  %8014 = load i8, i8 addrspace(4)* %8013, align 1, !tbaa !14
  %8015 = zext i8 %8014 to i64
  %8016 = shl nuw nsw i64 %8015, 40
  %8017 = or i64 %8012, %8016
  %8018 = getelementptr inbounds i8, i8 addrspace(4)* %7984, i64 6
  %8019 = load i8, i8 addrspace(4)* %8018, align 1, !tbaa !14
  %8020 = zext i8 %8019 to i64
  %8021 = shl nuw nsw i64 %8020, 48
  %8022 = or i64 %8017, %8021
  %8023 = getelementptr inbounds i8, i8 addrspace(4)* %7984, i64 7
  %8024 = load i8, i8 addrspace(4)* %8023, align 1, !tbaa !14
  %8025 = zext i8 %8024 to i64
  %8026 = shl nuw i64 %8025, 56
  %8027 = or i64 %8022, %8026
  %8028 = add nsw i32 %7985, -8
  %8029 = getelementptr inbounds i8, i8 addrspace(4)* %7984, i64 8
  br label %8043

8030:                                             ; preds = %7988, %8030
  %8031 = phi i32 [ %8041, %8030 ], [ 0, %7988 ]
  %8032 = phi i64 [ %8040, %8030 ], [ 0, %7988 ]
  %8033 = zext i32 %8031 to i64
  %8034 = getelementptr inbounds i8, i8 addrspace(4)* %7984, i64 %8033
  %8035 = load i8, i8 addrspace(4)* %8034, align 1, !tbaa !14
  %8036 = zext i8 %8035 to i64
  %8037 = shl i32 %8031, 3
  %8038 = zext i32 %8037 to i64
  %8039 = shl nuw i64 %8036, %8038
  %8040 = or i64 %8039, %8032
  %8041 = add nuw nsw i32 %8031, 1
  %8042 = icmp eq i32 %8041, %7985
  br i1 %8042, label %8043, label %8030

8043:                                             ; preds = %8030, %7990, %7988
  %8044 = phi i8 addrspace(4)* [ %8029, %7990 ], [ %7984, %7988 ], [ %7984, %8030 ]
  %8045 = phi i32 [ %8028, %7990 ], [ 0, %7988 ], [ 0, %8030 ]
  %8046 = phi i64 [ %8027, %7990 ], [ 0, %7988 ], [ %8040, %8030 ]
  %8047 = icmp ugt i32 %8045, 7
  br i1 %8047, label %8050, label %8048

8048:                                             ; preds = %8043
  %8049 = icmp eq i32 %8045, 0
  br i1 %8049, label %8103, label %8090

8050:                                             ; preds = %8043
  %8051 = load i8, i8 addrspace(4)* %8044, align 1, !tbaa !14
  %8052 = zext i8 %8051 to i64
  %8053 = getelementptr inbounds i8, i8 addrspace(4)* %8044, i64 1
  %8054 = load i8, i8 addrspace(4)* %8053, align 1, !tbaa !14
  %8055 = zext i8 %8054 to i64
  %8056 = shl nuw nsw i64 %8055, 8
  %8057 = or i64 %8056, %8052
  %8058 = getelementptr inbounds i8, i8 addrspace(4)* %8044, i64 2
  %8059 = load i8, i8 addrspace(4)* %8058, align 1, !tbaa !14
  %8060 = zext i8 %8059 to i64
  %8061 = shl nuw nsw i64 %8060, 16
  %8062 = or i64 %8057, %8061
  %8063 = getelementptr inbounds i8, i8 addrspace(4)* %8044, i64 3
  %8064 = load i8, i8 addrspace(4)* %8063, align 1, !tbaa !14
  %8065 = zext i8 %8064 to i64
  %8066 = shl nuw nsw i64 %8065, 24
  %8067 = or i64 %8062, %8066
  %8068 = getelementptr inbounds i8, i8 addrspace(4)* %8044, i64 4
  %8069 = load i8, i8 addrspace(4)* %8068, align 1, !tbaa !14
  %8070 = zext i8 %8069 to i64
  %8071 = shl nuw nsw i64 %8070, 32
  %8072 = or i64 %8067, %8071
  %8073 = getelementptr inbounds i8, i8 addrspace(4)* %8044, i64 5
  %8074 = load i8, i8 addrspace(4)* %8073, align 1, !tbaa !14
  %8075 = zext i8 %8074 to i64
  %8076 = shl nuw nsw i64 %8075, 40
  %8077 = or i64 %8072, %8076
  %8078 = getelementptr inbounds i8, i8 addrspace(4)* %8044, i64 6
  %8079 = load i8, i8 addrspace(4)* %8078, align 1, !tbaa !14
  %8080 = zext i8 %8079 to i64
  %8081 = shl nuw nsw i64 %8080, 48
  %8082 = or i64 %8077, %8081
  %8083 = getelementptr inbounds i8, i8 addrspace(4)* %8044, i64 7
  %8084 = load i8, i8 addrspace(4)* %8083, align 1, !tbaa !14
  %8085 = zext i8 %8084 to i64
  %8086 = shl nuw i64 %8085, 56
  %8087 = or i64 %8082, %8086
  %8088 = add nsw i32 %8045, -8
  %8089 = getelementptr inbounds i8, i8 addrspace(4)* %8044, i64 8
  br label %8103

8090:                                             ; preds = %8048, %8090
  %8091 = phi i32 [ %8101, %8090 ], [ 0, %8048 ]
  %8092 = phi i64 [ %8100, %8090 ], [ 0, %8048 ]
  %8093 = zext i32 %8091 to i64
  %8094 = getelementptr inbounds i8, i8 addrspace(4)* %8044, i64 %8093
  %8095 = load i8, i8 addrspace(4)* %8094, align 1, !tbaa !14
  %8096 = zext i8 %8095 to i64
  %8097 = shl i32 %8091, 3
  %8098 = zext i32 %8097 to i64
  %8099 = shl nuw i64 %8096, %8098
  %8100 = or i64 %8099, %8092
  %8101 = add nuw nsw i32 %8091, 1
  %8102 = icmp eq i32 %8101, %8045
  br i1 %8102, label %8103, label %8090

8103:                                             ; preds = %8090, %8050, %8048
  %8104 = phi i8 addrspace(4)* [ %8089, %8050 ], [ %8044, %8048 ], [ %8044, %8090 ]
  %8105 = phi i32 [ %8088, %8050 ], [ 0, %8048 ], [ 0, %8090 ]
  %8106 = phi i64 [ %8087, %8050 ], [ 0, %8048 ], [ %8100, %8090 ]
  %8107 = icmp ugt i32 %8105, 7
  br i1 %8107, label %8110, label %8108

8108:                                             ; preds = %8103
  %8109 = icmp eq i32 %8105, 0
  br i1 %8109, label %8163, label %8150

8110:                                             ; preds = %8103
  %8111 = load i8, i8 addrspace(4)* %8104, align 1, !tbaa !14
  %8112 = zext i8 %8111 to i64
  %8113 = getelementptr inbounds i8, i8 addrspace(4)* %8104, i64 1
  %8114 = load i8, i8 addrspace(4)* %8113, align 1, !tbaa !14
  %8115 = zext i8 %8114 to i64
  %8116 = shl nuw nsw i64 %8115, 8
  %8117 = or i64 %8116, %8112
  %8118 = getelementptr inbounds i8, i8 addrspace(4)* %8104, i64 2
  %8119 = load i8, i8 addrspace(4)* %8118, align 1, !tbaa !14
  %8120 = zext i8 %8119 to i64
  %8121 = shl nuw nsw i64 %8120, 16
  %8122 = or i64 %8117, %8121
  %8123 = getelementptr inbounds i8, i8 addrspace(4)* %8104, i64 3
  %8124 = load i8, i8 addrspace(4)* %8123, align 1, !tbaa !14
  %8125 = zext i8 %8124 to i64
  %8126 = shl nuw nsw i64 %8125, 24
  %8127 = or i64 %8122, %8126
  %8128 = getelementptr inbounds i8, i8 addrspace(4)* %8104, i64 4
  %8129 = load i8, i8 addrspace(4)* %8128, align 1, !tbaa !14
  %8130 = zext i8 %8129 to i64
  %8131 = shl nuw nsw i64 %8130, 32
  %8132 = or i64 %8127, %8131
  %8133 = getelementptr inbounds i8, i8 addrspace(4)* %8104, i64 5
  %8134 = load i8, i8 addrspace(4)* %8133, align 1, !tbaa !14
  %8135 = zext i8 %8134 to i64
  %8136 = shl nuw nsw i64 %8135, 40
  %8137 = or i64 %8132, %8136
  %8138 = getelementptr inbounds i8, i8 addrspace(4)* %8104, i64 6
  %8139 = load i8, i8 addrspace(4)* %8138, align 1, !tbaa !14
  %8140 = zext i8 %8139 to i64
  %8141 = shl nuw nsw i64 %8140, 48
  %8142 = or i64 %8137, %8141
  %8143 = getelementptr inbounds i8, i8 addrspace(4)* %8104, i64 7
  %8144 = load i8, i8 addrspace(4)* %8143, align 1, !tbaa !14
  %8145 = zext i8 %8144 to i64
  %8146 = shl nuw i64 %8145, 56
  %8147 = or i64 %8142, %8146
  %8148 = add nsw i32 %8105, -8
  %8149 = getelementptr inbounds i8, i8 addrspace(4)* %8104, i64 8
  br label %8163

8150:                                             ; preds = %8108, %8150
  %8151 = phi i32 [ %8161, %8150 ], [ 0, %8108 ]
  %8152 = phi i64 [ %8160, %8150 ], [ 0, %8108 ]
  %8153 = zext i32 %8151 to i64
  %8154 = getelementptr inbounds i8, i8 addrspace(4)* %8104, i64 %8153
  %8155 = load i8, i8 addrspace(4)* %8154, align 1, !tbaa !14
  %8156 = zext i8 %8155 to i64
  %8157 = shl i32 %8151, 3
  %8158 = zext i32 %8157 to i64
  %8159 = shl nuw i64 %8156, %8158
  %8160 = or i64 %8159, %8152
  %8161 = add nuw nsw i32 %8151, 1
  %8162 = icmp eq i32 %8161, %8105
  br i1 %8162, label %8163, label %8150

8163:                                             ; preds = %8150, %8110, %8108
  %8164 = phi i8 addrspace(4)* [ %8149, %8110 ], [ %8104, %8108 ], [ %8104, %8150 ]
  %8165 = phi i32 [ %8148, %8110 ], [ 0, %8108 ], [ 0, %8150 ]
  %8166 = phi i64 [ %8147, %8110 ], [ 0, %8108 ], [ %8160, %8150 ]
  %8167 = icmp ugt i32 %8165, 7
  br i1 %8167, label %8170, label %8168

8168:                                             ; preds = %8163
  %8169 = icmp eq i32 %8165, 0
  br i1 %8169, label %8221, label %8208

8170:                                             ; preds = %8163
  %8171 = load i8, i8 addrspace(4)* %8164, align 1, !tbaa !14
  %8172 = zext i8 %8171 to i64
  %8173 = getelementptr inbounds i8, i8 addrspace(4)* %8164, i64 1
  %8174 = load i8, i8 addrspace(4)* %8173, align 1, !tbaa !14
  %8175 = zext i8 %8174 to i64
  %8176 = shl nuw nsw i64 %8175, 8
  %8177 = or i64 %8176, %8172
  %8178 = getelementptr inbounds i8, i8 addrspace(4)* %8164, i64 2
  %8179 = load i8, i8 addrspace(4)* %8178, align 1, !tbaa !14
  %8180 = zext i8 %8179 to i64
  %8181 = shl nuw nsw i64 %8180, 16
  %8182 = or i64 %8177, %8181
  %8183 = getelementptr inbounds i8, i8 addrspace(4)* %8164, i64 3
  %8184 = load i8, i8 addrspace(4)* %8183, align 1, !tbaa !14
  %8185 = zext i8 %8184 to i64
  %8186 = shl nuw nsw i64 %8185, 24
  %8187 = or i64 %8182, %8186
  %8188 = getelementptr inbounds i8, i8 addrspace(4)* %8164, i64 4
  %8189 = load i8, i8 addrspace(4)* %8188, align 1, !tbaa !14
  %8190 = zext i8 %8189 to i64
  %8191 = shl nuw nsw i64 %8190, 32
  %8192 = or i64 %8187, %8191
  %8193 = getelementptr inbounds i8, i8 addrspace(4)* %8164, i64 5
  %8194 = load i8, i8 addrspace(4)* %8193, align 1, !tbaa !14
  %8195 = zext i8 %8194 to i64
  %8196 = shl nuw nsw i64 %8195, 40
  %8197 = or i64 %8192, %8196
  %8198 = getelementptr inbounds i8, i8 addrspace(4)* %8164, i64 6
  %8199 = load i8, i8 addrspace(4)* %8198, align 1, !tbaa !14
  %8200 = zext i8 %8199 to i64
  %8201 = shl nuw nsw i64 %8200, 48
  %8202 = or i64 %8197, %8201
  %8203 = getelementptr inbounds i8, i8 addrspace(4)* %8164, i64 7
  %8204 = load i8, i8 addrspace(4)* %8203, align 1, !tbaa !14
  %8205 = zext i8 %8204 to i64
  %8206 = shl nuw i64 %8205, 56
  %8207 = or i64 %8202, %8206
  br label %8221

8208:                                             ; preds = %8168, %8208
  %8209 = phi i32 [ %8219, %8208 ], [ 0, %8168 ]
  %8210 = phi i64 [ %8218, %8208 ], [ 0, %8168 ]
  %8211 = zext i32 %8209 to i64
  %8212 = getelementptr inbounds i8, i8 addrspace(4)* %8164, i64 %8211
  %8213 = load i8, i8 addrspace(4)* %8212, align 1, !tbaa !14
  %8214 = zext i8 %8213 to i64
  %8215 = shl i32 %8209, 3
  %8216 = zext i32 %8215 to i64
  %8217 = shl nuw i64 %8214, %8216
  %8218 = or i64 %8217, %8210
  %8219 = add nuw nsw i32 %8209, 1
  %8220 = icmp eq i32 %8219, %8165
  br i1 %8220, label %8221, label %8208

8221:                                             ; preds = %8208, %8170, %8168
  %8222 = phi i64 [ %8207, %8170 ], [ 0, %8168 ], [ %8218, %8208 ]
  %8223 = shl nuw nsw i64 %7804, 2
  %8224 = add nuw nsw i64 %8223, 28
  %8225 = and i64 %8224, 480
  %8226 = and i64 %7806, -225
  %8227 = or i64 %8226, %8225
  %8228 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %5504, i64 noundef %8227, i64 noundef %7866, i64 noundef %7926, i64 noundef %7986, i64 noundef %8046, i64 noundef %8106, i64 noundef %8166, i64 noundef %8222) #11
  %8229 = sub i64 %7796, %7804
  %8230 = getelementptr inbounds i8, i8 addrspace(4)* %7797, i64 %7804
  %8231 = icmp eq i64 %8229, 0
  br i1 %8231, label %8232, label %7795

8232:                                             ; preds = %8221, %7787
  %8233 = phi <2 x i64> [ %7790, %7787 ], [ %8228, %8221 ]
  %8234 = extractelement <2 x i64> %8233, i64 0
  %8235 = and i64 %8234, -227
  %8236 = or i64 %8235, 34
  %8237 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %5504, i64 noundef %8236, i64 noundef 2, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  br label %8238

8238:                                             ; preds = %8232, %2759
  store i32 0, i32 addrspace(3)* %7, align 4, !tbaa !5
  br label %8239

8239:                                             ; preds = %8238, %2, %5490
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr() #3

; Function Attrs: convergent noinline norecurse nounwind optnone
define internal fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %0, i64 noundef %1, i64 noundef %2, i64 noundef %3, i64 noundef %4, i64 noundef %5, i64 noundef %6, i64 noundef %7, i64 noundef %8) unnamed_addr #4 {
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
  call void @llvm.lifetime.start.p5i8(i64 4, i8 addrspace(5)* %27) #7
  %28 = call i32 @llvm.amdgcn.mbcnt.lo(i32 -1, i32 0)
  %29 = call i32 @llvm.amdgcn.mbcnt.hi(i32 -1, i32 %28)
  store i32 %29, i32 addrspace(5)* %20, align 4, !tbaa !19
  %30 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !19
  %31 = call i32 asm sideeffect "; ockl readfirstlane hoisting hack $0", "=v,0"(i32 %30) #11, !srcloc !21
  store i32 %31, i32 addrspace(5)* %20, align 4, !tbaa !19
  %32 = bitcast i32 addrspace(5)* %21 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 4, i8 addrspace(5)* %32) #7
  %33 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !19
  %34 = call i32 @llvm.amdgcn.readfirstlane(i32 %33)
  store i32 %34, i32 addrspace(5)* %21, align 4, !tbaa !19
  %35 = bitcast %0 addrspace(1)* addrspace(5)* %22 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %35) #7
  %36 = load i8*, i8* addrspace(5)* %10, align 8, !tbaa !17
  %37 = addrspacecast i8* %36 to %0 addrspace(1)*
  store %0 addrspace(1)* %37, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !17
  %38 = bitcast i64 addrspace(5)* %23 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %38) #7
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
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %79) #7
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
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %88) #7
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
  %110 = call i64 @llvm.read_register.i64(metadata !27) #12
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
  call void @llvm.lifetime.start.p5i8(i64 16, i8 addrspace(5)* %164) #7
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
  call void @llvm.lifetime.end.p5i8(i64 16, i8 addrspace(5)* %215) #7
  %216 = bitcast %2 addrspace(1)* addrspace(5)* %25 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 8, i8 addrspace(5)* %216) #7
  %217 = bitcast %1 addrspace(1)* addrspace(5)* %24 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 8, i8 addrspace(5)* %217) #7
  %218 = bitcast i64 addrspace(5)* %23 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 8, i8 addrspace(5)* %218) #7
  %219 = bitcast %0 addrspace(1)* addrspace(5)* %22 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 8, i8 addrspace(5)* %219) #7
  %220 = bitcast i32 addrspace(5)* %21 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 4, i8 addrspace(5)* %220) #7
  %221 = bitcast i32 addrspace(5)* %20 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 4, i8 addrspace(5)* %221) #7
  ret <2 x i64> %214
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare i32 @llvm.amdgcn.readfirstlane(i32) #5

; Function Attrs: mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.sleep(i32 immarg) #6

; Function Attrs: nounwind
declare void @llvm.amdgcn.s.sendmsg(i32 immarg, i32) #7

; Function Attrs: nofree nounwind readonly
declare i64 @llvm.read_register.i64(metadata) #8

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare i32 @llvm.amdgcn.mbcnt.lo(i32, i32) #9

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare i32 @llvm.amdgcn.mbcnt.hi(i32, i32) #9

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.umin.i64(i64, i64) #10

attributes #0 = { argmemonly mustprogress nocallback nofree nosync nounwind willreturn }
attributes #1 = { convergent norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #2 = { convergent mustprogress nounwind willreturn }
attributes #3 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #4 = { convergent noinline norecurse nounwind optnone "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+16-bit-insts,+add-no-carry-insts,+aperture-regs,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+ds-src2-insts,+enable-ds128,+enable-prt-strict-null,+extended-image-insts,+fast-denormal-f32,+fast-fmaf,+flat-address-space,+flat-for-global,+flat-global-insts,+flat-inst-offsets,+flat-scratch-insts,+fma-mix-insts,+fp64,+gcn3-encoding,+gfx7-gfx8-gfx9-insts,+gfx8-insts,+gfx9,+gfx9-insts,+half-rate-64-ops,+image-gather4-d16-bug,+image-insts,+int-clamp-insts,+inv-2pi-inline-imm,+ldsbankcount32,+load-store-opt,+localmemorysize65536,+mad-mac-f32-insts,+negative-scratch-offset-bug,+promote-alloca,+r128-a16,+s-memrealtime,+s-memtime-inst,+scalar-atomics,+scalar-flat-scratch-insts,+scalar-stores,+sdwa,+sdwa-omod,+sdwa-scalar,+sdwa-sdst,+sramecc,+sramecc-support,+trap-handler,+unaligned-access-mode,+unaligned-buffer-access,+unaligned-ds-access,+vgpr-index-mode,+vop3p,-wavefrontsize16,-wavefrontsize32,+wavefrontsize64,+xnack-support" }
attributes #5 = { convergent mustprogress nofree nounwind readnone willreturn }
attributes #6 = { mustprogress nounwind willreturn }
attributes #7 = { nounwind }
attributes #8 = { nofree nounwind readonly }
attributes #9 = { mustprogress nofree nosync nounwind readnone willreturn }
attributes #10 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #11 = { convergent nounwind }
attributes #12 = { convergent }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"int", !7, i64 0}
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
