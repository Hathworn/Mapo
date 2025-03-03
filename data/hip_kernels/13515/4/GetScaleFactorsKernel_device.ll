; ModuleID = '../data/hip_kernels/13515/4/main.cu'
source_filename = "../data/hip_kernels/13515/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z21GetScaleFactorsKernelPfS_S_S_ii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture %1, float addrspace(1)* nocapture %2, float addrspace(1)* nocapture readonly %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = zext i32 %7 to i64
  %9 = getelementptr inbounds float, float addrspace(1)* %2, i64 %8
  %10 = load float, float addrspace(1)* %9, align 4, !tbaa !5, !amdgpu.noclobber !9
  %11 = fmul contract float %10, %10
  %12 = sitofp i32 %5 to float
  %13 = fadd contract float %12, -1.000000e+00
  %14 = fmul contract float %13, %11
  %15 = getelementptr inbounds float, float addrspace(1)* %1, i64 %8
  %16 = load float, float addrspace(1)* %15, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %43

17:                                               ; preds = %43
  store float %171, float addrspace(1)* %15, align 4, !tbaa !5
  %18 = add nsw i32 %5, 512
  %19 = sitofp i32 %18 to float
  %20 = fadd contract float %19, -1.000000e+00
  %21 = fdiv contract float %174, %20
  %22 = fcmp olt float %21, 0x39F0000000000000
  %23 = select i1 %22, float 0x41F0000000000000, float 1.000000e+00
  %24 = fmul float %21, %23
  %25 = tail call float @llvm.sqrt.f32(float %24)
  %26 = bitcast float %25 to i32
  %27 = add nsw i32 %26, -1
  %28 = bitcast i32 %27 to float
  %29 = add nsw i32 %26, 1
  %30 = bitcast i32 %29 to float
  %31 = tail call i1 @llvm.amdgcn.class.f32(float %24, i32 608)
  %32 = select i1 %22, float 0x3EF0000000000000, float 1.000000e+00
  %33 = fneg float %30
  %34 = tail call float @llvm.fma.f32(float %33, float %25, float %24)
  %35 = fcmp ogt float %34, 0.000000e+00
  %36 = fneg float %28
  %37 = tail call float @llvm.fma.f32(float %36, float %25, float %24)
  %38 = fcmp ole float %37, 0.000000e+00
  %39 = select i1 %38, float %28, float %25
  %40 = select i1 %35, float %30, float %39
  %41 = fmul float %32, %40
  %42 = select i1 %31, float %24, float %41
  store float %42, float addrspace(1)* %9, align 4, !tbaa !5
  ret void

43:                                               ; preds = %43, %6
  %44 = phi i32 [ 0, %6 ], [ %165, %43 ]
  %45 = phi float [ %16, %6 ], [ %171, %43 ]
  %46 = phi float [ %14, %6 ], [ %174, %43 ]
  %47 = mul nsw i32 %44, %4
  %48 = add i32 %47, %7
  %49 = zext i32 %48 to i64
  %50 = getelementptr inbounds float, float addrspace(1)* %0, i64 %49
  %51 = load float, float addrspace(1)* %50, align 4, !tbaa !5, !amdgpu.noclobber !9
  %52 = fsub contract float %51, %45
  %53 = or i32 %44, 1
  %54 = add i32 %53, %5
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds float, float addrspace(1)* %3, i64 %55
  %57 = load float, float addrspace(1)* %56, align 4, !tbaa !5, !amdgpu.noclobber !9
  %58 = fmul contract float %52, %57
  %59 = fadd contract float %45, %58
  %60 = fsub contract float %51, %59
  %61 = fmul contract float %52, %60
  %62 = fadd contract float %46, %61
  %63 = mul nsw i32 %53, %4
  %64 = add i32 %63, %7
  %65 = zext i32 %64 to i64
  %66 = getelementptr inbounds float, float addrspace(1)* %0, i64 %65
  %67 = load float, float addrspace(1)* %66, align 4, !tbaa !5, !amdgpu.noclobber !9
  %68 = fsub contract float %67, %59
  %69 = or i32 %44, 2
  %70 = add i32 %69, %5
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds float, float addrspace(1)* %3, i64 %71
  %73 = load float, float addrspace(1)* %72, align 4, !tbaa !5, !amdgpu.noclobber !9
  %74 = fmul contract float %68, %73
  %75 = fadd contract float %59, %74
  %76 = fsub contract float %67, %75
  %77 = fmul contract float %68, %76
  %78 = fadd contract float %62, %77
  %79 = mul nsw i32 %69, %4
  %80 = add i32 %79, %7
  %81 = zext i32 %80 to i64
  %82 = getelementptr inbounds float, float addrspace(1)* %0, i64 %81
  %83 = load float, float addrspace(1)* %82, align 4, !tbaa !5, !amdgpu.noclobber !9
  %84 = fsub contract float %83, %75
  %85 = or i32 %44, 3
  %86 = add i32 %85, %5
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds float, float addrspace(1)* %3, i64 %87
  %89 = load float, float addrspace(1)* %88, align 4, !tbaa !5, !amdgpu.noclobber !9
  %90 = fmul contract float %84, %89
  %91 = fadd contract float %75, %90
  %92 = fsub contract float %83, %91
  %93 = fmul contract float %84, %92
  %94 = fadd contract float %78, %93
  %95 = mul nsw i32 %85, %4
  %96 = add i32 %95, %7
  %97 = zext i32 %96 to i64
  %98 = getelementptr inbounds float, float addrspace(1)* %0, i64 %97
  %99 = load float, float addrspace(1)* %98, align 4, !tbaa !5, !amdgpu.noclobber !9
  %100 = fsub contract float %99, %91
  %101 = or i32 %44, 4
  %102 = add i32 %101, %5
  %103 = sext i32 %102 to i64
  %104 = getelementptr inbounds float, float addrspace(1)* %3, i64 %103
  %105 = load float, float addrspace(1)* %104, align 4, !tbaa !5, !amdgpu.noclobber !9
  %106 = fmul contract float %100, %105
  %107 = fadd contract float %91, %106
  %108 = fsub contract float %99, %107
  %109 = fmul contract float %100, %108
  %110 = fadd contract float %94, %109
  %111 = mul nsw i32 %101, %4
  %112 = add i32 %111, %7
  %113 = zext i32 %112 to i64
  %114 = getelementptr inbounds float, float addrspace(1)* %0, i64 %113
  %115 = load float, float addrspace(1)* %114, align 4, !tbaa !5, !amdgpu.noclobber !9
  %116 = fsub contract float %115, %107
  %117 = or i32 %44, 5
  %118 = add i32 %117, %5
  %119 = sext i32 %118 to i64
  %120 = getelementptr inbounds float, float addrspace(1)* %3, i64 %119
  %121 = load float, float addrspace(1)* %120, align 4, !tbaa !5, !amdgpu.noclobber !9
  %122 = fmul contract float %116, %121
  %123 = fadd contract float %107, %122
  %124 = fsub contract float %115, %123
  %125 = fmul contract float %116, %124
  %126 = fadd contract float %110, %125
  %127 = mul nsw i32 %117, %4
  %128 = add i32 %127, %7
  %129 = zext i32 %128 to i64
  %130 = getelementptr inbounds float, float addrspace(1)* %0, i64 %129
  %131 = load float, float addrspace(1)* %130, align 4, !tbaa !5, !amdgpu.noclobber !9
  %132 = fsub contract float %131, %123
  %133 = or i32 %44, 6
  %134 = add i32 %133, %5
  %135 = sext i32 %134 to i64
  %136 = getelementptr inbounds float, float addrspace(1)* %3, i64 %135
  %137 = load float, float addrspace(1)* %136, align 4, !tbaa !5, !amdgpu.noclobber !9
  %138 = fmul contract float %132, %137
  %139 = fadd contract float %123, %138
  %140 = fsub contract float %131, %139
  %141 = fmul contract float %132, %140
  %142 = fadd contract float %126, %141
  %143 = mul nsw i32 %133, %4
  %144 = add i32 %143, %7
  %145 = zext i32 %144 to i64
  %146 = getelementptr inbounds float, float addrspace(1)* %0, i64 %145
  %147 = load float, float addrspace(1)* %146, align 4, !tbaa !5, !amdgpu.noclobber !9
  %148 = fsub contract float %147, %139
  %149 = or i32 %44, 7
  %150 = add i32 %149, %5
  %151 = sext i32 %150 to i64
  %152 = getelementptr inbounds float, float addrspace(1)* %3, i64 %151
  %153 = load float, float addrspace(1)* %152, align 4, !tbaa !5, !amdgpu.noclobber !9
  %154 = fmul contract float %148, %153
  %155 = fadd contract float %139, %154
  %156 = fsub contract float %147, %155
  %157 = fmul contract float %148, %156
  %158 = fadd contract float %142, %157
  %159 = mul nsw i32 %149, %4
  %160 = add i32 %159, %7
  %161 = zext i32 %160 to i64
  %162 = getelementptr inbounds float, float addrspace(1)* %0, i64 %161
  %163 = load float, float addrspace(1)* %162, align 4, !tbaa !5, !amdgpu.noclobber !9
  %164 = fsub contract float %163, %155
  %165 = add nuw nsw i32 %44, 8
  %166 = add i32 %165, %5
  %167 = sext i32 %166 to i64
  %168 = getelementptr inbounds float, float addrspace(1)* %3, i64 %167
  %169 = load float, float addrspace(1)* %168, align 4, !tbaa !5, !amdgpu.noclobber !9
  %170 = fmul contract float %164, %169
  %171 = fadd contract float %155, %170
  %172 = fsub contract float %163, %171
  %173 = fmul contract float %164, %172
  %174 = fadd contract float %158, %173
  %175 = icmp eq i32 %165, 512
  br i1 %175, label %17, label %43, !llvm.loop !10
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.sqrt.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
