; ModuleID = '../data/hip_kernels/360/8/main.cu'
source_filename = "../data/hip_kernels/360/8/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ10MakeSplitsiPiS_S_S_S_S_E7nodeIds = internal unnamed_addr addrspace(3) global [64 x i32] undef, align 16
@_ZZ10MakeSplitsiPiS_S_S_S_S_E8scratchA = internal unnamed_addr addrspace(3) global [64 x i32] undef, align 16
@_ZZ10MakeSplitsiPiS_S_S_S_S_E8scratchB = internal unnamed_addr addrspace(3) global [64 x i32] undef, align 16
@_ZZ10MakeSplitsiPiS_S_S_S_S_E5rootA = internal unnamed_addr addrspace(3) global i32 undef, align 4
@_ZZ10MakeSplitsiPiS_S_S_S_S_E5rootB = internal unnamed_addr addrspace(3) global i32 undef, align 4
@_ZZ10MakeSplitsiPiS_S_S_S_S_E6aCount = internal addrspace(3) global i32 undef, align 4
@_ZZ10MakeSplitsiPiS_S_S_S_S_E6bCount = internal addrspace(3) global i32 undef, align 4
@_ZZ10MakeSplitsiPiS_S_S_S_S_E10incomplete = internal unnamed_addr addrspace(3) global i8 undef, align 1
@_ZZ10MakeSplitsiPiS_S_S_S_S_E5moved = internal addrspace(3) global i32 undef, align 4

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z10MakeSplitsiPiS_S_S_S_S_(i32 %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture writeonly %2, i32 addrspace(1)* nocapture readonly %3, i32 addrspace(1)* nocapture readonly %4, i32 addrspace(1)* nocapture readonly %5, i32 addrspace(1)* nocapture readonly %6) local_unnamed_addr #1 {
  %8 = alloca [40 x i32], align 16, addrspace(5)
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = zext i32 %9 to i64
  %11 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %10
  %12 = load i32, i32 addrspace(1)* %11, align 4, !tbaa !4, !amdgpu.noclobber !8
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %13
  %15 = bitcast i32 addrspace(1)* %14 to <2 x i32> addrspace(1)*
  %16 = load <2 x i32>, <2 x i32> addrspace(1)* %15, align 4, !tbaa !4
  %17 = extractelement <2 x i32> %16, i64 0
  %18 = extractelement <2 x i32> %16, i64 1
  %19 = sub nsw i32 %18, %17
  %20 = add i32 %9, %0
  store i8 1, i8 addrspace(3)* @_ZZ10MakeSplitsiPiS_S_S_S_S_E10incomplete, align 1, !tbaa !9
  store i32 1, i32 addrspace(3)* @_ZZ10MakeSplitsiPiS_S_S_S_S_E6aCount, align 4, !tbaa !4
  store i32 1, i32 addrspace(3)* @_ZZ10MakeSplitsiPiS_S_S_S_S_E6bCount, align 4, !tbaa !4
  %21 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !11
  %22 = icmp ult i32 %21, %19
  br i1 %22, label %23, label %29

23:                                               ; preds = %7
  %24 = add i32 %17, %21
  %25 = zext i32 %24 to i64
  %26 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %25
  %27 = load i32, i32 addrspace(1)* %26, align 4, !tbaa !4, !amdgpu.noclobber !8
  %28 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(3)* @_ZZ10MakeSplitsiPiS_S_S_S_S_E7nodeIds, i32 0, i32 %21
  store i32 %27, i32 addrspace(3)* %28, align 4, !tbaa !4
  br label %29

29:                                               ; preds = %23, %7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %30 = bitcast [40 x i32] addrspace(5)* %8 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 160, i8 addrspace(5)* %30) #5
  br i1 %22, label %31, label %75

31:                                               ; preds = %29
  %32 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(3)* @_ZZ10MakeSplitsiPiS_S_S_S_S_E7nodeIds, i32 0, i32 %21
  %33 = load i32, i32 addrspace(3)* %32, align 4, !tbaa !4
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %34
  %36 = bitcast i32 addrspace(1)* %35 to <2 x i32> addrspace(1)*
  %37 = load <2 x i32>, <2 x i32> addrspace(1)* %36, align 4, !tbaa !4
  %38 = extractelement <2 x i32> %37, i64 0
  %39 = extractelement <2 x i32> %37, i64 1
  %40 = icmp slt i32 %38, %39
  br i1 %40, label %41, label %75

41:                                               ; preds = %31
  %42 = add nsw i32 %19, -1
  %43 = icmp sgt i32 %19, 1
  br label %44

44:                                               ; preds = %41, %71
  %45 = phi i32 [ 0, %41 ], [ %72, %71 ]
  %46 = phi i32 [ %38, %41 ], [ %73, %71 ]
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %47
  %49 = load i32, i32 addrspace(1)* %48, align 4, !tbaa !4
  br i1 %43, label %50, label %63

50:                                               ; preds = %44, %50
  %51 = phi i32 [ %61, %50 ], [ 0, %44 ]
  %52 = phi i32 [ %60, %50 ], [ %42, %44 ]
  %53 = sub nsw i32 %52, %51
  %54 = sdiv i32 %53, 2
  %55 = add nsw i32 %54, %51
  %56 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(3)* @_ZZ10MakeSplitsiPiS_S_S_S_S_E7nodeIds, i32 0, i32 %55
  %57 = load i32, i32 addrspace(3)* %56, align 4, !tbaa !4
  %58 = icmp slt i32 %57, %49
  %59 = add nsw i32 %55, 1
  %60 = select i1 %58, i32 %52, i32 %55
  %61 = select i1 %58, i32 %59, i32 %51
  %62 = icmp sgt i32 %60, %61
  br i1 %62, label %50, label %63, !llvm.loop !12

63:                                               ; preds = %50, %44
  %64 = phi i32 [ 0, %44 ], [ %61, %50 ]
  %65 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(3)* @_ZZ10MakeSplitsiPiS_S_S_S_S_E7nodeIds, i32 0, i32 %64
  %66 = load i32, i32 addrspace(3)* %65, align 4, !tbaa !4
  %67 = icmp eq i32 %66, %49
  br i1 %67, label %68, label %71

68:                                               ; preds = %63
  %69 = add nsw i32 %45, 1
  %70 = getelementptr inbounds [40 x i32], [40 x i32] addrspace(5)* %8, i32 0, i32 %45
  store i32 %64, i32 addrspace(5)* %70, align 4, !tbaa !4
  br label %71

71:                                               ; preds = %68, %63
  %72 = phi i32 [ %69, %68 ], [ %45, %63 ]
  %73 = add nsw i32 %46, 1
  %74 = icmp slt i32 %73, %39
  br i1 %74, label %44, label %75, !llvm.loop !14

75:                                               ; preds = %71, %31, %29
  %76 = phi i64 [ -1, %29 ], [ %34, %31 ], [ %34, %71 ]
  %77 = phi i32 [ 0, %29 ], [ 0, %31 ], [ %72, %71 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %22, label %78, label %82

78:                                               ; preds = %75
  %79 = icmp ne i32 %21, 0
  %80 = sext i1 %79 to i32
  %81 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(3)* @_ZZ10MakeSplitsiPiS_S_S_S_S_E8scratchA, i32 0, i32 %21
  store i32 %80, i32 addrspace(3)* %81, align 4, !tbaa !4
  br label %82

82:                                               ; preds = %78, %75
  store i8 1, i8 addrspace(3)* @_ZZ10MakeSplitsiPiS_S_S_S_S_E10incomplete, align 1, !tbaa !9
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %83 = load i8, i8 addrspace(3)* @_ZZ10MakeSplitsiPiS_S_S_S_S_E10incomplete, align 1, !tbaa !9, !range !15
  %84 = icmp eq i8 %83, 0
  br i1 %84, label %202, label %85

85:                                               ; preds = %82
  %86 = icmp ne i32 %21, 0
  %87 = sext i1 %86 to i32
  %88 = icmp slt i32 %77, 1
  %89 = xor i1 %22, true
  %90 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(3)* @_ZZ10MakeSplitsiPiS_S_S_S_S_E8scratchA, i32 0, i32 %21
  %91 = add i32 %77, -1
  %92 = and i32 %77, 7
  %93 = icmp ult i32 %91, 7
  %94 = and i32 %77, -8
  %95 = icmp eq i32 %92, 0
  br label %96

96:                                               ; preds = %85, %198
  %97 = phi i32 [ %87, %85 ], [ %193, %198 ]
  %98 = phi i1 [ false, %85 ], [ %199, %198 ]
  store i8 0, i8 addrspace(3)* @_ZZ10MakeSplitsiPiS_S_S_S_S_E10incomplete, align 1, !tbaa !9
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %99 = icmp ne i32 %97, -1
  %100 = select i1 %89, i1 true, i1 %99
  %101 = select i1 %100, i1 true, i1 %88
  %102 = select i1 %100, i32 %97, i32 -1
  br i1 %101, label %192, label %103

103:                                              ; preds = %96
  br i1 %93, label %174, label %104

104:                                              ; preds = %103, %104
  %105 = phi i32 [ %170, %104 ], [ -1, %103 ]
  %106 = phi i32 [ %171, %104 ], [ 0, %103 ]
  %107 = phi i32 [ %172, %104 ], [ 0, %103 ]
  %108 = getelementptr inbounds [40 x i32], [40 x i32] addrspace(5)* %8, i32 0, i32 %106
  %109 = load i32, i32 addrspace(5)* %108, align 16, !tbaa !4
  %110 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(3)* @_ZZ10MakeSplitsiPiS_S_S_S_S_E8scratchA, i32 0, i32 %109
  %111 = load i32, i32 addrspace(3)* %110, align 4, !tbaa !4
  %112 = add nsw i32 %111, 1
  %113 = icmp slt i32 %111, 0
  %114 = select i1 %113, i32 %105, i32 %112
  %115 = or i32 %106, 1
  %116 = getelementptr inbounds [40 x i32], [40 x i32] addrspace(5)* %8, i32 0, i32 %115
  %117 = load i32, i32 addrspace(5)* %116, align 4, !tbaa !4
  %118 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(3)* @_ZZ10MakeSplitsiPiS_S_S_S_S_E8scratchA, i32 0, i32 %117
  %119 = load i32, i32 addrspace(3)* %118, align 4, !tbaa !4
  %120 = add nsw i32 %119, 1
  %121 = icmp slt i32 %119, 0
  %122 = select i1 %121, i32 %114, i32 %120
  %123 = or i32 %106, 2
  %124 = getelementptr inbounds [40 x i32], [40 x i32] addrspace(5)* %8, i32 0, i32 %123
  %125 = load i32, i32 addrspace(5)* %124, align 8, !tbaa !4
  %126 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(3)* @_ZZ10MakeSplitsiPiS_S_S_S_S_E8scratchA, i32 0, i32 %125
  %127 = load i32, i32 addrspace(3)* %126, align 4, !tbaa !4
  %128 = add nsw i32 %127, 1
  %129 = icmp slt i32 %127, 0
  %130 = select i1 %129, i32 %122, i32 %128
  %131 = or i32 %106, 3
  %132 = getelementptr inbounds [40 x i32], [40 x i32] addrspace(5)* %8, i32 0, i32 %131
  %133 = load i32, i32 addrspace(5)* %132, align 4, !tbaa !4
  %134 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(3)* @_ZZ10MakeSplitsiPiS_S_S_S_S_E8scratchA, i32 0, i32 %133
  %135 = load i32, i32 addrspace(3)* %134, align 4, !tbaa !4
  %136 = add nsw i32 %135, 1
  %137 = icmp slt i32 %135, 0
  %138 = select i1 %137, i32 %130, i32 %136
  %139 = or i32 %106, 4
  %140 = getelementptr inbounds [40 x i32], [40 x i32] addrspace(5)* %8, i32 0, i32 %139
  %141 = load i32, i32 addrspace(5)* %140, align 16, !tbaa !4
  %142 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(3)* @_ZZ10MakeSplitsiPiS_S_S_S_S_E8scratchA, i32 0, i32 %141
  %143 = load i32, i32 addrspace(3)* %142, align 4, !tbaa !4
  %144 = add nsw i32 %143, 1
  %145 = icmp slt i32 %143, 0
  %146 = select i1 %145, i32 %138, i32 %144
  %147 = or i32 %106, 5
  %148 = getelementptr inbounds [40 x i32], [40 x i32] addrspace(5)* %8, i32 0, i32 %147
  %149 = load i32, i32 addrspace(5)* %148, align 4, !tbaa !4
  %150 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(3)* @_ZZ10MakeSplitsiPiS_S_S_S_S_E8scratchA, i32 0, i32 %149
  %151 = load i32, i32 addrspace(3)* %150, align 4, !tbaa !4
  %152 = add nsw i32 %151, 1
  %153 = icmp slt i32 %151, 0
  %154 = select i1 %153, i32 %146, i32 %152
  %155 = or i32 %106, 6
  %156 = getelementptr inbounds [40 x i32], [40 x i32] addrspace(5)* %8, i32 0, i32 %155
  %157 = load i32, i32 addrspace(5)* %156, align 8, !tbaa !4
  %158 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(3)* @_ZZ10MakeSplitsiPiS_S_S_S_S_E8scratchA, i32 0, i32 %157
  %159 = load i32, i32 addrspace(3)* %158, align 4, !tbaa !4
  %160 = add nsw i32 %159, 1
  %161 = icmp slt i32 %159, 0
  %162 = select i1 %161, i32 %154, i32 %160
  %163 = or i32 %106, 7
  %164 = getelementptr inbounds [40 x i32], [40 x i32] addrspace(5)* %8, i32 0, i32 %163
  %165 = load i32, i32 addrspace(5)* %164, align 4, !tbaa !4
  %166 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(3)* @_ZZ10MakeSplitsiPiS_S_S_S_S_E8scratchA, i32 0, i32 %165
  %167 = load i32, i32 addrspace(3)* %166, align 4, !tbaa !4
  %168 = add nsw i32 %167, 1
  %169 = icmp slt i32 %167, 0
  %170 = select i1 %169, i32 %162, i32 %168
  %171 = add nuw nsw i32 %106, 8
  %172 = add i32 %107, 8
  %173 = icmp eq i32 %172, %94
  br i1 %173, label %174, label %104, !llvm.loop !16

174:                                              ; preds = %104, %103
  %175 = phi i32 [ undef, %103 ], [ %170, %104 ]
  %176 = phi i32 [ -1, %103 ], [ %170, %104 ]
  %177 = phi i32 [ 0, %103 ], [ %171, %104 ]
  br i1 %95, label %192, label %178

178:                                              ; preds = %174, %178
  %179 = phi i32 [ %188, %178 ], [ %176, %174 ]
  %180 = phi i32 [ %189, %178 ], [ %177, %174 ]
  %181 = phi i32 [ %190, %178 ], [ 0, %174 ]
  %182 = getelementptr inbounds [40 x i32], [40 x i32] addrspace(5)* %8, i32 0, i32 %180
  %183 = load i32, i32 addrspace(5)* %182, align 4, !tbaa !4
  %184 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(3)* @_ZZ10MakeSplitsiPiS_S_S_S_S_E8scratchA, i32 0, i32 %183
  %185 = load i32, i32 addrspace(3)* %184, align 4, !tbaa !4
  %186 = add nsw i32 %185, 1
  %187 = icmp slt i32 %185, 0
  %188 = select i1 %187, i32 %179, i32 %186
  %189 = add nuw nsw i32 %180, 1
  %190 = add i32 %181, 1
  %191 = icmp eq i32 %190, %92
  br i1 %191, label %192, label %178, !llvm.loop !17

192:                                              ; preds = %174, %178, %96
  %193 = phi i32 [ %102, %96 ], [ %175, %174 ], [ %188, %178 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %194 = icmp slt i32 %193, 1
  %195 = select i1 %89, i1 true, i1 %194
  %196 = select i1 %195, i1 true, i1 %98
  br i1 %196, label %198, label %197

197:                                              ; preds = %192
  store i32 %193, i32 addrspace(3)* %90, align 4, !tbaa !4
  store i32 %21, i32 addrspace(3)* @_ZZ10MakeSplitsiPiS_S_S_S_S_E5rootA, align 4, !tbaa !4
  store i8 1, i8 addrspace(3)* @_ZZ10MakeSplitsiPiS_S_S_S_S_E10incomplete, align 1, !tbaa !9
  br label %198

198:                                              ; preds = %192, %197
  %199 = phi i1 [ true, %197 ], [ %98, %192 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %200 = load i8, i8 addrspace(3)* @_ZZ10MakeSplitsiPiS_S_S_S_S_E10incomplete, align 1, !tbaa !9, !range !15
  %201 = icmp eq i8 %200, 0
  br i1 %201, label %202, label %96, !llvm.loop !19

202:                                              ; preds = %198, %82
  %203 = load i32, i32 addrspace(3)* @_ZZ10MakeSplitsiPiS_S_S_S_S_E5rootA, align 4, !tbaa !4
  br i1 %22, label %204, label %208

204:                                              ; preds = %202
  %205 = icmp ne i32 %21, %203
  %206 = sext i1 %205 to i32
  %207 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(3)* @_ZZ10MakeSplitsiPiS_S_S_S_S_E8scratchA, i32 0, i32 %21
  store i32 %206, i32 addrspace(3)* %207, align 4, !tbaa !4
  br label %208

208:                                              ; preds = %202, %204
  %209 = icmp ne i32 %21, %203
  %210 = sext i1 %209 to i32
  store i8 1, i8 addrspace(3)* @_ZZ10MakeSplitsiPiS_S_S_S_S_E10incomplete, align 1, !tbaa !9
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %211 = load i8, i8 addrspace(3)* @_ZZ10MakeSplitsiPiS_S_S_S_S_E10incomplete, align 1, !tbaa !9, !range !15
  %212 = icmp eq i8 %211, 0
  br i1 %212, label %328, label %213

213:                                              ; preds = %208
  %214 = icmp slt i32 %77, 1
  %215 = xor i1 %22, true
  %216 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(3)* @_ZZ10MakeSplitsiPiS_S_S_S_S_E8scratchA, i32 0, i32 %21
  %217 = add i32 %77, -1
  %218 = and i32 %77, 7
  %219 = icmp ult i32 %217, 7
  %220 = and i32 %77, -8
  %221 = icmp eq i32 %218, 0
  br label %222

222:                                              ; preds = %213, %324
  %223 = phi i32 [ %210, %213 ], [ %319, %324 ]
  %224 = phi i1 [ false, %213 ], [ %325, %324 ]
  store i8 0, i8 addrspace(3)* @_ZZ10MakeSplitsiPiS_S_S_S_S_E10incomplete, align 1, !tbaa !9
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %225 = icmp ne i32 %223, -1
  %226 = select i1 %215, i1 true, i1 %225
  %227 = select i1 %226, i1 true, i1 %214
  %228 = select i1 %226, i32 %223, i32 -1
  br i1 %227, label %318, label %229

229:                                              ; preds = %222
  br i1 %219, label %300, label %230

230:                                              ; preds = %229, %230
  %231 = phi i32 [ %296, %230 ], [ -1, %229 ]
  %232 = phi i32 [ %297, %230 ], [ 0, %229 ]
  %233 = phi i32 [ %298, %230 ], [ 0, %229 ]
  %234 = getelementptr inbounds [40 x i32], [40 x i32] addrspace(5)* %8, i32 0, i32 %232
  %235 = load i32, i32 addrspace(5)* %234, align 16, !tbaa !4
  %236 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(3)* @_ZZ10MakeSplitsiPiS_S_S_S_S_E8scratchA, i32 0, i32 %235
  %237 = load i32, i32 addrspace(3)* %236, align 4, !tbaa !4
  %238 = add nsw i32 %237, 1
  %239 = icmp slt i32 %237, 0
  %240 = select i1 %239, i32 %231, i32 %238
  %241 = or i32 %232, 1
  %242 = getelementptr inbounds [40 x i32], [40 x i32] addrspace(5)* %8, i32 0, i32 %241
  %243 = load i32, i32 addrspace(5)* %242, align 4, !tbaa !4
  %244 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(3)* @_ZZ10MakeSplitsiPiS_S_S_S_S_E8scratchA, i32 0, i32 %243
  %245 = load i32, i32 addrspace(3)* %244, align 4, !tbaa !4
  %246 = add nsw i32 %245, 1
  %247 = icmp slt i32 %245, 0
  %248 = select i1 %247, i32 %240, i32 %246
  %249 = or i32 %232, 2
  %250 = getelementptr inbounds [40 x i32], [40 x i32] addrspace(5)* %8, i32 0, i32 %249
  %251 = load i32, i32 addrspace(5)* %250, align 8, !tbaa !4
  %252 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(3)* @_ZZ10MakeSplitsiPiS_S_S_S_S_E8scratchA, i32 0, i32 %251
  %253 = load i32, i32 addrspace(3)* %252, align 4, !tbaa !4
  %254 = add nsw i32 %253, 1
  %255 = icmp slt i32 %253, 0
  %256 = select i1 %255, i32 %248, i32 %254
  %257 = or i32 %232, 3
  %258 = getelementptr inbounds [40 x i32], [40 x i32] addrspace(5)* %8, i32 0, i32 %257
  %259 = load i32, i32 addrspace(5)* %258, align 4, !tbaa !4
  %260 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(3)* @_ZZ10MakeSplitsiPiS_S_S_S_S_E8scratchA, i32 0, i32 %259
  %261 = load i32, i32 addrspace(3)* %260, align 4, !tbaa !4
  %262 = add nsw i32 %261, 1
  %263 = icmp slt i32 %261, 0
  %264 = select i1 %263, i32 %256, i32 %262
  %265 = or i32 %232, 4
  %266 = getelementptr inbounds [40 x i32], [40 x i32] addrspace(5)* %8, i32 0, i32 %265
  %267 = load i32, i32 addrspace(5)* %266, align 16, !tbaa !4
  %268 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(3)* @_ZZ10MakeSplitsiPiS_S_S_S_S_E8scratchA, i32 0, i32 %267
  %269 = load i32, i32 addrspace(3)* %268, align 4, !tbaa !4
  %270 = add nsw i32 %269, 1
  %271 = icmp slt i32 %269, 0
  %272 = select i1 %271, i32 %264, i32 %270
  %273 = or i32 %232, 5
  %274 = getelementptr inbounds [40 x i32], [40 x i32] addrspace(5)* %8, i32 0, i32 %273
  %275 = load i32, i32 addrspace(5)* %274, align 4, !tbaa !4
  %276 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(3)* @_ZZ10MakeSplitsiPiS_S_S_S_S_E8scratchA, i32 0, i32 %275
  %277 = load i32, i32 addrspace(3)* %276, align 4, !tbaa !4
  %278 = add nsw i32 %277, 1
  %279 = icmp slt i32 %277, 0
  %280 = select i1 %279, i32 %272, i32 %278
  %281 = or i32 %232, 6
  %282 = getelementptr inbounds [40 x i32], [40 x i32] addrspace(5)* %8, i32 0, i32 %281
  %283 = load i32, i32 addrspace(5)* %282, align 8, !tbaa !4
  %284 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(3)* @_ZZ10MakeSplitsiPiS_S_S_S_S_E8scratchA, i32 0, i32 %283
  %285 = load i32, i32 addrspace(3)* %284, align 4, !tbaa !4
  %286 = add nsw i32 %285, 1
  %287 = icmp slt i32 %285, 0
  %288 = select i1 %287, i32 %280, i32 %286
  %289 = or i32 %232, 7
  %290 = getelementptr inbounds [40 x i32], [40 x i32] addrspace(5)* %8, i32 0, i32 %289
  %291 = load i32, i32 addrspace(5)* %290, align 4, !tbaa !4
  %292 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(3)* @_ZZ10MakeSplitsiPiS_S_S_S_S_E8scratchA, i32 0, i32 %291
  %293 = load i32, i32 addrspace(3)* %292, align 4, !tbaa !4
  %294 = add nsw i32 %293, 1
  %295 = icmp slt i32 %293, 0
  %296 = select i1 %295, i32 %288, i32 %294
  %297 = add nuw nsw i32 %232, 8
  %298 = add i32 %233, 8
  %299 = icmp eq i32 %298, %220
  br i1 %299, label %300, label %230, !llvm.loop !20

300:                                              ; preds = %230, %229
  %301 = phi i32 [ undef, %229 ], [ %296, %230 ]
  %302 = phi i32 [ -1, %229 ], [ %296, %230 ]
  %303 = phi i32 [ 0, %229 ], [ %297, %230 ]
  br i1 %221, label %318, label %304

304:                                              ; preds = %300, %304
  %305 = phi i32 [ %314, %304 ], [ %302, %300 ]
  %306 = phi i32 [ %315, %304 ], [ %303, %300 ]
  %307 = phi i32 [ %316, %304 ], [ 0, %300 ]
  %308 = getelementptr inbounds [40 x i32], [40 x i32] addrspace(5)* %8, i32 0, i32 %306
  %309 = load i32, i32 addrspace(5)* %308, align 4, !tbaa !4
  %310 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(3)* @_ZZ10MakeSplitsiPiS_S_S_S_S_E8scratchA, i32 0, i32 %309
  %311 = load i32, i32 addrspace(3)* %310, align 4, !tbaa !4
  %312 = add nsw i32 %311, 1
  %313 = icmp slt i32 %311, 0
  %314 = select i1 %313, i32 %305, i32 %312
  %315 = add nuw nsw i32 %306, 1
  %316 = add i32 %307, 1
  %317 = icmp eq i32 %316, %218
  br i1 %317, label %318, label %304, !llvm.loop !21

318:                                              ; preds = %300, %304, %222
  %319 = phi i32 [ %228, %222 ], [ %301, %300 ], [ %314, %304 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %320 = icmp slt i32 %319, 1
  %321 = select i1 %215, i1 true, i1 %320
  %322 = select i1 %321, i1 true, i1 %224
  br i1 %322, label %324, label %323

323:                                              ; preds = %318
  store i32 %319, i32 addrspace(3)* %216, align 4, !tbaa !4
  store i32 %21, i32 addrspace(3)* @_ZZ10MakeSplitsiPiS_S_S_S_S_E5rootB, align 4, !tbaa !4
  store i8 1, i8 addrspace(3)* @_ZZ10MakeSplitsiPiS_S_S_S_S_E10incomplete, align 1, !tbaa !9
  br label %324

324:                                              ; preds = %318, %323
  %325 = phi i1 [ true, %323 ], [ %224, %318 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %326 = load i8, i8 addrspace(3)* @_ZZ10MakeSplitsiPiS_S_S_S_S_E10incomplete, align 1, !tbaa !9, !range !15
  %327 = icmp eq i8 %326, 0
  br i1 %327, label %328, label %222, !llvm.loop !22

328:                                              ; preds = %324, %208
  %329 = phi i32 [ %210, %208 ], [ %319, %324 ]
  %330 = load i32, i32 addrspace(3)* @_ZZ10MakeSplitsiPiS_S_S_S_S_E5rootA, align 4, !tbaa !4
  %331 = icmp eq i32 %21, %330
  %332 = select i1 %331, i32 %12, i32 -1
  %333 = load i32, i32 addrspace(3)* @_ZZ10MakeSplitsiPiS_S_S_S_S_E5rootB, align 4, !tbaa !4
  %334 = icmp eq i32 %21, %333
  %335 = select i1 %334, i32 %20, i32 %332
  br i1 %22, label %336, label %340

336:                                              ; preds = %328
  %337 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(3)* @_ZZ10MakeSplitsiPiS_S_S_S_S_E8scratchA, i32 0, i32 %21
  store i32 %335, i32 addrspace(3)* %337, align 4, !tbaa !4
  %338 = ashr i32 %335, 31
  %339 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(3)* @_ZZ10MakeSplitsiPiS_S_S_S_S_E8scratchB, i32 0, i32 %21
  store i32 %338, i32 addrspace(3)* %339, align 4, !tbaa !4
  br label %340

340:                                              ; preds = %336, %328
  store i8 1, i8 addrspace(3)* @_ZZ10MakeSplitsiPiS_S_S_S_S_E10incomplete, align 1, !tbaa !9
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %341 = load i8, i8 addrspace(3)* @_ZZ10MakeSplitsiPiS_S_S_S_S_E10incomplete, align 1, !tbaa !9, !range !15
  %342 = icmp eq i8 %341, 0
  br i1 %342, label %515, label %343

343:                                              ; preds = %340
  %344 = icmp sgt i32 %77, 0
  %345 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(3)* @_ZZ10MakeSplitsiPiS_S_S_S_S_E8scratchA, i32 0, i32 %21
  %346 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(3)* @_ZZ10MakeSplitsiPiS_S_S_S_S_E8scratchB, i32 0, i32 %21
  %347 = and i32 %77, 7
  %348 = icmp ult i32 %77, 8
  %349 = and i32 %77, -8
  %350 = icmp eq i32 %347, 0
  br label %351

351:                                              ; preds = %343, %512
  %352 = phi i32 [ %329, %343 ], [ %510, %512 ]
  %353 = phi i32 [ %335, %343 ], [ %509, %512 ]
  store i8 0, i8 addrspace(3)* @_ZZ10MakeSplitsiPiS_S_S_S_S_E10incomplete, align 1, !tbaa !9
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %354 = icmp eq i32 %353, -1
  %355 = select i1 %22, i1 %354, i1 false
  br i1 %355, label %356, label %508

356:                                              ; preds = %351
  br i1 %344, label %357, label %384

357:                                              ; preds = %356
  br i1 %348, label %358, label %388

358:                                              ; preds = %493, %357
  %359 = phi i32 [ undef, %357 ], [ %494, %493 ]
  %360 = phi i32 [ undef, %357 ], [ %495, %493 ]
  %361 = phi i32 [ %352, %357 ], [ %495, %493 ]
  %362 = phi i32 [ 0, %357 ], [ %496, %493 ]
  %363 = phi i32 [ -1, %357 ], [ %494, %493 ]
  br i1 %350, label %384, label %364

364:                                              ; preds = %358, %378
  %365 = phi i32 [ %380, %378 ], [ %361, %358 ]
  %366 = phi i32 [ %381, %378 ], [ %362, %358 ]
  %367 = phi i32 [ %379, %378 ], [ %363, %358 ]
  %368 = phi i32 [ %382, %378 ], [ 0, %358 ]
  %369 = getelementptr inbounds [40 x i32], [40 x i32] addrspace(5)* %8, i32 0, i32 %366
  %370 = load i32, i32 addrspace(5)* %369, align 4, !tbaa !4
  %371 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(3)* @_ZZ10MakeSplitsiPiS_S_S_S_S_E8scratchA, i32 0, i32 %370
  %372 = load i32, i32 addrspace(3)* %371, align 4, !tbaa !4
  %373 = icmp sgt i32 %372, -1
  br i1 %373, label %374, label %378

374:                                              ; preds = %364
  %375 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(3)* @_ZZ10MakeSplitsiPiS_S_S_S_S_E8scratchB, i32 0, i32 %370
  %376 = load i32, i32 addrspace(3)* %375, align 4, !tbaa !4
  %377 = add nsw i32 %376, 1
  br label %378

378:                                              ; preds = %374, %364
  %379 = phi i32 [ %372, %374 ], [ %367, %364 ]
  %380 = phi i32 [ %377, %374 ], [ %365, %364 ]
  %381 = add nuw nsw i32 %366, 1
  %382 = add i32 %368, 1
  %383 = icmp eq i32 %382, %347
  br i1 %383, label %384, label %364, !llvm.loop !23

384:                                              ; preds = %358, %378, %356
  %385 = phi i32 [ -1, %356 ], [ %359, %358 ], [ %379, %378 ]
  %386 = phi i32 [ %352, %356 ], [ %360, %358 ], [ %380, %378 ]
  %387 = icmp eq i32 %385, -1
  br i1 %387, label %499, label %500

388:                                              ; preds = %357, %493
  %389 = phi i32 [ %495, %493 ], [ %352, %357 ]
  %390 = phi i32 [ %496, %493 ], [ 0, %357 ]
  %391 = phi i32 [ %494, %493 ], [ -1, %357 ]
  %392 = phi i32 [ %497, %493 ], [ 0, %357 ]
  %393 = getelementptr inbounds [40 x i32], [40 x i32] addrspace(5)* %8, i32 0, i32 %390
  %394 = load i32, i32 addrspace(5)* %393, align 16, !tbaa !4
  %395 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(3)* @_ZZ10MakeSplitsiPiS_S_S_S_S_E8scratchA, i32 0, i32 %394
  %396 = load i32, i32 addrspace(3)* %395, align 4, !tbaa !4
  %397 = icmp sgt i32 %396, -1
  br i1 %397, label %398, label %402

398:                                              ; preds = %388
  %399 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(3)* @_ZZ10MakeSplitsiPiS_S_S_S_S_E8scratchB, i32 0, i32 %394
  %400 = load i32, i32 addrspace(3)* %399, align 4, !tbaa !4
  %401 = add nsw i32 %400, 1
  br label %402

402:                                              ; preds = %398, %388
  %403 = phi i32 [ %396, %398 ], [ %391, %388 ]
  %404 = phi i32 [ %401, %398 ], [ %389, %388 ]
  %405 = or i32 %390, 1
  %406 = getelementptr inbounds [40 x i32], [40 x i32] addrspace(5)* %8, i32 0, i32 %405
  %407 = load i32, i32 addrspace(5)* %406, align 4, !tbaa !4
  %408 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(3)* @_ZZ10MakeSplitsiPiS_S_S_S_S_E8scratchA, i32 0, i32 %407
  %409 = load i32, i32 addrspace(3)* %408, align 4, !tbaa !4
  %410 = icmp sgt i32 %409, -1
  br i1 %410, label %411, label %415

411:                                              ; preds = %402
  %412 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(3)* @_ZZ10MakeSplitsiPiS_S_S_S_S_E8scratchB, i32 0, i32 %407
  %413 = load i32, i32 addrspace(3)* %412, align 4, !tbaa !4
  %414 = add nsw i32 %413, 1
  br label %415

415:                                              ; preds = %411, %402
  %416 = phi i32 [ %409, %411 ], [ %403, %402 ]
  %417 = phi i32 [ %414, %411 ], [ %404, %402 ]
  %418 = or i32 %390, 2
  %419 = getelementptr inbounds [40 x i32], [40 x i32] addrspace(5)* %8, i32 0, i32 %418
  %420 = load i32, i32 addrspace(5)* %419, align 8, !tbaa !4
  %421 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(3)* @_ZZ10MakeSplitsiPiS_S_S_S_S_E8scratchA, i32 0, i32 %420
  %422 = load i32, i32 addrspace(3)* %421, align 4, !tbaa !4
  %423 = icmp sgt i32 %422, -1
  br i1 %423, label %424, label %428

424:                                              ; preds = %415
  %425 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(3)* @_ZZ10MakeSplitsiPiS_S_S_S_S_E8scratchB, i32 0, i32 %420
  %426 = load i32, i32 addrspace(3)* %425, align 4, !tbaa !4
  %427 = add nsw i32 %426, 1
  br label %428

428:                                              ; preds = %424, %415
  %429 = phi i32 [ %422, %424 ], [ %416, %415 ]
  %430 = phi i32 [ %427, %424 ], [ %417, %415 ]
  %431 = or i32 %390, 3
  %432 = getelementptr inbounds [40 x i32], [40 x i32] addrspace(5)* %8, i32 0, i32 %431
  %433 = load i32, i32 addrspace(5)* %432, align 4, !tbaa !4
  %434 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(3)* @_ZZ10MakeSplitsiPiS_S_S_S_S_E8scratchA, i32 0, i32 %433
  %435 = load i32, i32 addrspace(3)* %434, align 4, !tbaa !4
  %436 = icmp sgt i32 %435, -1
  br i1 %436, label %437, label %441

437:                                              ; preds = %428
  %438 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(3)* @_ZZ10MakeSplitsiPiS_S_S_S_S_E8scratchB, i32 0, i32 %433
  %439 = load i32, i32 addrspace(3)* %438, align 4, !tbaa !4
  %440 = add nsw i32 %439, 1
  br label %441

441:                                              ; preds = %437, %428
  %442 = phi i32 [ %435, %437 ], [ %429, %428 ]
  %443 = phi i32 [ %440, %437 ], [ %430, %428 ]
  %444 = or i32 %390, 4
  %445 = getelementptr inbounds [40 x i32], [40 x i32] addrspace(5)* %8, i32 0, i32 %444
  %446 = load i32, i32 addrspace(5)* %445, align 16, !tbaa !4
  %447 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(3)* @_ZZ10MakeSplitsiPiS_S_S_S_S_E8scratchA, i32 0, i32 %446
  %448 = load i32, i32 addrspace(3)* %447, align 4, !tbaa !4
  %449 = icmp sgt i32 %448, -1
  br i1 %449, label %450, label %454

450:                                              ; preds = %441
  %451 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(3)* @_ZZ10MakeSplitsiPiS_S_S_S_S_E8scratchB, i32 0, i32 %446
  %452 = load i32, i32 addrspace(3)* %451, align 4, !tbaa !4
  %453 = add nsw i32 %452, 1
  br label %454

454:                                              ; preds = %450, %441
  %455 = phi i32 [ %448, %450 ], [ %442, %441 ]
  %456 = phi i32 [ %453, %450 ], [ %443, %441 ]
  %457 = or i32 %390, 5
  %458 = getelementptr inbounds [40 x i32], [40 x i32] addrspace(5)* %8, i32 0, i32 %457
  %459 = load i32, i32 addrspace(5)* %458, align 4, !tbaa !4
  %460 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(3)* @_ZZ10MakeSplitsiPiS_S_S_S_S_E8scratchA, i32 0, i32 %459
  %461 = load i32, i32 addrspace(3)* %460, align 4, !tbaa !4
  %462 = icmp sgt i32 %461, -1
  br i1 %462, label %463, label %467

463:                                              ; preds = %454
  %464 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(3)* @_ZZ10MakeSplitsiPiS_S_S_S_S_E8scratchB, i32 0, i32 %459
  %465 = load i32, i32 addrspace(3)* %464, align 4, !tbaa !4
  %466 = add nsw i32 %465, 1
  br label %467

467:                                              ; preds = %463, %454
  %468 = phi i32 [ %461, %463 ], [ %455, %454 ]
  %469 = phi i32 [ %466, %463 ], [ %456, %454 ]
  %470 = or i32 %390, 6
  %471 = getelementptr inbounds [40 x i32], [40 x i32] addrspace(5)* %8, i32 0, i32 %470
  %472 = load i32, i32 addrspace(5)* %471, align 8, !tbaa !4
  %473 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(3)* @_ZZ10MakeSplitsiPiS_S_S_S_S_E8scratchA, i32 0, i32 %472
  %474 = load i32, i32 addrspace(3)* %473, align 4, !tbaa !4
  %475 = icmp sgt i32 %474, -1
  br i1 %475, label %476, label %480

476:                                              ; preds = %467
  %477 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(3)* @_ZZ10MakeSplitsiPiS_S_S_S_S_E8scratchB, i32 0, i32 %472
  %478 = load i32, i32 addrspace(3)* %477, align 4, !tbaa !4
  %479 = add nsw i32 %478, 1
  br label %480

480:                                              ; preds = %476, %467
  %481 = phi i32 [ %474, %476 ], [ %468, %467 ]
  %482 = phi i32 [ %479, %476 ], [ %469, %467 ]
  %483 = or i32 %390, 7
  %484 = getelementptr inbounds [40 x i32], [40 x i32] addrspace(5)* %8, i32 0, i32 %483
  %485 = load i32, i32 addrspace(5)* %484, align 4, !tbaa !4
  %486 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(3)* @_ZZ10MakeSplitsiPiS_S_S_S_S_E8scratchA, i32 0, i32 %485
  %487 = load i32, i32 addrspace(3)* %486, align 4, !tbaa !4
  %488 = icmp sgt i32 %487, -1
  br i1 %488, label %489, label %493

489:                                              ; preds = %480
  %490 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(3)* @_ZZ10MakeSplitsiPiS_S_S_S_S_E8scratchB, i32 0, i32 %485
  %491 = load i32, i32 addrspace(3)* %490, align 4, !tbaa !4
  %492 = add nsw i32 %491, 1
  br label %493

493:                                              ; preds = %489, %480
  %494 = phi i32 [ %487, %489 ], [ %481, %480 ]
  %495 = phi i32 [ %492, %489 ], [ %482, %480 ]
  %496 = add nuw nsw i32 %390, 8
  %497 = add i32 %392, 8
  %498 = icmp eq i32 %497, %349
  br i1 %498, label %358, label %388, !llvm.loop !24

499:                                              ; preds = %384
  store i8 1, i8 addrspace(3)* @_ZZ10MakeSplitsiPiS_S_S_S_S_E10incomplete, align 1, !tbaa !9
  br label %500

500:                                              ; preds = %499, %384
  %501 = icmp eq i32 %385, %20
  br i1 %501, label %502, label %504

502:                                              ; preds = %500
  %503 = atomicrmw add i32 addrspace(3)* @_ZZ10MakeSplitsiPiS_S_S_S_S_E6bCount, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %504

504:                                              ; preds = %502, %500
  %505 = icmp eq i32 %385, %12
  br i1 %505, label %506, label %508

506:                                              ; preds = %504
  %507 = atomicrmw add i32 addrspace(3)* @_ZZ10MakeSplitsiPiS_S_S_S_S_E6aCount, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %508

508:                                              ; preds = %504, %506, %351
  %509 = phi i32 [ %12, %506 ], [ %385, %504 ], [ %353, %351 ]
  %510 = phi i32 [ %386, %506 ], [ %386, %504 ], [ %352, %351 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %22, label %511, label %512

511:                                              ; preds = %508
  store i32 %509, i32 addrspace(3)* %345, align 4, !tbaa !4
  store i32 %510, i32 addrspace(3)* %346, align 4, !tbaa !4
  br label %512

512:                                              ; preds = %511, %508
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %513 = load i8, i8 addrspace(3)* @_ZZ10MakeSplitsiPiS_S_S_S_S_E10incomplete, align 1, !tbaa !9, !range !15
  %514 = icmp eq i8 %513, 0
  br i1 %514, label %515, label %351, !llvm.loop !25

515:                                              ; preds = %512, %340
  %516 = phi i32 [ %335, %340 ], [ %509, %512 ]
  %517 = phi i32 [ %329, %340 ], [ %510, %512 ]
  %518 = load i32, i32 addrspace(3)* @_ZZ10MakeSplitsiPiS_S_S_S_S_E6aCount, align 4, !tbaa !4
  %519 = load i32, i32 addrspace(3)* @_ZZ10MakeSplitsiPiS_S_S_S_S_E6bCount, align 4, !tbaa !4
  %520 = icmp sgt i32 %518, %519
  %521 = sub nsw i32 %518, %519
  %522 = sub nsw i32 %519, %518
  %523 = select i1 %520, i32 %521, i32 %522
  %524 = icmp slt i32 %518, %519
  store i32 0, i32 addrspace(3)* @_ZZ10MakeSplitsiPiS_S_S_S_S_E5moved, align 4, !tbaa !4
  %525 = sdiv i32 %523, 2
  store i8 1, i8 addrspace(3)* @_ZZ10MakeSplitsiPiS_S_S_S_S_E10incomplete, align 1, !tbaa !9
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %526 = load i8, i8 addrspace(3)* @_ZZ10MakeSplitsiPiS_S_S_S_S_E10incomplete, align 1, !tbaa !9, !range !15
  %527 = icmp ne i8 %526, 0
  %528 = load i32, i32 addrspace(3)* @_ZZ10MakeSplitsiPiS_S_S_S_S_E5moved, align 4
  %529 = icmp slt i32 %528, %525
  %530 = select i1 %527, i1 %529, i1 false
  br i1 %530, label %531, label %726

531:                                              ; preds = %515
  %532 = select i1 %524, i32 %20, i32 %12
  %533 = icmp eq i32 %516, %532
  %534 = icmp sgt i32 %77, 0
  %535 = select i1 %524, i32 -1, i32 1
  %536 = select i1 %524, i32 1, i32 -1
  %537 = select i1 %524, i32 %12, i32 %20
  %538 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(3)* @_ZZ10MakeSplitsiPiS_S_S_S_S_E8scratchA, i32 0, i32 %21
  %539 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(3)* @_ZZ10MakeSplitsiPiS_S_S_S_S_E8scratchB, i32 0, i32 %21
  %540 = and i32 %77, 7
  %541 = icmp ult i32 %77, 8
  %542 = and i32 %77, -8
  %543 = icmp eq i32 %540, 0
  br label %544

544:                                              ; preds = %531, %720
  store i8 0, i8 addrspace(3)* @_ZZ10MakeSplitsiPiS_S_S_S_S_E10incomplete, align 1, !tbaa !9
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %22, label %545, label %714

545:                                              ; preds = %544
  br i1 %534, label %546, label %578

546:                                              ; preds = %545
  br i1 %541, label %547, label %583

547:                                              ; preds = %583, %546
  %548 = phi i1 [ undef, %546 ], [ %696, %583 ]
  %549 = phi i32 [ undef, %546 ], [ %699, %583 ]
  %550 = phi i1 [ undef, %546 ], [ %707, %583 ]
  %551 = phi i32 [ 0, %546 ], [ %708, %583 ]
  %552 = phi i1 [ false, %546 ], [ %707, %583 ]
  %553 = phi i1 [ %533, %546 ], [ %696, %583 ]
  %554 = phi i32 [ 2147483647, %546 ], [ %699, %583 ]
  br i1 %543, label %578, label %555

555:                                              ; preds = %547, %555
  %556 = phi i32 [ %575, %555 ], [ %551, %547 ]
  %557 = phi i1 [ %574, %555 ], [ %552, %547 ]
  %558 = phi i1 [ %570, %555 ], [ %553, %547 ]
  %559 = phi i32 [ %573, %555 ], [ %554, %547 ]
  %560 = phi i32 [ %576, %555 ], [ 0, %547 ]
  %561 = getelementptr inbounds [40 x i32], [40 x i32] addrspace(5)* %8, i32 0, i32 %556
  %562 = load i32, i32 addrspace(5)* %561, align 4, !tbaa !4
  %563 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(3)* @_ZZ10MakeSplitsiPiS_S_S_S_S_E8scratchA, i32 0, i32 %562
  %564 = load i32, i32 addrspace(3)* %563, align 4, !tbaa !4
  %565 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(3)* @_ZZ10MakeSplitsiPiS_S_S_S_S_E8scratchB, i32 0, i32 %562
  %566 = load i32, i32 addrspace(3)* %565, align 4, !tbaa !4
  %567 = icmp ne i32 %564, %516
  %568 = icmp sle i32 %566, %517
  %569 = select i1 %567, i1 true, i1 %568
  %570 = select i1 %569, i1 %558, i1 false
  %571 = add nsw i32 %566, 1
  %572 = tail call i32 @llvm.smin.i32(i32 %571, i32 %559)
  %573 = select i1 %567, i32 %572, i32 %559
  %574 = select i1 %567, i1 true, i1 %557
  %575 = add nuw nsw i32 %556, 1
  %576 = add i32 %560, 1
  %577 = icmp eq i32 %576, %540
  br i1 %577, label %578, label %555, !llvm.loop !26

578:                                              ; preds = %547, %555, %545
  %579 = phi i32 [ 2147483647, %545 ], [ %549, %547 ], [ %573, %555 ]
  %580 = phi i1 [ %533, %545 ], [ %548, %547 ], [ %570, %555 ]
  %581 = phi i1 [ false, %545 ], [ %550, %547 ], [ %574, %555 ]
  %582 = select i1 %581, i1 %580, i1 false
  br i1 %582, label %711, label %714

583:                                              ; preds = %546, %583
  %584 = phi i32 [ %708, %583 ], [ 0, %546 ]
  %585 = phi i1 [ %707, %583 ], [ false, %546 ]
  %586 = phi i1 [ %696, %583 ], [ %533, %546 ]
  %587 = phi i32 [ %699, %583 ], [ 2147483647, %546 ]
  %588 = phi i32 [ %709, %583 ], [ 0, %546 ]
  %589 = getelementptr inbounds [40 x i32], [40 x i32] addrspace(5)* %8, i32 0, i32 %584
  %590 = load i32, i32 addrspace(5)* %589, align 16, !tbaa !4
  %591 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(3)* @_ZZ10MakeSplitsiPiS_S_S_S_S_E8scratchA, i32 0, i32 %590
  %592 = load i32, i32 addrspace(3)* %591, align 4, !tbaa !4
  %593 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(3)* @_ZZ10MakeSplitsiPiS_S_S_S_S_E8scratchB, i32 0, i32 %590
  %594 = load i32, i32 addrspace(3)* %593, align 4, !tbaa !4
  %595 = icmp ne i32 %592, %516
  %596 = icmp sle i32 %594, %517
  %597 = select i1 %595, i1 true, i1 %596
  %598 = add nsw i32 %594, 1
  %599 = tail call i32 @llvm.smin.i32(i32 %598, i32 %587)
  %600 = select i1 %595, i32 %599, i32 %587
  %601 = or i32 %584, 1
  %602 = getelementptr inbounds [40 x i32], [40 x i32] addrspace(5)* %8, i32 0, i32 %601
  %603 = load i32, i32 addrspace(5)* %602, align 4, !tbaa !4
  %604 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(3)* @_ZZ10MakeSplitsiPiS_S_S_S_S_E8scratchA, i32 0, i32 %603
  %605 = load i32, i32 addrspace(3)* %604, align 4, !tbaa !4
  %606 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(3)* @_ZZ10MakeSplitsiPiS_S_S_S_S_E8scratchB, i32 0, i32 %603
  %607 = load i32, i32 addrspace(3)* %606, align 4, !tbaa !4
  %608 = icmp ne i32 %605, %516
  %609 = icmp sle i32 %607, %517
  %610 = select i1 %608, i1 true, i1 %609
  %611 = add nsw i32 %607, 1
  %612 = tail call i32 @llvm.smin.i32(i32 %611, i32 %600)
  %613 = select i1 %608, i32 %612, i32 %600
  %614 = or i32 %584, 2
  %615 = getelementptr inbounds [40 x i32], [40 x i32] addrspace(5)* %8, i32 0, i32 %614
  %616 = load i32, i32 addrspace(5)* %615, align 8, !tbaa !4
  %617 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(3)* @_ZZ10MakeSplitsiPiS_S_S_S_S_E8scratchA, i32 0, i32 %616
  %618 = load i32, i32 addrspace(3)* %617, align 4, !tbaa !4
  %619 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(3)* @_ZZ10MakeSplitsiPiS_S_S_S_S_E8scratchB, i32 0, i32 %616
  %620 = load i32, i32 addrspace(3)* %619, align 4, !tbaa !4
  %621 = icmp ne i32 %618, %516
  %622 = icmp sle i32 %620, %517
  %623 = select i1 %621, i1 true, i1 %622
  %624 = add nsw i32 %620, 1
  %625 = tail call i32 @llvm.smin.i32(i32 %624, i32 %613)
  %626 = select i1 %621, i32 %625, i32 %613
  %627 = or i32 %584, 3
  %628 = getelementptr inbounds [40 x i32], [40 x i32] addrspace(5)* %8, i32 0, i32 %627
  %629 = load i32, i32 addrspace(5)* %628, align 4, !tbaa !4
  %630 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(3)* @_ZZ10MakeSplitsiPiS_S_S_S_S_E8scratchA, i32 0, i32 %629
  %631 = load i32, i32 addrspace(3)* %630, align 4, !tbaa !4
  %632 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(3)* @_ZZ10MakeSplitsiPiS_S_S_S_S_E8scratchB, i32 0, i32 %629
  %633 = load i32, i32 addrspace(3)* %632, align 4, !tbaa !4
  %634 = icmp ne i32 %631, %516
  %635 = icmp sle i32 %633, %517
  %636 = select i1 %634, i1 true, i1 %635
  %637 = add nsw i32 %633, 1
  %638 = tail call i32 @llvm.smin.i32(i32 %637, i32 %626)
  %639 = select i1 %634, i32 %638, i32 %626
  %640 = or i32 %584, 4
  %641 = getelementptr inbounds [40 x i32], [40 x i32] addrspace(5)* %8, i32 0, i32 %640
  %642 = load i32, i32 addrspace(5)* %641, align 16, !tbaa !4
  %643 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(3)* @_ZZ10MakeSplitsiPiS_S_S_S_S_E8scratchA, i32 0, i32 %642
  %644 = load i32, i32 addrspace(3)* %643, align 4, !tbaa !4
  %645 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(3)* @_ZZ10MakeSplitsiPiS_S_S_S_S_E8scratchB, i32 0, i32 %642
  %646 = load i32, i32 addrspace(3)* %645, align 4, !tbaa !4
  %647 = icmp ne i32 %644, %516
  %648 = icmp sle i32 %646, %517
  %649 = select i1 %647, i1 true, i1 %648
  %650 = add nsw i32 %646, 1
  %651 = tail call i32 @llvm.smin.i32(i32 %650, i32 %639)
  %652 = select i1 %647, i32 %651, i32 %639
  %653 = or i32 %584, 5
  %654 = getelementptr inbounds [40 x i32], [40 x i32] addrspace(5)* %8, i32 0, i32 %653
  %655 = load i32, i32 addrspace(5)* %654, align 4, !tbaa !4
  %656 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(3)* @_ZZ10MakeSplitsiPiS_S_S_S_S_E8scratchA, i32 0, i32 %655
  %657 = load i32, i32 addrspace(3)* %656, align 4, !tbaa !4
  %658 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(3)* @_ZZ10MakeSplitsiPiS_S_S_S_S_E8scratchB, i32 0, i32 %655
  %659 = load i32, i32 addrspace(3)* %658, align 4, !tbaa !4
  %660 = icmp ne i32 %657, %516
  %661 = icmp sle i32 %659, %517
  %662 = select i1 %660, i1 true, i1 %661
  %663 = add nsw i32 %659, 1
  %664 = tail call i32 @llvm.smin.i32(i32 %663, i32 %652)
  %665 = select i1 %660, i32 %664, i32 %652
  %666 = or i32 %584, 6
  %667 = getelementptr inbounds [40 x i32], [40 x i32] addrspace(5)* %8, i32 0, i32 %666
  %668 = load i32, i32 addrspace(5)* %667, align 8, !tbaa !4
  %669 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(3)* @_ZZ10MakeSplitsiPiS_S_S_S_S_E8scratchA, i32 0, i32 %668
  %670 = load i32, i32 addrspace(3)* %669, align 4, !tbaa !4
  %671 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(3)* @_ZZ10MakeSplitsiPiS_S_S_S_S_E8scratchB, i32 0, i32 %668
  %672 = load i32, i32 addrspace(3)* %671, align 4, !tbaa !4
  %673 = icmp ne i32 %670, %516
  %674 = icmp sle i32 %672, %517
  %675 = select i1 %673, i1 true, i1 %674
  %676 = add nsw i32 %672, 1
  %677 = tail call i32 @llvm.smin.i32(i32 %676, i32 %665)
  %678 = select i1 %673, i32 %677, i32 %665
  %679 = or i32 %584, 7
  %680 = getelementptr inbounds [40 x i32], [40 x i32] addrspace(5)* %8, i32 0, i32 %679
  %681 = load i32, i32 addrspace(5)* %680, align 4, !tbaa !4
  %682 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(3)* @_ZZ10MakeSplitsiPiS_S_S_S_S_E8scratchA, i32 0, i32 %681
  %683 = load i32, i32 addrspace(3)* %682, align 4, !tbaa !4
  %684 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(3)* @_ZZ10MakeSplitsiPiS_S_S_S_S_E8scratchB, i32 0, i32 %681
  %685 = load i32, i32 addrspace(3)* %684, align 4, !tbaa !4
  %686 = icmp ne i32 %683, %516
  %687 = icmp sle i32 %685, %517
  %688 = select i1 %686, i1 true, i1 %687
  %689 = select i1 %688, i1 %675, i1 false
  %690 = select i1 %689, i1 %662, i1 false
  %691 = select i1 %690, i1 %649, i1 false
  %692 = select i1 %691, i1 %636, i1 false
  %693 = select i1 %692, i1 %623, i1 false
  %694 = select i1 %693, i1 %610, i1 false
  %695 = select i1 %694, i1 %597, i1 false
  %696 = select i1 %695, i1 %586, i1 false
  %697 = add nsw i32 %685, 1
  %698 = tail call i32 @llvm.smin.i32(i32 %697, i32 %678)
  %699 = select i1 %686, i32 %698, i32 %678
  %700 = select i1 %686, i1 true, i1 %673
  %701 = select i1 %700, i1 true, i1 %660
  %702 = select i1 %701, i1 true, i1 %647
  %703 = select i1 %702, i1 true, i1 %634
  %704 = select i1 %703, i1 true, i1 %621
  %705 = select i1 %704, i1 true, i1 %608
  %706 = select i1 %705, i1 true, i1 %595
  %707 = select i1 %706, i1 true, i1 %585
  %708 = add nuw nsw i32 %584, 8
  %709 = add i32 %588, 8
  %710 = icmp eq i32 %709, %542
  br i1 %710, label %547, label %583, !llvm.loop !27

711:                                              ; preds = %578
  %712 = atomicrmw add i32 addrspace(3)* @_ZZ10MakeSplitsiPiS_S_S_S_S_E5moved, i32 1 syncscope("agent-one-as") monotonic, align 4
  %713 = icmp ult i32 %712, %525
  br label %714

714:                                              ; preds = %711, %578, %544
  %715 = phi i1 [ false, %544 ], [ false, %578 ], [ %713, %711 ]
  %716 = phi i32 [ 2147483647, %544 ], [ %579, %578 ], [ %579, %711 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %715, label %717, label %720

717:                                              ; preds = %714
  %718 = atomicrmw add i32 addrspace(3)* @_ZZ10MakeSplitsiPiS_S_S_S_S_E6bCount, i32 %535 syncscope("agent-one-as") monotonic, align 4
  %719 = atomicrmw add i32 addrspace(3)* @_ZZ10MakeSplitsiPiS_S_S_S_S_E6aCount, i32 %536 syncscope("agent-one-as") monotonic, align 4
  store i32 %537, i32 addrspace(3)* %538, align 4, !tbaa !4
  store i32 %716, i32 addrspace(3)* %539, align 4, !tbaa !4
  store i8 1, i8 addrspace(3)* @_ZZ10MakeSplitsiPiS_S_S_S_S_E10incomplete, align 1, !tbaa !9
  br label %720

720:                                              ; preds = %717, %714
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %721 = load i8, i8 addrspace(3)* @_ZZ10MakeSplitsiPiS_S_S_S_S_E10incomplete, align 1, !tbaa !9, !range !15
  %722 = icmp ne i8 %721, 0
  %723 = load i32, i32 addrspace(3)* @_ZZ10MakeSplitsiPiS_S_S_S_S_E5moved, align 4
  %724 = icmp slt i32 %723, %525
  %725 = select i1 %722, i1 %724, i1 false
  br i1 %725, label %544, label %726, !llvm.loop !28

726:                                              ; preds = %720, %515
  br i1 %22, label %727, label %731

727:                                              ; preds = %726
  %728 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(3)* @_ZZ10MakeSplitsiPiS_S_S_S_S_E8scratchA, i32 0, i32 %21
  %729 = load i32, i32 addrspace(3)* %728, align 4, !tbaa !4
  %730 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %76
  store i32 %729, i32 addrspace(1)* %730, align 4, !tbaa !4
  br label %731

731:                                              ; preds = %727, %726
  call void @llvm.lifetime.end.p5i8(i64 160, i8 addrspace(5)* %30) #5
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #3

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smin.i32(i32, i32) #4

attributes #0 = { argmemonly mustprogress nocallback nofree nosync nounwind willreturn }
attributes #1 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #2 = { convergent mustprogress nounwind willreturn }
attributes #3 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #4 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #5 = { nounwind }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"int", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{}
!9 = !{!10, !10, i64 0}
!10 = !{!"bool", !6, i64 0}
!11 = !{i32 0, i32 1024}
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.mustprogress"}
!14 = distinct !{!14, !13}
!15 = !{i8 0, i8 2}
!16 = distinct !{!16, !13}
!17 = distinct !{!17, !18}
!18 = !{!"llvm.loop.unroll.disable"}
!19 = distinct !{!19, !13}
!20 = distinct !{!20, !13}
!21 = distinct !{!21, !18}
!22 = distinct !{!22, !13}
!23 = distinct !{!23, !18}
!24 = distinct !{!24, !13}
!25 = distinct !{!25, !13}
!26 = distinct !{!26, !18}
!27 = distinct !{!27, !13}
!28 = distinct !{!28, !13}
