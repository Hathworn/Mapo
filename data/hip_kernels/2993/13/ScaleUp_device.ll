; ModuleID = '../data/hip_kernels/2993/13/main.cu'
source_filename = "../data/hip_kernels/2993/13/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ7ScaleUpPfS_iiiiE6buffer = internal unnamed_addr addrspace(3) global [204 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z7ScaleUpPfS_iiii(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, i32 %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %9 = icmp ult i32 %7, 34
  %10 = icmp ult i32 %8, 6
  %11 = select i1 %9, i1 %10, i1 false
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  br i1 %11, label %15, label %13

13:                                               ; preds = %6
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  br label %43

15:                                               ; preds = %6
  %16 = shl i32 %12, 5
  %17 = add nsw i32 %7, -1
  %18 = add i32 %17, %16
  %19 = uitofp i32 %18 to double
  %20 = tail call double @llvm.maxnum.f64(double %19, double 0.000000e+00)
  %21 = add nsw i32 %2, -1
  %22 = sitofp i32 %21 to double
  %23 = tail call double @llvm.minnum.f64(double %20, double %22)
  %24 = fptosi double %23 to i32
  %25 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %26 = shl i32 %25, 2
  %27 = add nsw i32 %8, -1
  %28 = add i32 %27, %26
  %29 = uitofp i32 %28 to double
  %30 = tail call double @llvm.maxnum.f64(double %29, double 0.000000e+00)
  %31 = add nsw i32 %4, -1
  %32 = sitofp i32 %31 to double
  %33 = tail call double @llvm.minnum.f64(double %30, double %32)
  %34 = fptosi double %33 to i32
  %35 = mul nsw i32 %34, %3
  %36 = add nsw i32 %35, %24
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds float, float addrspace(1)* %1, i64 %37
  %39 = load float, float addrspace(1)* %38, align 4, !tbaa !5, !amdgpu.noclobber !9
  %40 = mul nuw nsw i32 %8, 34
  %41 = add nuw nsw i32 %40, %7
  %42 = getelementptr inbounds [204 x float], [204 x float] addrspace(3)* @_ZZ7ScaleUpPfS_iiiiE6buffer, i32 0, i32 %41
  store float %39, float addrspace(3)* %42, align 4, !tbaa !5
  br label %43

43:                                               ; preds = %13, %15
  %44 = phi i32 [ %14, %13 ], [ %25, %15 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %45 = shl i32 %12, 6
  %46 = add i32 %45, %7
  %47 = shl i32 %44, 3
  %48 = add i32 %47, %8
  %49 = shl nsw i32 %2, 1
  %50 = icmp slt i32 %46, %49
  %51 = shl nsw i32 %4, 1
  %52 = icmp slt i32 %48, %51
  %53 = select i1 %50, i1 %52, i1 false
  br i1 %53, label %54, label %95

54:                                               ; preds = %43
  %55 = add nuw nsw i32 %7, 1
  %56 = lshr i32 %55, 1
  %57 = add nuw nsw i32 %8, 1
  %58 = lshr i32 %57, 1
  %59 = mul nuw nsw i32 %58, 34
  %60 = add nuw nsw i32 %59, %56
  %61 = and i32 %7, 1
  %62 = sitofp i32 %61 to float
  %63 = fmul contract float %62, 5.000000e-01
  %64 = fadd contract float %63, 2.500000e-01
  %65 = and i32 %8, 1
  %66 = sitofp i32 %65 to float
  %67 = fmul contract float %66, 5.000000e-01
  %68 = fadd contract float %67, 2.500000e-01
  %69 = getelementptr inbounds [204 x float], [204 x float] addrspace(3)* @_ZZ7ScaleUpPfS_iiiiE6buffer, i32 0, i32 %60
  %70 = load float, float addrspace(3)* %69, align 4, !tbaa !5
  %71 = fmul contract float %64, %70
  %72 = fsub contract float 1.000000e+00, %64
  %73 = add nuw nsw i32 %60, 1
  %74 = getelementptr inbounds [204 x float], [204 x float] addrspace(3)* @_ZZ7ScaleUpPfS_iiiiE6buffer, i32 0, i32 %73
  %75 = load float, float addrspace(3)* %74, align 4, !tbaa !5
  %76 = fmul contract float %72, %75
  %77 = fadd contract float %71, %76
  %78 = fmul contract float %68, %77
  %79 = fsub contract float 1.000000e+00, %68
  %80 = add nuw nsw i32 %60, 34
  %81 = getelementptr inbounds [204 x float], [204 x float] addrspace(3)* @_ZZ7ScaleUpPfS_iiiiE6buffer, i32 0, i32 %80
  %82 = load float, float addrspace(3)* %81, align 4, !tbaa !5
  %83 = fmul contract float %64, %82
  %84 = add nuw nsw i32 %60, 35
  %85 = getelementptr inbounds [204 x float], [204 x float] addrspace(3)* @_ZZ7ScaleUpPfS_iiiiE6buffer, i32 0, i32 %84
  %86 = load float, float addrspace(3)* %85, align 4, !tbaa !5
  %87 = fmul contract float %72, %86
  %88 = fadd contract float %83, %87
  %89 = fmul contract float %79, %88
  %90 = fadd contract float %78, %89
  %91 = mul nsw i32 %48, %5
  %92 = add nsw i32 %91, %46
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds float, float addrspace(1)* %0, i64 %93
  store float %90, float addrspace(1)* %94, align 4, !tbaa !5
  br label %95

95:                                               ; preds = %54, %43
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.maxnum.f64(double, double) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.minnum.f64(double, double) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #3

attributes #0 = { convergent mustprogress norecurse nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
