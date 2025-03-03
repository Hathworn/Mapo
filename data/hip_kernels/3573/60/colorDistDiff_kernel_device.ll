; ModuleID = '../data/hip_kernels/3573/60/main.cu'
source_filename = "../data/hip_kernels/3573/60/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <4 x i8> }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z20colorDistDiff_kernelP15HIP_vector_typeIhLj4EEPKfiS3_iifffff(%struct.HIP_vector_type addrspace(1)* nocapture %0, float addrspace(1)* nocapture readonly %1, i32 %2, float addrspace(1)* nocapture readonly %3, i32 %4, i32 %5, float %6, float %7, float %8, float %9, float %10) local_unnamed_addr #0 {
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %14 = getelementptr i8, i8 addrspace(4)* %13, i64 4
  %15 = bitcast i8 addrspace(4)* %14 to i16 addrspace(4)*
  %16 = load i16, i16 addrspace(4)* %15, align 4, !range !4, !invariant.load !5
  %17 = zext i16 %16 to i32
  %18 = mul i32 %12, %17
  %19 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %20 = add i32 %18, %19
  %21 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %22 = getelementptr i8, i8 addrspace(4)* %13, i64 6
  %23 = bitcast i8 addrspace(4)* %22 to i16 addrspace(4)*
  %24 = load i16, i16 addrspace(4)* %23, align 2, !range !4, !invariant.load !5
  %25 = zext i16 %24 to i32
  %26 = mul i32 %21, %25
  %27 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %28 = add i32 %26, %27
  %29 = icmp slt i32 %20, %4
  %30 = icmp slt i32 %28, %5
  %31 = select i1 %29, i1 %30, i1 false
  br i1 %31, label %32, label %111

32:                                               ; preds = %11
  %33 = mul nsw i32 %28, %4
  %34 = add nsw i32 %33, %20
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %35, i32 0, i32 0, i32 0, i64 0
  %37 = load i8, i8 addrspace(1)* %36, align 4, !amdgpu.noclobber !5
  %38 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %35, i32 0, i32 0, i32 0, i64 1
  %39 = load i8, i8 addrspace(1)* %38, align 1, !amdgpu.noclobber !5
  %40 = bitcast float addrspace(1)* %1 to i8 addrspace(1)*
  %41 = mul nsw i32 %28, %2
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds i8, i8 addrspace(1)* %40, i64 %42
  %44 = bitcast i8 addrspace(1)* %43 to float addrspace(1)*
  %45 = sext i32 %20 to i64
  %46 = getelementptr inbounds float, float addrspace(1)* %44, i64 %45
  %47 = load float, float addrspace(1)* %46, align 4, !tbaa !7, !amdgpu.noclobber !5
  %48 = getelementptr inbounds float, float addrspace(1)* %3, i64 %35
  %49 = load float, float addrspace(1)* %48, align 4, !tbaa !7, !amdgpu.noclobber !5
  %50 = sitofp i32 %20 to float
  %51 = fsub contract float %50, %8
  %52 = fdiv contract float %51, %6
  %53 = sitofp i32 %28 to float
  %54 = fsub contract float %53, %9
  %55 = fdiv contract float %54, %6
  %56 = fneg contract float %6
  %57 = fmul contract float %56, %7
  %58 = fdiv contract float %57, %49
  %59 = fmul contract float %52, %58
  %60 = fdiv contract float %57, %47
  %61 = fmul contract float %52, %60
  %62 = fsub contract float %59, %61
  %63 = fmul contract float %62, %62
  %64 = fmul contract float %55, %60
  %65 = fmul contract float %55, %58
  %66 = fsub contract float %64, %65
  %67 = fmul contract float %66, %66
  %68 = fadd contract float %63, %67
  %69 = fsub contract float %58, %60
  %70 = fmul contract float %69, %69
  %71 = fadd contract float %70, %68
  %72 = fcmp olt float %71, 0x39F0000000000000
  %73 = select i1 %72, float 0x41F0000000000000, float 1.000000e+00
  %74 = fmul float %71, %73
  %75 = tail call float @llvm.sqrt.f32(float %74)
  %76 = bitcast float %75 to i32
  %77 = add nsw i32 %76, -1
  %78 = bitcast i32 %77 to float
  %79 = add nsw i32 %76, 1
  %80 = bitcast i32 %79 to float
  %81 = tail call i1 @llvm.amdgcn.class.f32(float %74, i32 608)
  %82 = select i1 %72, float 0x3EF0000000000000, float 1.000000e+00
  %83 = fneg float %80
  %84 = tail call float @llvm.fma.f32(float %83, float %75, float %74)
  %85 = fcmp ogt float %84, 0.000000e+00
  %86 = fneg float %78
  %87 = tail call float @llvm.fma.f32(float %86, float %75, float %74)
  %88 = fcmp ole float %87, 0.000000e+00
  %89 = select i1 %88, float %78, float %75
  %90 = select i1 %85, float %80, float %89
  %91 = fmul float %82, %90
  %92 = select i1 %81, float %74, float %91
  %93 = fcmp contract ogt float %92, %10
  %94 = zext i1 %93 to i32
  %95 = tail call i1 @llvm.amdgcn.class.f32(float %47, i32 504)
  %96 = zext i1 %95 to i32
  %97 = tail call i1 @llvm.amdgcn.class.f32(float %49, i32 504)
  %98 = zext i1 %97 to i32
  %99 = xor i32 %98, -1
  %100 = and i32 %99, %96
  %101 = or i32 %100, %94
  %102 = icmp eq i32 %101, 0
  %103 = uitofp i8 %37 to float
  %104 = fmul contract float %103, 5.000000e-01
  %105 = fptoui float %104 to i8
  %106 = uitofp i8 %39 to float
  %107 = fmul contract float %106, 5.000000e-01
  %108 = fptoui float %107 to i8
  %109 = select i1 %102, i8 %37, i8 %105
  %110 = select i1 %102, i8 %39, i8 %108
  store i8 %109, i8 addrspace(1)* %36, align 4
  store i8 %110, i8 addrspace(1)* %38, align 1
  br label %111

111:                                              ; preds = %32, %11
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.sqrt.f32(float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
