; ModuleID = '../data/hip_kernels/260/10/main.cu'
source_filename = "../data/hip_kernels/260/10/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z17mSetFieldBoundaryPff(float addrspace(1)* nocapture %0, float %1) local_unnamed_addr #0 {
  %3 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %4 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %5 = getelementptr i8, i8 addrspace(4)* %4, i64 4
  %6 = bitcast i8 addrspace(4)* %5 to i16 addrspace(4)*
  %7 = load i16, i16 addrspace(4)* %6, align 4, !range !4, !invariant.load !5
  %8 = zext i16 %7 to i32
  %9 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %10 = icmp eq i32 %9, 0
  %11 = add nsw i32 %8, -1
  %12 = icmp eq i32 %11, %9
  %13 = icmp eq i32 %3, 0
  %14 = icmp eq i32 %3, 479
  %15 = select i1 %10, i1 true, i1 %12
  %16 = select i1 %15, i1 true, i1 %13
  %17 = select i1 %16, i1 true, i1 %14
  br i1 %17, label %18, label %98

18:                                               ; preds = %2
  %19 = mul i32 %3, %8
  %20 = add i32 %19, %9
  %21 = select i1 %10, i1 %13, i1 false
  br i1 %21, label %22, label %31

22:                                               ; preds = %18
  %23 = add i32 %20, %8
  %24 = add i32 %23, 1
  %25 = zext i32 %24 to i64
  %26 = getelementptr inbounds float, float addrspace(1)* %0, i64 %25
  %27 = load float, float addrspace(1)* %26, align 4, !tbaa !7, !amdgpu.noclobber !5
  %28 = fmul contract float %27, %1
  %29 = sext i32 %20 to i64
  %30 = getelementptr inbounds float, float addrspace(1)* %0, i64 %29
  store float %28, float addrspace(1)* %30, align 4, !tbaa !7
  br label %98

31:                                               ; preds = %18
  %32 = icmp eq i32 %3, %11
  %33 = select i1 %10, i1 %32, i1 false
  br i1 %33, label %34, label %43

34:                                               ; preds = %31
  %35 = sub i32 %20, %8
  %36 = add i32 %35, 1
  %37 = zext i32 %36 to i64
  %38 = getelementptr inbounds float, float addrspace(1)* %0, i64 %37
  %39 = load float, float addrspace(1)* %38, align 4, !tbaa !7, !amdgpu.noclobber !5
  %40 = fmul contract float %39, %1
  %41 = sext i32 %20 to i64
  %42 = getelementptr inbounds float, float addrspace(1)* %0, i64 %41
  store float %40, float addrspace(1)* %42, align 4, !tbaa !7
  br label %98

43:                                               ; preds = %31
  %44 = select i1 %12, i1 %13, i1 false
  br i1 %44, label %45, label %54

45:                                               ; preds = %43
  %46 = add i32 %20, %8
  %47 = add i32 %46, -1
  %48 = zext i32 %47 to i64
  %49 = getelementptr inbounds float, float addrspace(1)* %0, i64 %48
  %50 = load float, float addrspace(1)* %49, align 4, !tbaa !7, !amdgpu.noclobber !5
  %51 = fmul contract float %50, %1
  %52 = sext i32 %20 to i64
  %53 = getelementptr inbounds float, float addrspace(1)* %0, i64 %52
  store float %51, float addrspace(1)* %53, align 4, !tbaa !7
  br label %98

54:                                               ; preds = %43
  %55 = select i1 %12, i1 %32, i1 false
  br i1 %55, label %56, label %65

56:                                               ; preds = %54
  %57 = sub i32 %20, %8
  %58 = add i32 %57, -1
  %59 = zext i32 %58 to i64
  %60 = getelementptr inbounds float, float addrspace(1)* %0, i64 %59
  %61 = load float, float addrspace(1)* %60, align 4, !tbaa !7, !amdgpu.noclobber !5
  %62 = fmul contract float %61, %1
  %63 = sext i32 %20 to i64
  %64 = getelementptr inbounds float, float addrspace(1)* %0, i64 %63
  store float %62, float addrspace(1)* %64, align 4, !tbaa !7
  br label %98

65:                                               ; preds = %54
  br i1 %10, label %66, label %74

66:                                               ; preds = %65
  %67 = add nsw i32 %20, 1
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds float, float addrspace(1)* %0, i64 %68
  %70 = load float, float addrspace(1)* %69, align 4, !tbaa !7, !amdgpu.noclobber !5
  %71 = fmul contract float %70, %1
  %72 = sext i32 %20 to i64
  %73 = getelementptr inbounds float, float addrspace(1)* %0, i64 %72
  store float %71, float addrspace(1)* %73, align 4, !tbaa !7
  br label %98

74:                                               ; preds = %65
  br i1 %12, label %75, label %83

75:                                               ; preds = %74
  %76 = add nsw i32 %20, -1
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds float, float addrspace(1)* %0, i64 %77
  %79 = load float, float addrspace(1)* %78, align 4, !tbaa !7, !amdgpu.noclobber !5
  %80 = fmul contract float %79, %1
  %81 = sext i32 %20 to i64
  %82 = getelementptr inbounds float, float addrspace(1)* %0, i64 %81
  store float %80, float addrspace(1)* %82, align 4, !tbaa !7
  br label %98

83:                                               ; preds = %74
  %84 = sext i32 %20 to i64
  %85 = getelementptr inbounds float, float addrspace(1)* %0, i64 %84
  br i1 %13, label %86, label %92

86:                                               ; preds = %83
  %87 = add i32 %20, %8
  %88 = zext i32 %87 to i64
  %89 = getelementptr inbounds float, float addrspace(1)* %0, i64 %88
  %90 = load float, float addrspace(1)* %89, align 4, !tbaa !7, !amdgpu.noclobber !5
  %91 = fmul contract float %90, %1
  store float %91, float addrspace(1)* %85, align 4, !tbaa !7
  br label %98

92:                                               ; preds = %83
  %93 = sub i32 %20, %8
  %94 = zext i32 %93 to i64
  %95 = getelementptr inbounds float, float addrspace(1)* %0, i64 %94
  %96 = load float, float addrspace(1)* %95, align 4, !tbaa !7, !amdgpu.noclobber !5
  %97 = fmul contract float %96, %1
  store float %97, float addrspace(1)* %85, align 4, !tbaa !7
  br label %98

98:                                               ; preds = %22, %45, %66, %86, %92, %75, %56, %34, %2
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
