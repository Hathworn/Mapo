; ModuleID = '../data/hip_kernels/14716/17/main.cu'
source_filename = "../data/hip_kernels/14716/17/main.cu"
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
  br i1 %31, label %32, label %87

32:                                               ; preds = %9
  %33 = icmp sgt i64 %3, 0
  %34 = sext i32 %4 to i64
  %35 = getelementptr inbounds i64, i64 addrspace(1)* %1, i64 %34
  %36 = load i64, i64 addrspace(1)* %35, align 8, !tbaa !7, !amdgpu.noclobber !5
  br label %37

37:                                               ; preds = %32, %39
  %38 = phi i64 [ 0, %32 ], [ %50, %39 ]
  br i1 %33, label %52, label %39

39:                                               ; preds = %80, %37
  %40 = phi i32 [ 0, %37 ], [ %82, %80 ]
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds float, float addrspace(1)* %2, i64 %38
  %43 = load float, float addrspace(1)* %42, align 4, !tbaa !11
  %44 = fadd contract float %43, -1.000000e+00
  %45 = fptosi float %44 to i64
  %46 = mul nsw i64 %36, %45
  %47 = add nsw i64 %46, %41
  %48 = getelementptr inbounds float, float addrspace(1)* %0, i64 %47
  store float %8, float addrspace(1)* %48, align 4, !tbaa !11
  %49 = add nuw nsw i64 %38, 1
  %50 = and i64 %49, 4294967295
  %51 = icmp slt i64 %50, %5
  br i1 %51, label %37, label %87, !llvm.loop !13

52:                                               ; preds = %37, %80
  %53 = phi i64 [ %85, %80 ], [ 0, %37 ]
  %54 = phi i32 [ %84, %80 ], [ %26, %37 ]
  %55 = phi i32 [ %82, %80 ], [ 0, %37 ]
  %56 = trunc i64 %53 to i32
  %57 = icmp slt i32 %56, %4
  br i1 %57, label %58, label %70

58:                                               ; preds = %52
  %59 = sext i32 %54 to i64
  %60 = getelementptr inbounds i64, i64 addrspace(1)* %1, i64 %53
  %61 = load i64, i64 addrspace(1)* %60, align 8, !tbaa !7, !amdgpu.noclobber !5
  %62 = sdiv i64 %61, %7
  %63 = sdiv i64 %59, %62
  %64 = mul nsw i64 %63, %62
  %65 = trunc i64 %64 to i32
  %66 = sub i32 %54, %65
  %67 = mul nsw i64 %63, %61
  %68 = trunc i64 %67 to i32
  %69 = add i32 %55, %68
  br label %80

70:                                               ; preds = %52
  %71 = icmp sgt i32 %56, %4
  br i1 %71, label %72, label %80

72:                                               ; preds = %70
  %73 = sext i32 %54 to i64
  %74 = getelementptr inbounds i64, i64 addrspace(1)* %1, i64 %53
  %75 = load i64, i64 addrspace(1)* %74, align 8, !tbaa !7, !amdgpu.noclobber !5
  %76 = srem i64 %73, %75
  %77 = trunc i64 %76 to i32
  %78 = add i32 %55, %54
  %79 = sub i32 %78, %77
  br label %80

80:                                               ; preds = %58, %72, %70
  %81 = phi i32 [ %66, %58 ], [ %77, %72 ], [ %54, %70 ]
  %82 = phi i32 [ %69, %58 ], [ %79, %72 ], [ %55, %70 ]
  %83 = add nuw nsw i64 %53, 1
  %84 = freeze i32 %81
  %85 = and i64 %83, 4294967295
  %86 = icmp slt i64 %85, %3
  br i1 %86, label %52, label %39, !llvm.loop !15

87:                                               ; preds = %39, %9
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
