; ModuleID = '../data/hip_kernels/7801/77/main.cu'
source_filename = "../data/hip_kernels/7801/77/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @vec_fmodf(i64 %0, float addrspace(1)* nocapture writeonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !5, !invariant.load !6
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %11
  %13 = add i32 %12, %5
  %14 = sext i32 %13 to i64
  %15 = icmp ult i64 %14, %0
  br i1 %15, label %16, label %79

16:                                               ; preds = %4
  %17 = getelementptr inbounds float, float addrspace(1)* %2, i64 %14
  %18 = load float, float addrspace(1)* %17, align 4, !tbaa !7, !amdgpu.noclobber !6
  %19 = getelementptr inbounds float, float addrspace(1)* %3, i64 %14
  %20 = load float, float addrspace(1)* %19, align 4, !tbaa !7, !amdgpu.noclobber !6
  %21 = tail call float @llvm.fabs.f32(float %18)
  %22 = tail call float @llvm.fabs.f32(float %20)
  %23 = fcmp ogt float %21, %22
  br i1 %23, label %24, label %66

24:                                               ; preds = %16
  %25 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %21)
  %26 = tail call float @llvm.amdgcn.frexp.mant.f32(float %21)
  %27 = tail call float @llvm.amdgcn.ldexp.f32(float %26, i32 12)
  %28 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %22)
  %29 = add nsw i32 %28, -1
  %30 = tail call float @llvm.amdgcn.frexp.mant.f32(float %22)
  %31 = tail call float @llvm.amdgcn.ldexp.f32(float %30, i32 1)
  %32 = sub i32 %25, %28
  %33 = tail call float @llvm.amdgcn.rcp.f32(float %31)
  %34 = icmp sgt i32 %32, 12
  br i1 %34, label %35, label %48

35:                                               ; preds = %24, %35
  %36 = phi float [ %45, %35 ], [ %27, %24 ]
  %37 = phi i32 [ %46, %35 ], [ %32, %24 ]
  %38 = fmul float %33, %36
  %39 = tail call float @llvm.rint.f32(float %38)
  %40 = fneg float %39
  %41 = tail call float @llvm.fma.f32(float %40, float %31, float %36)
  %42 = fcmp olt float %41, 0.000000e+00
  %43 = select i1 %42, float %31, float -0.000000e+00
  %44 = fadd float %41, %43
  %45 = tail call float @llvm.amdgcn.ldexp.f32(float %44, i32 12)
  %46 = add nsw i32 %37, -12
  %47 = icmp ugt i32 %37, 24
  br i1 %47, label %35, label %48

48:                                               ; preds = %35, %24
  %49 = phi i32 [ %32, %24 ], [ %46, %35 ]
  %50 = phi float [ %27, %24 ], [ %45, %35 ]
  %51 = add nsw i32 %49, -11
  %52 = tail call float @llvm.amdgcn.ldexp.f32(float %50, i32 %51)
  %53 = fmul float %33, %52
  %54 = tail call float @llvm.rint.f32(float %53)
  %55 = fneg float %54
  %56 = tail call float @llvm.fma.f32(float %55, float %31, float %52)
  %57 = fcmp olt float %56, 0.000000e+00
  %58 = select i1 %57, float %31, float -0.000000e+00
  %59 = fadd float %56, %58
  %60 = tail call float @llvm.amdgcn.ldexp.f32(float %59, i32 %29)
  %61 = bitcast float %18 to i32
  %62 = and i32 %61, -2147483648
  %63 = bitcast float %60 to i32
  %64 = xor i32 %62, %63
  %65 = bitcast i32 %64 to float
  br label %70

66:                                               ; preds = %16
  %67 = fcmp oeq float %21, %22
  %68 = tail call float @llvm.copysign.f32(float 0.000000e+00, float %18)
  %69 = select i1 %67, float %68, float %18
  br label %70

70:                                               ; preds = %48, %66
  %71 = phi float [ %65, %48 ], [ %69, %66 ]
  %72 = fcmp oeq float %20, 0.000000e+00
  %73 = select i1 %72, float 0x7FF8000000000000, float %71
  %74 = fcmp ord float %20, 0.000000e+00
  %75 = tail call i1 @llvm.amdgcn.class.f32(float %18, i32 504)
  %76 = select i1 %74, i1 %75, i1 false
  %77 = select i1 %76, float %73, float 0x7FF8000000000000
  %78 = getelementptr inbounds float, float addrspace(1)* %1, i64 %14
  store float %77, float addrspace(1)* %78, align 4, !tbaa !7
  br label %79

79:                                               ; preds = %70, %4
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.frexp.exp.i32.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.frexp.mant.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.ldexp.f32(float, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.rcp.f32(float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.rint.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.copysign.f32(float, float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

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
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
