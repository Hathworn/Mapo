; ModuleID = '../data/hip_kernels/11105/13/main.cu'
source_filename = "../data/hip_kernels/11105/13/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z18log_tonemap_kernelPfS_iiiffS_(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, i32 %4, float %5, float %6, float addrspace(1)* nocapture readonly %7) local_unnamed_addr #0 {
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %11 = getelementptr i8, i8 addrspace(4)* %9, i64 6
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 2, !range !4, !invariant.load !5
  %14 = zext i16 %13 to i32
  %15 = mul i32 %10, %14
  %16 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %17 = add i32 %15, %16
  %18 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %19 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %20 = bitcast i8 addrspace(4)* %19 to i16 addrspace(4)*
  %21 = load i16, i16 addrspace(4)* %20, align 4, !range !4, !invariant.load !5
  %22 = zext i16 %21 to i32
  %23 = mul i32 %18, %22
  %24 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %25 = add i32 %23, %24
  %26 = icmp slt i32 %17, %3
  %27 = icmp slt i32 %25, %2
  %28 = select i1 %26, i1 %27, i1 false
  br i1 %28, label %29, label %92

29:                                               ; preds = %8
  %30 = mul nsw i32 %17, %2
  %31 = add nsw i32 %30, %25
  %32 = mul nsw i32 %31, 3
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds float, float addrspace(1)* %0, i64 %33
  %35 = load float, float addrspace(1)* %34, align 4, !tbaa !7, !amdgpu.noclobber !5
  %36 = add nsw i32 %32, 1
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds float, float addrspace(1)* %0, i64 %37
  %39 = load float, float addrspace(1)* %38, align 4, !tbaa !7, !amdgpu.noclobber !5
  %40 = add nsw i32 %32, 2
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds float, float addrspace(1)* %0, i64 %41
  %43 = load float, float addrspace(1)* %42, align 4, !tbaa !7, !amdgpu.noclobber !5
  %44 = fpext float %35 to double
  %45 = fmul contract double %44, 7.220000e-02
  %46 = fpext float %39 to double
  %47 = fmul contract double %46, 7.152000e-01
  %48 = fadd contract double %45, %47
  %49 = fpext float %43 to double
  %50 = fmul contract double %49, 2.126000e-01
  %51 = fadd contract double %48, %50
  %52 = fptrunc double %51 to float
  %53 = load float, float addrspace(1)* %7, align 4, !tbaa !7, !amdgpu.noclobber !5
  %54 = fmul contract float %52, %6
  %55 = fadd contract float %54, 1.000000e+00
  %56 = tail call i1 @llvm.amdgcn.class.f32(float %55, i32 144)
  %57 = select i1 %56, float 0x41F0000000000000, float 1.000000e+00
  %58 = fmul float %55, %57
  %59 = tail call float @llvm.log2.f32(float %58)
  %60 = fmul float %59, 0x3FD3441340000000
  %61 = tail call i1 @llvm.amdgcn.class.f32(float %59, i32 519)
  %62 = fneg float %60
  %63 = tail call float @llvm.fma.f32(float %59, float 0x3FD3441340000000, float %62)
  %64 = tail call float @llvm.fma.f32(float %59, float 0x3E509F79E0000000, float %63)
  %65 = fadd float %60, %64
  %66 = select i1 %61, float %59, float %65
  %67 = select i1 %56, float 0x4023441360000000, float 0.000000e+00
  %68 = fsub float %66, %67
  %69 = fmul contract float %53, %5
  %70 = fadd contract float %69, 1.000000e+00
  %71 = tail call i1 @llvm.amdgcn.class.f32(float %70, i32 144)
  %72 = select i1 %71, float 0x41F0000000000000, float 1.000000e+00
  %73 = fmul float %70, %72
  %74 = tail call float @llvm.log2.f32(float %73)
  %75 = fmul float %74, 0x3FD3441340000000
  %76 = tail call i1 @llvm.amdgcn.class.f32(float %74, i32 519)
  %77 = fneg float %75
  %78 = tail call float @llvm.fma.f32(float %74, float 0x3FD3441340000000, float %77)
  %79 = tail call float @llvm.fma.f32(float %74, float 0x3E509F79E0000000, float %78)
  %80 = fadd float %75, %79
  %81 = select i1 %76, float %74, float %80
  %82 = select i1 %71, float 0x4023441360000000, float 0.000000e+00
  %83 = fsub float %81, %82
  %84 = fdiv contract float %68, %83
  %85 = fdiv contract float %84, %52
  %86 = fmul contract float %35, %85
  %87 = getelementptr inbounds float, float addrspace(1)* %1, i64 %33
  store float %86, float addrspace(1)* %87, align 4, !tbaa !7
  %88 = fmul contract float %39, %85
  %89 = getelementptr inbounds float, float addrspace(1)* %1, i64 %37
  store float %88, float addrspace(1)* %89, align 4, !tbaa !7
  %90 = fmul contract float %43, %85
  %91 = getelementptr inbounds float, float addrspace(1)* %1, i64 %41
  store float %90, float addrspace(1)* %91, align 4, !tbaa !7
  br label %92

92:                                               ; preds = %29, %8
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.log2.f32(float) #1

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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
