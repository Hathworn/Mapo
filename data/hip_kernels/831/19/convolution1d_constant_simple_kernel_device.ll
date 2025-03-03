; ModuleID = '../data/hip_kernels/831/19/main.cu'
source_filename = "../data/hip_kernels/831/19/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@Global_Mask = protected addrspace(4) externally_initialized global [9 x i8] zeroinitializer, align 1
@_ZZ36convolution1d_constant_simple_kernelPiS_E4N_ds = internal unnamed_addr addrspace(3) global [32 x float] undef, align 16
@llvm.compiler.used = appending addrspace(1) global [1 x i8*] [i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([9 x i8], [9 x i8] addrspace(4)* @Global_Mask, i32 0, i32 0) to i8*)], section "llvm.metadata"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z36convolution1d_constant_simple_kernelPiS_(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture writeonly %1) local_unnamed_addr #0 {
  %3 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %4 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %5 = getelementptr i8, i8 addrspace(4)* %4, i64 4
  %6 = bitcast i8 addrspace(4)* %5 to i16 addrspace(4)*
  %7 = load i16, i16 addrspace(4)* %6, align 4, !range !4, !invariant.load !5
  %8 = zext i16 %7 to i32
  %9 = mul i32 %3, %8
  %10 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %11 = add i32 %9, %10
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %12
  %14 = load i32, i32 addrspace(1)* %13, align 4, !tbaa !7, !amdgpu.noclobber !5
  %15 = sitofp i32 %14 to float
  %16 = getelementptr inbounds [32 x float], [32 x float] addrspace(3)* @_ZZ36convolution1d_constant_simple_kernelPiS_E4N_ds, i32 0, i32 %10
  store float %15, float addrspace(3)* %16, align 4, !tbaa !11
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %17 = add i32 %3, 1
  %18 = mul i32 %17, %8
  %19 = add i32 %11, -1
  %20 = icmp ult i32 %19, 32
  br i1 %20, label %21, label %40

21:                                               ; preds = %2
  %22 = icmp sge i32 %19, %9
  %23 = icmp slt i32 %19, %18
  %24 = select i1 %22, i1 %23, i1 false
  %25 = load i8, i8 addrspace(4)* getelementptr inbounds ([9 x i8], [9 x i8] addrspace(4)* @Global_Mask, i64 0, i64 0), align 1, !tbaa !13
  br i1 %24, label %26, label %34

26:                                               ; preds = %21
  %27 = add nsw i32 %10, -1
  %28 = getelementptr inbounds [32 x float], [32 x float] addrspace(3)* @_ZZ36convolution1d_constant_simple_kernelPiS_E4N_ds, i32 0, i32 %27
  %29 = load float, float addrspace(3)* %28, align 4, !tbaa !11
  %30 = sitofp i8 %25 to float
  %31 = fmul contract float %29, %30
  %32 = fadd contract float %31, 0.000000e+00
  %33 = fptosi float %32 to i32
  br label %40

34:                                               ; preds = %21
  %35 = zext i32 %19 to i64
  %36 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %35
  %37 = load i32, i32 addrspace(1)* %36, align 4, !tbaa !7, !amdgpu.noclobber !5
  %38 = sext i8 %25 to i32
  %39 = mul nsw i32 %37, %38
  br label %40

40:                                               ; preds = %26, %34, %2
  %41 = phi i32 [ %33, %26 ], [ %39, %34 ], [ 0, %2 ]
  %42 = icmp ult i32 %11, 32
  br i1 %42, label %43, label %63

43:                                               ; preds = %40
  %44 = icmp sge i32 %11, %9
  %45 = icmp slt i32 %11, %18
  %46 = select i1 %44, i1 %45, i1 false
  br i1 %46, label %55, label %47

47:                                               ; preds = %43
  %48 = zext i32 %11 to i64
  %49 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %48
  %50 = load i32, i32 addrspace(1)* %49, align 4, !tbaa !7, !amdgpu.noclobber !5
  %51 = load i8, i8 addrspace(4)* getelementptr inbounds ([9 x i8], [9 x i8] addrspace(4)* @Global_Mask, i64 0, i64 1), align 1, !tbaa !13
  %52 = sext i8 %51 to i32
  %53 = mul nsw i32 %50, %52
  %54 = add nsw i32 %53, %41
  br label %63

55:                                               ; preds = %43
  %56 = load float, float addrspace(3)* %16, align 4, !tbaa !11
  %57 = load i8, i8 addrspace(4)* getelementptr inbounds ([9 x i8], [9 x i8] addrspace(4)* @Global_Mask, i64 0, i64 1), align 1, !tbaa !13
  %58 = sitofp i8 %57 to float
  %59 = fmul contract float %56, %58
  %60 = sitofp i32 %41 to float
  %61 = fadd contract float %59, %60
  %62 = fptosi float %61 to i32
  br label %63

63:                                               ; preds = %55, %47, %40
  %64 = phi i32 [ %62, %55 ], [ %54, %47 ], [ %41, %40 ]
  %65 = add i32 %11, 1
  %66 = icmp ult i32 %65, 32
  br i1 %66, label %67, label %88

67:                                               ; preds = %63
  %68 = icmp sge i32 %65, %9
  %69 = icmp slt i32 %65, %18
  %70 = select i1 %68, i1 %69, i1 false
  %71 = load i8, i8 addrspace(4)* getelementptr inbounds ([9 x i8], [9 x i8] addrspace(4)* @Global_Mask, i64 0, i64 2), align 1, !tbaa !13
  br i1 %70, label %79, label %72

72:                                               ; preds = %67
  %73 = zext i32 %65 to i64
  %74 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %73
  %75 = load i32, i32 addrspace(1)* %74, align 4, !tbaa !7, !amdgpu.noclobber !5
  %76 = sext i8 %71 to i32
  %77 = mul nsw i32 %75, %76
  %78 = add nsw i32 %77, %64
  br label %88

79:                                               ; preds = %67
  %80 = add nuw nsw i32 %10, 1
  %81 = getelementptr inbounds [32 x float], [32 x float] addrspace(3)* @_ZZ36convolution1d_constant_simple_kernelPiS_E4N_ds, i32 0, i32 %80
  %82 = load float, float addrspace(3)* %81, align 4, !tbaa !11
  %83 = sitofp i8 %71 to float
  %84 = fmul contract float %82, %83
  %85 = sitofp i32 %64 to float
  %86 = fadd contract float %84, %85
  %87 = fptosi float %86 to i32
  br label %88

88:                                               ; preds = %79, %72, %63
  %89 = phi i32 [ %87, %79 ], [ %78, %72 ], [ %64, %63 ]
  %90 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %12
  store i32 %89, i32 addrspace(1)* %90, align 4, !tbaa !7
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
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
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"float", !9, i64 0}
!13 = !{!9, !9, i64 0}
