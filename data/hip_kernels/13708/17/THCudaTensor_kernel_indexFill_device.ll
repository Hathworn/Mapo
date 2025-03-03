; ModuleID = '../data/hip_kernels/13708/17/main.cu'
source_filename = "../data/hip_kernels/13708/17/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z29THCudaTensor_kernel_indexFillPfPlS_lilllf(float addrspace(1)* nocapture writeonly %0, i64 addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, i64 %3, i32 %4, i64 %5, i64 %6, i64 %7, float %8) local_unnamed_addr #0 {
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %12 = getelementptr i8, i8 addrspace(4)* %11, i64 4
  %13 = bitcast i8 addrspace(4)* %12 to i16 addrspace(4)*
  %14 = load i16, i16 addrspace(4)* %13, align 4, !range !4, !invariant.load !5
  %15 = zext i16 %14 to i32
  %16 = getelementptr i8, i8 addrspace(4)* %11, i64 6
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = load i16, i16 addrspace(4)* %17, align 2, !range !4, !invariant.load !5
  %19 = zext i16 %18 to i32
  %20 = mul i32 %10, %19
  %21 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %22 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %23 = add i32 %20, %21
  %24 = mul i32 %23, %15
  %25 = add i32 %24, %22
  %26 = freeze i32 %25
  %27 = sdiv i64 %6, %5
  %28 = sext i32 %26 to i64
  %29 = icmp sgt i64 %27, %28
  %30 = icmp sgt i64 %5, 0
  %31 = and i1 %29, %30
  br i1 %31, label %32, label %88

32:                                               ; preds = %9
  %33 = icmp sgt i64 %3, 0
  %34 = sext i32 %4 to i64
  %35 = getelementptr inbounds i64, i64 addrspace(1)* %1, i64 %34
  %36 = load i64, i64 addrspace(1)* %35, align 8, !tbaa !7, !amdgpu.noclobber !5
  br label %37

37:                                               ; preds = %32, %39
  %38 = phi i64 [ 0, %32 ], [ %51, %39 ]
  br i1 %33, label %53, label %39

39:                                               ; preds = %81, %37
  %40 = phi i32 [ 0, %37 ], [ %83, %81 ]
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds float, float addrspace(1)* %2, i64 %38
  %43 = load float, float addrspace(1)* %42, align 4, !tbaa !11
  %44 = fadd contract float %43, -1.000000e+00
  %45 = fptosi float %44 to i32
  %46 = sext i32 %45 to i64
  %47 = mul nsw i64 %36, %46
  %48 = add nsw i64 %47, %41
  %49 = getelementptr inbounds float, float addrspace(1)* %0, i64 %48
  store float %8, float addrspace(1)* %49, align 4, !tbaa !11
  %50 = add nuw nsw i64 %38, 1
  %51 = and i64 %50, 4294967295
  %52 = icmp slt i64 %51, %5
  br i1 %52, label %37, label %88, !llvm.loop !13

53:                                               ; preds = %37, %81
  %54 = phi i64 [ %86, %81 ], [ 0, %37 ]
  %55 = phi i32 [ %85, %81 ], [ %26, %37 ]
  %56 = phi i32 [ %83, %81 ], [ 0, %37 ]
  %57 = trunc i64 %54 to i32
  %58 = icmp slt i32 %57, %4
  br i1 %58, label %59, label %71

59:                                               ; preds = %53
  %60 = sext i32 %55 to i64
  %61 = getelementptr inbounds i64, i64 addrspace(1)* %1, i64 %54
  %62 = load i64, i64 addrspace(1)* %61, align 8, !tbaa !7, !amdgpu.noclobber !5
  %63 = sdiv i64 %62, %7
  %64 = sdiv i64 %60, %63
  %65 = mul nsw i64 %64, %63
  %66 = trunc i64 %65 to i32
  %67 = sub i32 %55, %66
  %68 = mul nsw i64 %64, %62
  %69 = trunc i64 %68 to i32
  %70 = add i32 %56, %69
  br label %81

71:                                               ; preds = %53
  %72 = icmp sgt i32 %57, %4
  br i1 %72, label %73, label %81

73:                                               ; preds = %71
  %74 = sext i32 %55 to i64
  %75 = getelementptr inbounds i64, i64 addrspace(1)* %1, i64 %54
  %76 = load i64, i64 addrspace(1)* %75, align 8, !tbaa !7, !amdgpu.noclobber !5
  %77 = srem i64 %74, %76
  %78 = trunc i64 %77 to i32
  %79 = add i32 %56, %55
  %80 = sub i32 %79, %78
  br label %81

81:                                               ; preds = %59, %73, %71
  %82 = phi i32 [ %67, %59 ], [ %78, %73 ], [ %55, %71 ]
  %83 = phi i32 [ %70, %59 ], [ %80, %73 ], [ %56, %71 ]
  %84 = add nuw nsw i64 %54, 1
  %85 = freeze i32 %82
  %86 = and i64 %84, 4294967295
  %87 = icmp slt i64 %86, %3
  br i1 %87, label %53, label %39, !llvm.loop !15

88:                                               ; preds = %39, %9
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

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
!8 = !{!"long", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"float", !9, i64 0}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
!15 = distinct !{!15, !14}
