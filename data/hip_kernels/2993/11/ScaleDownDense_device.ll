; ModuleID = '../data/hip_kernels/2993/11/main.cu'
source_filename = "../data/hip_kernels/2993/11/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@d_ScaleDownKernel = protected addrspace(4) externally_initialized global [5 x float] zeroinitializer, align 16
@_ZZ14ScaleDownDensePfS_iiiiE5irows = internal unnamed_addr addrspace(3) global [768 x float] undef, align 16
@_ZZ14ScaleDownDensePfS_iiiiE5brows = internal unnamed_addr addrspace(3) global [360 x float] undef, align 16
@llvm.compiler.used = appending addrspace(1) global [1 x i8*] [i8* addrspacecast (i8 addrspace(4)* bitcast ([5 x float] addrspace(4)* @d_ScaleDownKernel to i8 addrspace(4)*) to i8*)], section "llvm.metadata"

; Function Attrs: convergent mustprogress norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z14ScaleDownDensePfS_iiii(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, i32 %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = mul i32 %9, 60
  %11 = add i32 %10, %7
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %13 = shl i32 %12, 3
  %14 = add i32 %13, %8
  %15 = load float, float addrspace(4)* getelementptr inbounds ([5 x float], [5 x float] addrspace(4)* @d_ScaleDownKernel, i64 0, i64 0), align 16, !tbaa !5
  %16 = load float, float addrspace(4)* getelementptr inbounds ([5 x float], [5 x float] addrspace(4)* @d_ScaleDownKernel, i64 0, i64 1), align 4, !tbaa !5
  %17 = load float, float addrspace(4)* getelementptr inbounds ([5 x float], [5 x float] addrspace(4)* @d_ScaleDownKernel, i64 0, i64 2), align 8, !tbaa !5
  %18 = add nsw i32 %2, 4
  %19 = icmp slt i32 %11, %18
  %20 = add nsw i32 %4, 4
  %21 = icmp slt i32 %14, %20
  %22 = select i1 %19, i1 %21, i1 false
  br i1 %22, label %23, label %40

23:                                               ; preds = %6
  %24 = add nsw i32 %4, -1
  %25 = tail call i32 @llvm.smax.i32(i32 %14, i32 2)
  %26 = add nsw i32 %25, -2
  %27 = tail call i32 @llvm.smin.i32(i32 %24, i32 %26)
  %28 = add nsw i32 %2, -1
  %29 = tail call i32 @llvm.smax.i32(i32 %11, i32 2)
  %30 = add nsw i32 %29, -2
  %31 = tail call i32 @llvm.smin.i32(i32 %28, i32 %30)
  %32 = mul nsw i32 %27, %3
  %33 = add nsw i32 %32, %31
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds float, float addrspace(1)* %1, i64 %34
  %36 = load float, float addrspace(1)* %35, align 4, !tbaa !5, !amdgpu.noclobber !9
  %37 = shl nuw nsw i32 %8, 6
  %38 = add nuw nsw i32 %37, %7
  %39 = getelementptr inbounds [768 x float], [768 x float] addrspace(3)* @_ZZ14ScaleDownDensePfS_iiiiE5irows, i32 0, i32 %38
  store float %36, float addrspace(3)* %39, align 4, !tbaa !5
  br label %40

40:                                               ; preds = %23, %6
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %41 = icmp ult i32 %7, 30
  %42 = select i1 %21, i1 %41, i1 false
  br i1 %42, label %43, label %67

43:                                               ; preds = %40
  %44 = shl nuw nsw i32 %8, 6
  %45 = shl nuw nsw i32 %7, 1
  %46 = add nuw nsw i32 %44, %45
  %47 = getelementptr inbounds [768 x float], [768 x float] addrspace(3)* @_ZZ14ScaleDownDensePfS_iiiiE5irows, i32 0, i32 %46
  %48 = load float, float addrspace(3)* %47, align 8, !tbaa !5
  %49 = getelementptr inbounds float, float addrspace(3)* %47, i32 4
  %50 = load float, float addrspace(3)* %49, align 8, !tbaa !5
  %51 = fadd contract float %48, %50
  %52 = fmul contract float %15, %51
  %53 = getelementptr inbounds float, float addrspace(3)* %47, i32 1
  %54 = load float, float addrspace(3)* %53, align 4, !tbaa !5
  %55 = getelementptr inbounds float, float addrspace(3)* %47, i32 3
  %56 = load float, float addrspace(3)* %55, align 4, !tbaa !5
  %57 = fadd contract float %54, %56
  %58 = fmul contract float %16, %57
  %59 = fadd contract float %52, %58
  %60 = getelementptr inbounds float, float addrspace(3)* %47, i32 2
  %61 = load float, float addrspace(3)* %60, align 8, !tbaa !5
  %62 = fmul contract float %17, %61
  %63 = fadd contract float %62, %59
  %64 = mul nuw nsw i32 %8, 30
  %65 = add nuw nsw i32 %64, %7
  %66 = getelementptr inbounds [360 x float], [360 x float] addrspace(3)* @_ZZ14ScaleDownDensePfS_iiiiE5brows, i32 0, i32 %65
  store float %63, float addrspace(3)* %66, align 4, !tbaa !5
  br label %67

67:                                               ; preds = %43, %40
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %68 = mul i32 %9, 30
  %69 = add i32 %68, %7
  %70 = shl i32 %12, 2
  %71 = add i32 %70, %8
  %72 = icmp ult i32 %8, 4
  %73 = select i1 %41, i1 %72, i1 false
  %74 = sdiv i32 %2, 2
  %75 = icmp slt i32 %69, %74
  %76 = select i1 %73, i1 %75, i1 false
  %77 = sdiv i32 %4, 2
  %78 = icmp slt i32 %71, %77
  %79 = select i1 %76, i1 %78, i1 false
  br i1 %79, label %80, label %104

80:                                               ; preds = %67
  %81 = mul nuw nsw i32 %8, 60
  %82 = add nuw nsw i32 %81, %7
  %83 = getelementptr inbounds [360 x float], [360 x float] addrspace(3)* @_ZZ14ScaleDownDensePfS_iiiiE5brows, i32 0, i32 %82
  %84 = load float, float addrspace(3)* %83, align 4, !tbaa !5
  %85 = getelementptr inbounds float, float addrspace(3)* %83, i32 120
  %86 = load float, float addrspace(3)* %85, align 4, !tbaa !5
  %87 = fadd contract float %84, %86
  %88 = fmul contract float %15, %87
  %89 = getelementptr inbounds float, float addrspace(3)* %83, i32 30
  %90 = load float, float addrspace(3)* %89, align 4, !tbaa !5
  %91 = getelementptr inbounds float, float addrspace(3)* %83, i32 90
  %92 = load float, float addrspace(3)* %91, align 4, !tbaa !5
  %93 = fadd contract float %90, %92
  %94 = fmul contract float %16, %93
  %95 = fadd contract float %88, %94
  %96 = getelementptr inbounds float, float addrspace(3)* %83, i32 60
  %97 = load float, float addrspace(3)* %96, align 4, !tbaa !5
  %98 = fmul contract float %17, %97
  %99 = fadd contract float %98, %95
  %100 = mul nsw i32 %71, %5
  %101 = add nsw i32 %100, %69
  %102 = sext i32 %101 to i64
  %103 = getelementptr inbounds float, float addrspace(1)* %0, i64 %102
  store float %99, float addrspace(1)* %103, align 4, !tbaa !5
  br label %104

104:                                              ; preds = %80, %67
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smin.i32(i32, i32) #3

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smax.i32(i32, i32) #3

attributes #0 = { convergent mustprogress norecurse nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
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
