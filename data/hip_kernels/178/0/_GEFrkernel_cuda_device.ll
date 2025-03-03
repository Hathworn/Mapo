; ModuleID = '../data/hip_kernels/178/0/main.cu'
source_filename = "../data/hip_kernels/178/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z16_GEFrkernel_cudaiiPfS_S_S_(i32 %0, i32 %1, float addrspace(1)* nocapture writeonly %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture readonly %4, float addrspace(1)* nocapture readonly %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !4, !invariant.load !5
  %12 = zext i16 %11 to i32
  %13 = mul i32 %7, %12
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %15 = add i32 %13, %14
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %17 = getelementptr i8, i8 addrspace(4)* %8, i64 6
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = load i16, i16 addrspace(4)* %18, align 2, !range !4, !invariant.load !5
  %20 = zext i16 %19 to i32
  %21 = mul i32 %16, %20
  %22 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %23 = add i32 %21, %22
  %24 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %25 = icmp ult i32 %15, %1
  %26 = icmp ult i32 %23, %1
  %27 = select i1 %25, i1 %26, i1 false
  %28 = icmp ult i32 %24, %0
  %29 = select i1 %27, i1 %28, i1 false
  br i1 %29, label %30, label %77

30:                                               ; preds = %6
  %31 = mul i32 %24, %1
  %32 = add i32 %23, %31
  %33 = mul i32 %32, %1
  %34 = add i32 %33, %15
  %35 = zext i32 %34 to i64
  %36 = getelementptr inbounds float, float addrspace(1)* %3, i64 %35
  %37 = load float, float addrspace(1)* %36, align 4, !tbaa !7, !amdgpu.noclobber !5
  %38 = fmul contract float %37, %37
  %39 = fpext float %38 to double
  %40 = getelementptr inbounds float, float addrspace(1)* %4, i64 %35
  %41 = load float, float addrspace(1)* %40, align 4, !tbaa !7, !amdgpu.noclobber !5
  %42 = fpext float %41 to double
  %43 = fmul contract double %42, 8.000000e+00
  %44 = getelementptr inbounds float, float addrspace(1)* %5, i64 %35
  %45 = load float, float addrspace(1)* %44, align 4, !tbaa !7, !amdgpu.noclobber !5
  %46 = fpext float %45 to double
  %47 = fmul contract double %43, %46
  %48 = fsub contract double %39, %47
  %49 = fptrunc double %48 to float
  %50 = fcmp olt float %49, 0x39F0000000000000
  %51 = select i1 %50, float 0x41F0000000000000, float 1.000000e+00
  %52 = fmul float %51, %49
  %53 = tail call float @llvm.sqrt.f32(float %52)
  %54 = bitcast float %53 to i32
  %55 = add nsw i32 %54, -1
  %56 = bitcast i32 %55 to float
  %57 = add nsw i32 %54, 1
  %58 = bitcast i32 %57 to float
  %59 = tail call i1 @llvm.amdgcn.class.f32(float %52, i32 608)
  %60 = select i1 %50, float 0x3EF0000000000000, float 1.000000e+00
  %61 = fneg float %58
  %62 = tail call float @llvm.fma.f32(float %61, float %53, float %52)
  %63 = fcmp ogt float %62, 0.000000e+00
  %64 = fneg float %56
  %65 = tail call float @llvm.fma.f32(float %64, float %53, float %52)
  %66 = fcmp ole float %65, 0.000000e+00
  %67 = select i1 %66, float %56, float %53
  %68 = select i1 %63, float %58, float %67
  %69 = fmul float %60, %68
  %70 = select i1 %59, float %52, float %69
  %71 = fsub contract float %70, %37
  %72 = fpext float %71 to double
  %73 = fmul contract double %46, 4.000000e+00
  %74 = fdiv contract double %72, %73
  %75 = fptrunc double %74 to float
  %76 = getelementptr inbounds float, float addrspace(1)* %2, i64 %35
  store float %75, float addrspace(1)* %76, align 4, !tbaa !7
  br label %77

77:                                               ; preds = %6, %30
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

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.z() #2

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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
