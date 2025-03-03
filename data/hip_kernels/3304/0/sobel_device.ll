; ModuleID = '../data/hip_kernels/3304/0/main.cu'
source_filename = "../data/hip_kernels/3304/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z5sobelPciS_(i8 addrspace(1)* nocapture writeonly %0, i32 %1, i8 addrspace(1)* nocapture readonly %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !5, !invariant.load !6
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = add i32 %11, %4
  %13 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %15 = getelementptr i8, i8 addrspace(4)* %6, i64 6
  %16 = bitcast i8 addrspace(4)* %15 to i16 addrspace(4)*
  %17 = load i16, i16 addrspace(4)* %16, align 2, !range !5, !invariant.load !6
  %18 = zext i16 %17 to i32
  %19 = mul i32 %14, %18
  %20 = add i32 %19, %13
  %21 = add nsw i32 %12, -1
  %22 = add nsw i32 %20, -1
  %23 = mul nsw i32 %22, %1
  %24 = add nsw i32 %23, %21
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %25
  %27 = load i8, i8 addrspace(1)* %26, align 1, !tbaa !7, !amdgpu.noclobber !6
  %28 = sext i8 %27 to i32
  %29 = mul nsw i32 %20, %1
  %30 = add nsw i32 %29, %21
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %31
  %33 = load i8, i8 addrspace(1)* %32, align 1, !tbaa !7, !amdgpu.noclobber !6
  %34 = sext i8 %33 to i32
  %35 = add nsw i32 %20, 1
  %36 = mul nsw i32 %35, %1
  %37 = add nsw i32 %36, %21
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %38
  %40 = load i8, i8 addrspace(1)* %39, align 1, !tbaa !7, !amdgpu.noclobber !6
  %41 = sext i8 %40 to i32
  %42 = add nsw i32 %12, 1
  %43 = add nsw i32 %23, %42
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %44
  %46 = load i8, i8 addrspace(1)* %45, align 1, !tbaa !7, !amdgpu.noclobber !6
  %47 = sext i8 %46 to i32
  %48 = add nsw i32 %29, %42
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %49
  %51 = load i8, i8 addrspace(1)* %50, align 1, !tbaa !7, !amdgpu.noclobber !6
  %52 = sext i8 %51 to i32
  %53 = add nsw i32 %36, %42
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %54
  %56 = load i8, i8 addrspace(1)* %55, align 1, !tbaa !7, !amdgpu.noclobber !6
  %57 = sext i8 %56 to i32
  %58 = add nsw i32 %23, %12
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %59
  %61 = load i8, i8 addrspace(1)* %60, align 1, !tbaa !7, !amdgpu.noclobber !6
  %62 = sext i8 %61 to i32
  %63 = add nsw i32 %36, %12
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %64
  %66 = load i8, i8 addrspace(1)* %65, align 1, !tbaa !7, !amdgpu.noclobber !6
  %67 = sext i8 %66 to i32
  %68 = sub nsw i32 %52, %34
  %69 = shl nsw i32 %68, 1
  %70 = add nsw i32 %41, %28
  %71 = sub nsw i32 %47, %70
  %72 = add nsw i32 %71, %57
  %73 = add nsw i32 %72, %69
  %74 = sub nsw i32 %67, %62
  %75 = shl nsw i32 %74, 1
  %76 = add nsw i32 %28, %47
  %77 = sub nsw i32 %41, %76
  %78 = add nsw i32 %77, %57
  %79 = add nsw i32 %78, %75
  %80 = mul nsw i32 %73, %73
  %81 = mul nsw i32 %79, %79
  %82 = add nuw nsw i32 %81, %80
  %83 = sitofp i32 %82 to float
  %84 = icmp eq i32 %82, 0
  %85 = select i1 %84, float 0x41F0000000000000, float 1.000000e+00
  %86 = fmul float %85, %83
  %87 = tail call float @llvm.sqrt.f32(float %86)
  %88 = bitcast float %87 to i32
  %89 = add nsw i32 %88, -1
  %90 = bitcast i32 %89 to float
  %91 = add nsw i32 %88, 1
  %92 = bitcast i32 %91 to float
  %93 = tail call i1 @llvm.amdgcn.class.f32(float %86, i32 608)
  %94 = select i1 %84, float 0x3EF0000000000000, float 1.000000e+00
  %95 = fneg float %92
  %96 = tail call float @llvm.fma.f32(float %95, float %87, float %86)
  %97 = fcmp ogt float %96, 0.000000e+00
  %98 = fneg float %90
  %99 = tail call float @llvm.fma.f32(float %98, float %87, float %86)
  %100 = fcmp ole float %99, 0.000000e+00
  %101 = select i1 %100, float %90, float %87
  %102 = select i1 %97, float %92, float %101
  %103 = fmul float %94, %102
  %104 = select i1 %93, float %86, float %103
  %105 = fptosi float %104 to i8
  %106 = add nsw i32 %29, %12
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %107
  store i8 %105, i8 addrspace(1)* %108, align 1, !tbaa !7
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.sqrt.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
