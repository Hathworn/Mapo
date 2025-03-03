; ModuleID = '../data/hip_kernels/14071/0/main.cu'
source_filename = "../data/hip_kernels/14071/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z11convolvePSFiiiPsS_Pfii(i32 %0, i32 %1, i32 %2, i16 addrspace(1)* nocapture readonly %3, i16 addrspace(1)* nocapture writeonly %4, float addrspace(1)* nocapture readonly %5, i32 %6, i32 %7) local_unnamed_addr #1 {
  %9 = alloca [13 x [13 x float]], align 16, addrspace(5)
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = shl i32 %10, 5
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %13 = add i32 %11, %12
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %15 = shl i32 %14, 5
  %16 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %17 = add i32 %15, %16
  %18 = sub nsw i32 %13, %6
  %19 = tail call i32 @llvm.smax.i32(i32 %18, i32 0)
  %20 = sub nsw i32 %17, %6
  %21 = tail call i32 @llvm.smax.i32(i32 %20, i32 0)
  %22 = add nsw i32 %13, %6
  %23 = tail call i32 @llvm.smin.i32(i32 %22, i32 %0)
  %24 = add nsw i32 %17, %6
  %25 = tail call i32 @llvm.smin.i32(i32 %24, i32 %1)
  %26 = sub nsw i32 %23, %19
  %27 = sub i32 %25, %21
  %28 = icmp slt i32 %26, 1
  %29 = icmp slt i32 %27, 1
  %30 = select i1 %28, i1 true, i1 %29
  br i1 %30, label %215, label %31

31:                                               ; preds = %8
  %32 = bitcast [13 x [13 x float]] addrspace(5)* %9 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 676, i8 addrspace(5)* %32) #5
  %33 = icmp slt i32 %18, 0
  %34 = sub nsw i32 %7, %26
  %35 = select i1 %33, i32 0, i32 %34
  %36 = icmp slt i32 %20, 0
  %37 = sub nsw i32 %7, %27
  %38 = select i1 %36, i32 0, i32 %37
  %39 = xor i32 %21, -1
  %40 = add i32 %25, %39
  %41 = and i32 %27, 7
  %42 = icmp ult i32 %40, 7
  %43 = and i32 %27, -8
  %44 = icmp eq i32 %41, 0
  br label %45

45:                                               ; preds = %31, %77
  %46 = phi i32 [ 0, %31 ], [ %79, %77 ]
  %47 = phi float [ 0.000000e+00, %31 ], [ %78, %77 ]
  %48 = add nuw nsw i32 %46, %19
  %49 = mul nsw i32 %48, %1
  %50 = add nsw i32 %49, %21
  br i1 %42, label %59, label %81

51:                                               ; preds = %77
  %52 = icmp sgt i32 %26, 0
  br i1 %52, label %53, label %158

53:                                               ; preds = %51
  %54 = icmp sgt i32 %27, 0
  %55 = and i32 %27, 1
  %56 = icmp eq i32 %40, 0
  %57 = and i32 %27, -2
  %58 = icmp eq i32 %55, 0
  br label %151

59:                                               ; preds = %81, %45
  %60 = phi float [ undef, %45 ], [ %146, %81 ]
  %61 = phi i32 [ 0, %45 ], [ %148, %81 ]
  %62 = phi float [ %47, %45 ], [ %146, %81 ]
  br i1 %44, label %77, label %63

63:                                               ; preds = %59, %63
  %64 = phi i32 [ %74, %63 ], [ %61, %59 ]
  %65 = phi float [ %72, %63 ], [ %62, %59 ]
  %66 = phi i32 [ %75, %63 ], [ 0, %59 ]
  %67 = add nsw i32 %50, %64
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds i16, i16 addrspace(1)* %3, i64 %68
  %70 = load i16, i16 addrspace(1)* %69, align 2, !tbaa !5, !amdgpu.noclobber !9
  %71 = sitofp i16 %70 to float
  %72 = fadd contract float %65, %71
  %73 = getelementptr inbounds [13 x [13 x float]], [13 x [13 x float]] addrspace(5)* %9, i32 0, i32 %46, i32 %64
  store float %71, float addrspace(5)* %73, align 4, !tbaa !10
  %74 = add nuw nsw i32 %64, 1
  %75 = add i32 %66, 1
  %76 = icmp eq i32 %75, %41
  br i1 %76, label %77, label %63, !llvm.loop !12

77:                                               ; preds = %63, %59
  %78 = phi float [ %60, %59 ], [ %72, %63 ]
  %79 = add nuw nsw i32 %46, 1
  %80 = icmp slt i32 %79, %26
  br i1 %80, label %45, label %51, !llvm.loop !14

81:                                               ; preds = %45, %81
  %82 = phi i32 [ %148, %81 ], [ 0, %45 ]
  %83 = phi float [ %146, %81 ], [ %47, %45 ]
  %84 = phi i32 [ %149, %81 ], [ 0, %45 ]
  %85 = add nsw i32 %50, %82
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds i16, i16 addrspace(1)* %3, i64 %86
  %88 = load i16, i16 addrspace(1)* %87, align 2, !tbaa !5, !amdgpu.noclobber !9
  %89 = sitofp i16 %88 to float
  %90 = fadd contract float %83, %89
  %91 = getelementptr inbounds [13 x [13 x float]], [13 x [13 x float]] addrspace(5)* %9, i32 0, i32 %46, i32 %82
  store float %89, float addrspace(5)* %91, align 4, !tbaa !10
  %92 = or i32 %82, 1
  %93 = add nsw i32 %50, %92
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds i16, i16 addrspace(1)* %3, i64 %94
  %96 = load i16, i16 addrspace(1)* %95, align 2, !tbaa !5, !amdgpu.noclobber !9
  %97 = sitofp i16 %96 to float
  %98 = fadd contract float %90, %97
  %99 = getelementptr inbounds [13 x [13 x float]], [13 x [13 x float]] addrspace(5)* %9, i32 0, i32 %46, i32 %92
  store float %97, float addrspace(5)* %99, align 4, !tbaa !10
  %100 = or i32 %82, 2
  %101 = add nsw i32 %50, %100
  %102 = sext i32 %101 to i64
  %103 = getelementptr inbounds i16, i16 addrspace(1)* %3, i64 %102
  %104 = load i16, i16 addrspace(1)* %103, align 2, !tbaa !5, !amdgpu.noclobber !9
  %105 = sitofp i16 %104 to float
  %106 = fadd contract float %98, %105
  %107 = getelementptr inbounds [13 x [13 x float]], [13 x [13 x float]] addrspace(5)* %9, i32 0, i32 %46, i32 %100
  store float %105, float addrspace(5)* %107, align 4, !tbaa !10
  %108 = or i32 %82, 3
  %109 = add nsw i32 %50, %108
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds i16, i16 addrspace(1)* %3, i64 %110
  %112 = load i16, i16 addrspace(1)* %111, align 2, !tbaa !5, !amdgpu.noclobber !9
  %113 = sitofp i16 %112 to float
  %114 = fadd contract float %106, %113
  %115 = getelementptr inbounds [13 x [13 x float]], [13 x [13 x float]] addrspace(5)* %9, i32 0, i32 %46, i32 %108
  store float %113, float addrspace(5)* %115, align 4, !tbaa !10
  %116 = or i32 %82, 4
  %117 = add nsw i32 %50, %116
  %118 = sext i32 %117 to i64
  %119 = getelementptr inbounds i16, i16 addrspace(1)* %3, i64 %118
  %120 = load i16, i16 addrspace(1)* %119, align 2, !tbaa !5, !amdgpu.noclobber !9
  %121 = sitofp i16 %120 to float
  %122 = fadd contract float %114, %121
  %123 = getelementptr inbounds [13 x [13 x float]], [13 x [13 x float]] addrspace(5)* %9, i32 0, i32 %46, i32 %116
  store float %121, float addrspace(5)* %123, align 4, !tbaa !10
  %124 = or i32 %82, 5
  %125 = add nsw i32 %50, %124
  %126 = sext i32 %125 to i64
  %127 = getelementptr inbounds i16, i16 addrspace(1)* %3, i64 %126
  %128 = load i16, i16 addrspace(1)* %127, align 2, !tbaa !5, !amdgpu.noclobber !9
  %129 = sitofp i16 %128 to float
  %130 = fadd contract float %122, %129
  %131 = getelementptr inbounds [13 x [13 x float]], [13 x [13 x float]] addrspace(5)* %9, i32 0, i32 %46, i32 %124
  store float %129, float addrspace(5)* %131, align 4, !tbaa !10
  %132 = or i32 %82, 6
  %133 = add nsw i32 %50, %132
  %134 = sext i32 %133 to i64
  %135 = getelementptr inbounds i16, i16 addrspace(1)* %3, i64 %134
  %136 = load i16, i16 addrspace(1)* %135, align 2, !tbaa !5, !amdgpu.noclobber !9
  %137 = sitofp i16 %136 to float
  %138 = fadd contract float %130, %137
  %139 = getelementptr inbounds [13 x [13 x float]], [13 x [13 x float]] addrspace(5)* %9, i32 0, i32 %46, i32 %132
  store float %137, float addrspace(5)* %139, align 4, !tbaa !10
  %140 = or i32 %82, 7
  %141 = add nsw i32 %50, %140
  %142 = sext i32 %141 to i64
  %143 = getelementptr inbounds i16, i16 addrspace(1)* %3, i64 %142
  %144 = load i16, i16 addrspace(1)* %143, align 2, !tbaa !5, !amdgpu.noclobber !9
  %145 = sitofp i16 %144 to float
  %146 = fadd contract float %138, %145
  %147 = getelementptr inbounds [13 x [13 x float]], [13 x [13 x float]] addrspace(5)* %9, i32 0, i32 %46, i32 %140
  store float %145, float addrspace(5)* %147, align 4, !tbaa !10
  %148 = add nuw nsw i32 %82, 8
  %149 = add i32 %84, 8
  %150 = icmp eq i32 %149, %43
  br i1 %150, label %59, label %81, !llvm.loop !16

151:                                              ; preds = %53, %183
  %152 = phi i32 [ 0, %53 ], [ %185, %183 ]
  %153 = phi float [ 0.000000e+00, %53 ], [ %184, %183 ]
  br i1 %54, label %154, label %183

154:                                              ; preds = %151
  %155 = add nsw i32 %152, %35
  %156 = mul nsw i32 %155, %7
  %157 = add i32 %156, %38
  br i1 %56, label %168, label %187

158:                                              ; preds = %183, %51
  %159 = phi float [ 0.000000e+00, %51 ], [ %184, %183 ]
  %160 = fpext float %159 to double
  %161 = fmul contract double %160, 1.000000e+03
  %162 = fptosi double %161 to i32
  %163 = trunc i32 %162 to i16
  %164 = mul nsw i32 %13, %1
  %165 = add nsw i32 %164, %17
  %166 = sext i32 %165 to i64
  %167 = getelementptr inbounds i16, i16 addrspace(1)* %4, i64 %166
  store i16 %163, i16 addrspace(1)* %167, align 2, !tbaa !5
  call void @llvm.lifetime.end.p5i8(i64 676, i8 addrspace(5)* %32) #5
  br label %215

168:                                              ; preds = %187, %154
  %169 = phi float [ undef, %154 ], [ %211, %187 ]
  %170 = phi i32 [ 0, %154 ], [ %212, %187 ]
  %171 = phi float [ %153, %154 ], [ %211, %187 ]
  br i1 %58, label %183, label %172

172:                                              ; preds = %168
  %173 = getelementptr inbounds [13 x [13 x float]], [13 x [13 x float]] addrspace(5)* %9, i32 0, i32 %152, i32 %170
  %174 = load float, float addrspace(5)* %173, align 4, !tbaa !10
  %175 = fdiv contract float %174, %78
  %176 = add i32 %157, %170
  %177 = sext i32 %176 to i64
  %178 = getelementptr inbounds float, float addrspace(1)* %5, i64 %177
  %179 = load float, float addrspace(1)* %178, align 4, !tbaa !10, !amdgpu.noclobber !9
  %180 = fsub contract float %175, %179
  %181 = tail call float @llvm.fabs.f32(float %180)
  %182 = fadd contract float %171, %181
  br label %183

183:                                              ; preds = %172, %168, %151
  %184 = phi float [ %153, %151 ], [ %169, %168 ], [ %182, %172 ]
  %185 = add nuw nsw i32 %152, 1
  %186 = icmp slt i32 %185, %26
  br i1 %186, label %151, label %158, !llvm.loop !17

187:                                              ; preds = %154, %187
  %188 = phi i32 [ %212, %187 ], [ 0, %154 ]
  %189 = phi float [ %211, %187 ], [ %153, %154 ]
  %190 = phi i32 [ %213, %187 ], [ 0, %154 ]
  %191 = getelementptr inbounds [13 x [13 x float]], [13 x [13 x float]] addrspace(5)* %9, i32 0, i32 %152, i32 %188
  %192 = load float, float addrspace(5)* %191, align 4, !tbaa !10
  %193 = fdiv contract float %192, %78
  %194 = add i32 %157, %188
  %195 = sext i32 %194 to i64
  %196 = getelementptr inbounds float, float addrspace(1)* %5, i64 %195
  %197 = load float, float addrspace(1)* %196, align 4, !tbaa !10, !amdgpu.noclobber !9
  %198 = fsub contract float %193, %197
  %199 = tail call float @llvm.fabs.f32(float %198)
  %200 = fadd contract float %189, %199
  %201 = or i32 %188, 1
  %202 = getelementptr inbounds [13 x [13 x float]], [13 x [13 x float]] addrspace(5)* %9, i32 0, i32 %152, i32 %201
  %203 = load float, float addrspace(5)* %202, align 4, !tbaa !10
  %204 = fdiv contract float %203, %78
  %205 = add i32 %157, %201
  %206 = sext i32 %205 to i64
  %207 = getelementptr inbounds float, float addrspace(1)* %5, i64 %206
  %208 = load float, float addrspace(1)* %207, align 4, !tbaa !10, !amdgpu.noclobber !9
  %209 = fsub contract float %204, %208
  %210 = tail call float @llvm.fabs.f32(float %209)
  %211 = fadd contract float %200, %210
  %212 = add nuw nsw i32 %188, 2
  %213 = add i32 %190, 2
  %214 = icmp eq i32 %213, %57
  br i1 %214, label %168, label %187, !llvm.loop !18

215:                                              ; preds = %8, %158
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #3

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smax.i32(i32, i32) #4

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smin.i32(i32, i32) #4

attributes #0 = { argmemonly mustprogress nocallback nofree nosync nounwind willreturn }
attributes #1 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #2 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
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
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"short", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
!10 = !{!11, !11, i64 0}
!11 = !{!"float", !7, i64 0}
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.unroll.disable"}
!14 = distinct !{!14, !15}
!15 = !{!"llvm.loop.mustprogress"}
!16 = distinct !{!16, !15}
!17 = distinct !{!17, !15}
!18 = distinct !{!18, !15}
