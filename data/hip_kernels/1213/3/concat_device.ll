; ModuleID = '../data/hip_kernels/1213/3/main.cu'
source_filename = "../data/hip_kernels/1213/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z6concatPfS_S_S_S_iiiii(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture readonly %4, i32 %5, i32 %6, i32 %7, i32 %8, i32 %9) local_unnamed_addr #0 {
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %12 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %13 = getelementptr i8, i8 addrspace(4)* %12, i64 4
  %14 = bitcast i8 addrspace(4)* %13 to i16 addrspace(4)*
  %15 = load i16, i16 addrspace(4)* %14, align 4, !range !4, !invariant.load !5
  %16 = zext i16 %15 to i32
  %17 = mul i32 %11, %16
  %18 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %19 = add i32 %17, %18
  %20 = add i32 %7, %6
  %21 = add i32 %20, %8
  %22 = add i32 %21, %9
  %23 = mul nsw i32 %5, %5
  %24 = icmp slt i32 %19, %23
  %25 = icmp sgt i32 %22, 0
  %26 = select i1 %24, i1 %25, i1 false
  br i1 %26, label %27, label %91

27:                                               ; preds = %10
  %28 = freeze i32 %19
  %29 = freeze i32 %5
  %30 = sdiv i32 %28, %29
  %31 = mul i32 %30, %29
  %32 = sub i32 %28, %31
  br label %33

33:                                               ; preds = %27, %88
  %34 = phi i32 [ 0, %27 ], [ %89, %88 ]
  %35 = icmp slt i32 %34, %6
  br i1 %35, label %36, label %45

36:                                               ; preds = %33
  %37 = mul nsw i32 %34, %5
  %38 = add nsw i32 %32, %37
  %39 = mul nsw i32 %38, %5
  %40 = add nsw i32 %39, %30
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds float, float addrspace(1)* %1, i64 %41
  %43 = load float, float addrspace(1)* %42, align 4, !tbaa !7
  %44 = getelementptr inbounds float, float addrspace(1)* %0, i64 %41
  store float %43, float addrspace(1)* %44, align 4, !tbaa !7
  br label %88

45:                                               ; preds = %33
  %46 = icmp slt i32 %34, %20
  br i1 %46, label %47, label %62

47:                                               ; preds = %45
  %48 = sub nsw i32 %34, %6
  %49 = mul nsw i32 %48, %5
  %50 = add nsw i32 %32, %49
  %51 = mul nsw i32 %50, %5
  %52 = add nsw i32 %51, %30
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds float, float addrspace(1)* %2, i64 %53
  %55 = load float, float addrspace(1)* %54, align 4, !tbaa !7
  %56 = mul nsw i32 %34, %5
  %57 = add nsw i32 %32, %56
  %58 = mul nsw i32 %57, %5
  %59 = add nsw i32 %58, %30
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds float, float addrspace(1)* %0, i64 %60
  store float %55, float addrspace(1)* %61, align 4, !tbaa !7
  br label %88

62:                                               ; preds = %45
  %63 = icmp slt i32 %34, %21
  %64 = mul nsw i32 %34, %5
  %65 = add nsw i32 %32, %64
  %66 = mul nsw i32 %65, %5
  %67 = add nsw i32 %66, %30
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds float, float addrspace(1)* %0, i64 %68
  br i1 %63, label %70, label %79

70:                                               ; preds = %62
  %71 = sub i32 %34, %20
  %72 = mul nsw i32 %71, %5
  %73 = add nsw i32 %32, %72
  %74 = mul nsw i32 %73, %5
  %75 = add nsw i32 %74, %30
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds float, float addrspace(1)* %3, i64 %76
  %78 = load float, float addrspace(1)* %77, align 4, !tbaa !7
  store float %78, float addrspace(1)* %69, align 4, !tbaa !7
  br label %88

79:                                               ; preds = %62
  %80 = sub i32 %34, %21
  %81 = mul nsw i32 %80, %5
  %82 = add nsw i32 %32, %81
  %83 = mul nsw i32 %82, %5
  %84 = add nsw i32 %83, %30
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds float, float addrspace(1)* %4, i64 %85
  %87 = load float, float addrspace(1)* %86, align 4, !tbaa !7
  store float %87, float addrspace(1)* %69, align 4, !tbaa !7
  br label %88

88:                                               ; preds = %47, %79, %70, %36
  %89 = add nuw nsw i32 %34, 1
  %90 = icmp eq i32 %89, %22
  br i1 %90, label %91, label %33, !llvm.loop !11

91:                                               ; preds = %88, %10
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
