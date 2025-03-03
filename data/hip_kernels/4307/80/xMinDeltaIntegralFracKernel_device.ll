; ModuleID = '../data/hip_kernels/4307/80/main.cu'
source_filename = "../data/hip_kernels/4307/80/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z27xMinDeltaIntegralFracKernelPKfiPfiiiiiS0_S0_S0_S0_ii(float addrspace(1)* nocapture readonly %0, i32 %1, float addrspace(1)* nocapture writeonly %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, float addrspace(1)* nocapture readonly %8, float addrspace(1)* nocapture readonly %9, float addrspace(1)* nocapture readonly %10, float addrspace(1)* nocapture readonly %11, i32 %12, i32 %13) local_unnamed_addr #0 {
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %16 = shl i32 %15, 8
  %17 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %18 = add i32 %16, %17
  %19 = freeze i32 %18
  %20 = freeze i32 %7
  %21 = sdiv i32 %19, %20
  %22 = mul i32 %21, %20
  %23 = sub i32 %19, %22
  %24 = add nsw i32 %23, 1
  %25 = freeze i32 %6
  %26 = sdiv i32 %21, %25
  %27 = freeze i32 %26
  %28 = freeze i32 %5
  %29 = sdiv i32 %27, %28
  %30 = mul nsw i32 %29, %1
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds float, float addrspace(1)* %0, i64 %31
  %33 = mul nsw i32 %29, %13
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds float, float addrspace(1)* %11, i64 %34
  %36 = freeze i32 %29
  %37 = freeze i32 %4
  %38 = sdiv i32 %36, %37
  %39 = icmp slt i32 %38, %3
  br i1 %39, label %40, label %146

40:                                               ; preds = %14
  %41 = mul i32 %38, %37
  %42 = sub i32 %36, %41
  %43 = mul nsw i32 %42, %5
  %44 = mul i32 %29, %28
  %45 = sub i32 %27, %44
  %46 = add nsw i32 %43, %45
  %47 = mul i32 %26, %25
  %48 = sub i32 %21, %47
  %49 = sext i32 %18 to i64
  %50 = getelementptr inbounds float, float addrspace(1)* %2, i64 %49
  %51 = sext i32 %46 to i64
  %52 = getelementptr inbounds float, float addrspace(1)* %8, i64 %51
  %53 = load float, float addrspace(1)* %52, align 4, !tbaa !5, !amdgpu.noclobber !9
  %54 = fadd contract float %53, -1.000000e+00
  %55 = tail call float @llvm.ceil.f32(float %54)
  %56 = fptosi float %55 to i32
  %57 = getelementptr inbounds float, float addrspace(1)* %9, i64 %51
  %58 = load float, float addrspace(1)* %57, align 4, !tbaa !5, !amdgpu.noclobber !9
  %59 = fadd contract float %58, -1.000000e+00
  %60 = tail call float @llvm.ceil.f32(float %59)
  %61 = fptosi float %60 to i32
  %62 = sitofp i32 %61 to float
  %63 = fsub contract float %62, %58
  %64 = fadd contract float %63, 1.000000e+00
  %65 = getelementptr inbounds float, float addrspace(1)* %10, i64 %51
  %66 = load float, float addrspace(1)* %65, align 4, !tbaa !5, !amdgpu.noclobber !9
  %67 = tail call float @llvm.floor.f32(float %66)
  %68 = fptosi float %67 to i32
  %69 = sitofp i32 %68 to float
  %70 = fsub contract float %66, %69
  %71 = add nsw i32 %24, %61
  %72 = icmp sgt i32 %71, 0
  %73 = icmp sle i32 %71, %7
  %74 = and i1 %72, %73
  %75 = add i32 %48, %56
  %76 = add i32 %75, 1
  %77 = icmp ult i32 %75, 2147483647
  %78 = and i1 %77, %74
  %79 = uitofp i1 %78 to float
  %80 = add nsw i32 %6, -1
  %81 = tail call i32 @llvm.smin.i32(i32 %80, i32 %75)
  %82 = tail call i32 @llvm.smax.i32(i32 %81, i32 0)
  %83 = mul nsw i32 %82, %12
  %84 = add nsw i32 %7, -1
  %85 = add i32 %23, %61
  %86 = tail call i32 @llvm.smin.i32(i32 %84, i32 %85)
  %87 = tail call i32 @llvm.smax.i32(i32 %86, i32 0)
  %88 = add nsw i32 %83, %87
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds float, float addrspace(1)* %35, i64 %89
  %91 = load float, float addrspace(1)* %90, align 4, !tbaa !5, !amdgpu.noclobber !9
  %92 = fmul contract float %91, %79
  %93 = add nsw i32 %24, %68
  %94 = icmp sgt i32 %93, -1
  %95 = icmp slt i32 %93, %7
  %96 = and i1 %94, %95
  %97 = and i1 %77, %96
  %98 = uitofp i1 %97 to float
  %99 = tail call i32 @llvm.smin.i32(i32 %84, i32 %93)
  %100 = tail call i32 @llvm.smax.i32(i32 %99, i32 0)
  %101 = add nsw i32 %83, %100
  %102 = sext i32 %101 to i64
  %103 = getelementptr inbounds float, float addrspace(1)* %35, i64 %102
  %104 = load float, float addrspace(1)* %103, align 4, !tbaa !5, !amdgpu.noclobber !9
  %105 = fmul contract float %104, %98
  %106 = fmul contract float %70, %105
  %107 = fadd contract float %106, 0.000000e+00
  %108 = fmul contract float %64, %92
  %109 = fadd contract float %108, %107
  %110 = tail call i32 @llvm.smin.i32(i32 %76, i32 %6)
  %111 = tail call i32 @llvm.smax.i32(i32 %110, i32 0)
  %112 = add nsw i32 %7, 1
  %113 = mul nsw i32 %111, %112
  %114 = tail call i32 @llvm.smin.i32(i32 %93, i32 %7)
  %115 = tail call i32 @llvm.smax.i32(i32 %114, i32 0)
  %116 = add nsw i32 %115, %113
  %117 = sext i32 %116 to i64
  %118 = getelementptr inbounds float, float addrspace(1)* %32, i64 %117
  %119 = load float, float addrspace(1)* %118, align 4, !tbaa !5, !amdgpu.noclobber !9
  %120 = fadd contract float %119, %109
  %121 = tail call i32 @llvm.smin.i32(i32 %75, i32 %6)
  %122 = tail call i32 @llvm.smax.i32(i32 %121, i32 0)
  %123 = mul nsw i32 %122, %112
  %124 = add nsw i32 %123, %115
  %125 = sext i32 %124 to i64
  %126 = getelementptr inbounds float, float addrspace(1)* %32, i64 %125
  %127 = load float, float addrspace(1)* %126, align 4, !tbaa !5, !amdgpu.noclobber !9
  %128 = fsub contract float %120, %127
  %129 = tail call i32 @llvm.smin.i32(i32 %71, i32 %7)
  %130 = tail call i32 @llvm.smax.i32(i32 %129, i32 0)
  %131 = add nsw i32 %130, %113
  %132 = sext i32 %131 to i64
  %133 = getelementptr inbounds float, float addrspace(1)* %32, i64 %132
  %134 = load float, float addrspace(1)* %133, align 4, !tbaa !5, !amdgpu.noclobber !9
  %135 = fsub contract float %128, %134
  %136 = add nsw i32 %123, %130
  %137 = sext i32 %136 to i64
  %138 = getelementptr inbounds float, float addrspace(1)* %32, i64 %137
  %139 = load float, float addrspace(1)* %138, align 4, !tbaa !5, !amdgpu.noclobber !9
  %140 = fadd contract float %139, %135
  %141 = icmp sle i32 %76, %6
  %142 = and i1 %77, %141
  %143 = uitofp i1 %142 to float
  %144 = fneg contract float %140
  %145 = fmul contract float %143, %144
  store float %145, float addrspace(1)* %50, align 4, !tbaa !5
  br label %146

146:                                              ; preds = %40, %14
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
