; ModuleID = '../data/hip_kernels/4307/66/main.cu'
source_filename = "../data/hip_kernels/4307/66/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z36xMinDeltaIntegralReplicateFracKernelPKfPfiiiS0_S0_S0_S0_iii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture %1, i32 %2, i32 %3, i32 %4, float addrspace(1)* nocapture readonly %5, float addrspace(1)* nocapture readonly %6, float addrspace(1)* nocapture readonly %7, float addrspace(1)* nocapture readonly %8, i32 %9, i32 %10, i32 %11) local_unnamed_addr #0 {
  %13 = add nsw i32 %3, -1
  %14 = add i32 %13, %10
  %15 = sdiv i32 %14, %10
  %16 = add nsw i32 %4, -1
  %17 = add i32 %16, %11
  %18 = sdiv i32 %17, %11
  %19 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %20 = shl i32 %19, 4
  %21 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %22 = add i32 %20, %21
  %23 = freeze i32 %22
  %24 = freeze i32 %18
  %25 = sdiv i32 %23, %24
  %26 = mul i32 %25, %24
  %27 = sub i32 %23, %26
  %28 = freeze i32 %15
  %29 = sdiv i32 %25, %28
  %30 = mul i32 %29, %28
  %31 = sub i32 %25, %30
  %32 = icmp slt i32 %29, %2
  %33 = icmp sgt i32 %15, -1
  %34 = and i1 %33, %32
  %35 = icmp sgt i32 %18, -1
  %36 = select i1 %34, i1 %35, i1 false
  br i1 %36, label %37, label %150

37:                                               ; preds = %12
  %38 = mul nsw i32 %31, %10
  %39 = mul nsw i32 %27, %11
  %40 = add nsw i32 %39, 1
  %41 = mul i32 %18, %15
  %42 = mul i32 %41, %29
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds float, float addrspace(1)* %1, i64 %43
  %45 = sext i32 %29 to i64
  %46 = getelementptr inbounds float, float addrspace(1)* %5, i64 %45
  %47 = load float, float addrspace(1)* %46, align 4, !tbaa !5, !amdgpu.noclobber !9
  %48 = fadd contract float %47, -1.000000e+00
  %49 = tail call float @llvm.ceil.f32(float %48)
  %50 = fptosi float %49 to i32
  %51 = getelementptr inbounds float, float addrspace(1)* %6, i64 %45
  %52 = load float, float addrspace(1)* %51, align 4, !tbaa !5, !amdgpu.noclobber !9
  %53 = fadd contract float %52, -1.000000e+00
  %54 = tail call float @llvm.ceil.f32(float %53)
  %55 = fptosi float %54 to i32
  %56 = sitofp i32 %55 to float
  %57 = fsub contract float %56, %52
  %58 = fadd contract float %57, 1.000000e+00
  %59 = getelementptr inbounds float, float addrspace(1)* %7, i64 %45
  %60 = load float, float addrspace(1)* %59, align 4, !tbaa !5, !amdgpu.noclobber !9
  %61 = tail call float @llvm.floor.f32(float %60)
  %62 = fptosi float %61 to i32
  %63 = sitofp i32 %62 to float
  %64 = fsub contract float %60, %63
  %65 = add nsw i32 %40, %55
  %66 = icmp slt i32 %65, 1
  %67 = add i32 %38, %50
  %68 = add i32 %67, 1
  %69 = icmp ugt i32 %67, 2147483646
  %70 = select i1 %66, i1 true, i1 %69
  br i1 %70, label %82, label %71

71:                                               ; preds = %37
  %72 = tail call i32 @llvm.smin.i32(i32 %13, i32 %67)
  %73 = tail call i32 @llvm.smax.i32(i32 %72, i32 0)
  %74 = mul nsw i32 %73, %9
  %75 = add i32 %39, %55
  %76 = tail call i32 @llvm.smin.i32(i32 %16, i32 %75)
  %77 = tail call i32 @llvm.smax.i32(i32 %76, i32 0)
  %78 = add nsw i32 %74, %77
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds float, float addrspace(1)* %8, i64 %79
  %81 = load float, float addrspace(1)* %80, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %82

82:                                               ; preds = %37, %71
  %83 = phi contract float [ %81, %71 ], [ 0.000000e+00, %37 ]
  %84 = add nsw i32 %40, %62
  %85 = icmp sge i32 %84, %4
  %86 = select i1 %85, i1 true, i1 %69
  br i1 %86, label %97, label %87

87:                                               ; preds = %82
  %88 = tail call i32 @llvm.smin.i32(i32 %13, i32 %67)
  %89 = tail call i32 @llvm.smax.i32(i32 %88, i32 0)
  %90 = mul nsw i32 %89, %9
  %91 = tail call i32 @llvm.smin.i32(i32 %16, i32 %84)
  %92 = tail call i32 @llvm.smax.i32(i32 %91, i32 0)
  %93 = add nsw i32 %90, %92
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds float, float addrspace(1)* %8, i64 %94
  %96 = load float, float addrspace(1)* %95, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %97

97:                                               ; preds = %82, %87
  %98 = phi contract float [ %96, %87 ], [ 0.000000e+00, %82 ]
  %99 = icmp slt i32 %84, 1
  %100 = select contract i1 %99, float 1.000000e+00, float %64
  %101 = fmul contract float %100, %98
  %102 = fadd contract float %101, 0.000000e+00
  %103 = icmp slt i32 %65, %4
  %104 = select contract i1 %103, float %58, float 1.000000e+00
  %105 = fmul contract float %104, %83
  %106 = fadd contract float %105, %102
  %107 = tail call i32 @llvm.smin.i32(i32 %68, i32 %3)
  %108 = tail call i32 @llvm.smax.i32(i32 %107, i32 0)
  %109 = add nsw i32 %4, 1
  %110 = mul nsw i32 %108, %109
  %111 = tail call i32 @llvm.smin.i32(i32 %84, i32 %4)
  %112 = tail call i32 @llvm.smax.i32(i32 %111, i32 0)
  %113 = add nsw i32 %112, %110
  %114 = sext i32 %113 to i64
  %115 = getelementptr inbounds float, float addrspace(1)* %0, i64 %114
  %116 = load float, float addrspace(1)* %115, align 4, !tbaa !5, !amdgpu.noclobber !9
  %117 = fadd contract float %116, %106
  %118 = tail call i32 @llvm.smin.i32(i32 %67, i32 %3)
  %119 = tail call i32 @llvm.smax.i32(i32 %118, i32 0)
  %120 = mul nsw i32 %119, %109
  %121 = add nsw i32 %120, %112
  %122 = sext i32 %121 to i64
  %123 = getelementptr inbounds float, float addrspace(1)* %0, i64 %122
  %124 = load float, float addrspace(1)* %123, align 4, !tbaa !5, !amdgpu.noclobber !9
  %125 = fsub contract float %117, %124
  %126 = tail call i32 @llvm.smin.i32(i32 %65, i32 %4)
  %127 = tail call i32 @llvm.smax.i32(i32 %126, i32 0)
  %128 = add nsw i32 %127, %110
  %129 = sext i32 %128 to i64
  %130 = getelementptr inbounds float, float addrspace(1)* %0, i64 %129
  %131 = load float, float addrspace(1)* %130, align 4, !tbaa !5, !amdgpu.noclobber !9
  %132 = fsub contract float %125, %131
  %133 = add nsw i32 %120, %127
  %134 = sext i32 %133 to i64
  %135 = getelementptr inbounds float, float addrspace(1)* %0, i64 %134
  %136 = load float, float addrspace(1)* %135, align 4, !tbaa !5, !amdgpu.noclobber !9
  %137 = fadd contract float %136, %132
  %138 = icmp ult i32 %67, 2147483647
  %139 = icmp slt i32 %68, %3
  %140 = uitofp i1 %139 to float
  %141 = select i1 %138, float %140, float 0.000000e+00
  %142 = fneg contract float %137
  %143 = fmul contract float %141, %142
  %144 = mul nsw i32 %31, %18
  %145 = add nsw i32 %144, %27
  %146 = sext i32 %145 to i64
  %147 = getelementptr inbounds float, float addrspace(1)* %44, i64 %146
  %148 = load float, float addrspace(1)* %147, align 4, !tbaa !5, !amdgpu.noclobber !9
  %149 = fmul contract float %148, %143
  store float %149, float addrspace(1)* %147, align 4, !tbaa !5
  br label %150

150:                                              ; preds = %97, %12
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.ceil.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.floor.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smax.i32(i32, i32) #3

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smin.i32(i32, i32) #3

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

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
