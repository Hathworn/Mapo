; ModuleID = '../data/hip_kernels/2583/6/main.cu'
source_filename = "../data/hip_kernels/2583/6/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z19tanhGradientDropoutiiPfS_if(i32 %0, i32 %1, float addrspace(1)* nocapture %2, float addrspace(1)* nocapture writeonly %3, i32 %4, float %5) local_unnamed_addr #0 {
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
  %24 = mul nsw i32 %23, %0
  %25 = add nsw i32 %24, %15
  %26 = fsub contract float 1.000000e+00, %5
  %27 = fdiv contract float 0x3FFB745380000000, %26
  %28 = fdiv contract float 0xBFFB745380000000, %26
  %29 = icmp slt i32 %15, %0
  %30 = icmp slt i32 %23, %1
  %31 = select i1 %29, i1 %30, i1 false
  br i1 %31, label %32, label %85

32:                                               ; preds = %6
  %33 = shl i32 %4, 20
  %34 = add nsw i32 %25, %33
  %35 = xor i32 %34, 746559103
  %36 = icmp sgt i32 %34, -1
  %37 = mul i32 %35, 1228688033
  %38 = select i1 %36, i32 -1973591729, i32 -100066652
  %39 = add i32 %37, 123456789
  %40 = add i32 %37, 5783321
  %41 = lshr i32 %39, 2
  %42 = xor i32 %41, %39
  %43 = shl i32 %40, 4
  %44 = shl i32 %42, 1
  %45 = xor i32 %43, %44
  %46 = xor i32 %45, %40
  %47 = xor i32 %46, %42
  %48 = add i32 %37, 6977678
  %49 = add i32 %48, %38
  %50 = add i32 %49, %47
  %51 = uitofp i32 %50 to float
  %52 = fmul contract float %51, 0x3DF0000000000000
  %53 = fadd contract float %52, 0x3DF0000000000000
  %54 = fcmp contract olt float %53, %5
  %55 = sext i32 %25 to i64
  %56 = getelementptr inbounds float, float addrspace(1)* %2, i64 %55
  br i1 %54, label %57, label %58

57:                                               ; preds = %32
  store float 0.000000e+00, float addrspace(1)* %56, align 4, !tbaa !7
  br label %82

58:                                               ; preds = %32
  %59 = load float, float addrspace(1)* %56, align 4, !tbaa !7, !amdgpu.noclobber !5
  %60 = fmul contract float %59, 0x3FE5555560000000
  %61 = fpext float %60 to double
  %62 = fcmp contract ogt double %61, 4.970000e+00
  br i1 %62, label %63, label %64

63:                                               ; preds = %58
  store float %27, float addrspace(1)* %56, align 4, !tbaa !7
  br label %82

64:                                               ; preds = %58
  %65 = fcmp contract olt double %61, -4.970000e+00
  br i1 %65, label %66, label %67

66:                                               ; preds = %64
  store float %28, float addrspace(1)* %56, align 4, !tbaa !7
  br label %82

67:                                               ; preds = %64
  %68 = fmul contract float %60, %60
  %69 = fadd contract float %68, 3.780000e+02
  %70 = tail call float @llvm.fma.f32(float %68, float %69, float 1.723500e+04)
  %71 = tail call float @llvm.fma.f32(float %68, float %70, float 1.351350e+05)
  %72 = fmul contract float %60, %71
  %73 = tail call float @llvm.fma.f32(float %68, float 2.800000e+01, float 3.150000e+03)
  %74 = tail call float @llvm.fma.f32(float %68, float %73, float 6.237000e+04)
  %75 = tail call float @llvm.fma.f32(float %68, float %74, float 1.351350e+05)
  %76 = fdiv contract float %72, %75
  %77 = fmul contract float %27, %76
  store float %77, float addrspace(1)* %56, align 4, !tbaa !7
  %78 = fneg contract float %76
  %79 = tail call float @llvm.fma.f32(float %78, float %76, float 1.000000e+00)
  %80 = fmul contract float %79, 0x3FE5555560000000
  %81 = fmul contract float %27, %80
  br label %82

82:                                               ; preds = %63, %67, %66, %57
  %83 = phi float [ 0.000000e+00, %57 ], [ 0.000000e+00, %66 ], [ %81, %67 ], [ 0.000000e+00, %63 ]
  %84 = getelementptr inbounds float, float addrspace(1)* %3, i64 %55
  store float %83, float addrspace(1)* %84, align 4, !tbaa !7
  br label %85

85:                                               ; preds = %82, %6
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

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
