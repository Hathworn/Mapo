; ModuleID = '../data/hip_kernels/1129/16/main.cu'
source_filename = "../data/hip_kernels/1129/16/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z17convolutionGlobalPfS_S_iiii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, i32 %3, i32 %4, i32 %5, i32 %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !5, !invariant.load !6
  %14 = zext i16 %13 to i32
  %15 = mul i32 %10, %14
  %16 = add i32 %15, %8
  %17 = zext i32 %16 to i64
  %18 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %19 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %20 = getelementptr i8, i8 addrspace(4)* %9, i64 6
  %21 = bitcast i8 addrspace(4)* %20 to i16 addrspace(4)*
  %22 = load i16, i16 addrspace(4)* %21, align 2, !range !5, !invariant.load !6
  %23 = zext i16 %22 to i32
  %24 = mul i32 %19, %23
  %25 = add i32 %24, %18
  %26 = zext i32 %25 to i64
  %27 = sext i32 %6 to i64
  %28 = ashr i32 %6, 1
  %29 = sext i32 %3 to i64
  %30 = icmp ult i64 %17, %29
  br i1 %30, label %31, label %95

31:                                               ; preds = %7
  %32 = sext i32 %4 to i64
  %33 = icmp ult i64 %26, %32
  %34 = icmp ne i32 %5, 0
  %35 = select i1 %33, i1 %34, i1 false
  br i1 %35, label %36, label %95

36:                                               ; preds = %31
  %37 = icmp eq i32 %6, 0
  %38 = sext i32 %28 to i64
  %39 = add nsw i64 %17, %38
  %40 = add nsw i32 %3, -1
  %41 = add nsw i64 %26, %38
  %42 = add nsw i32 %4, -1
  %43 = mul nsw i64 %26, %29
  %44 = add nsw i64 %43, %17
  %45 = mul i32 %4, %3
  br label %46

46:                                               ; preds = %36, %50
  %47 = phi i32 [ 0, %36 ], [ %56, %50 ]
  br i1 %37, label %50, label %48

48:                                               ; preds = %46
  %49 = mul i32 %47, %4
  br label %58

50:                                               ; preds = %67, %46
  %51 = phi float [ 0.000000e+00, %46 ], [ %91, %67 ]
  %52 = mul i32 %45, %47
  %53 = zext i32 %52 to i64
  %54 = add i64 %44, %53
  %55 = getelementptr inbounds float, float addrspace(1)* %2, i64 %54
  store float %51, float addrspace(1)* %55, align 4, !tbaa !7
  %56 = add nuw i32 %47, 1
  %57 = icmp eq i32 %56, %5
  br i1 %57, label %95, label %46, !llvm.loop !11

58:                                               ; preds = %48, %67
  %59 = phi i64 [ 0, %48 ], [ %69, %67 ]
  %60 = phi float [ 0.000000e+00, %48 ], [ %91, %67 ]
  %61 = icmp ult i64 %39, %59
  %62 = sub nsw i64 %39, %59
  %63 = icmp ult i64 %62, %29
  %64 = trunc i64 %62 to i32
  %65 = select i1 %63, i32 %64, i32 %40
  %66 = select i1 %61, i32 0, i32 %65
  br label %71

67:                                               ; preds = %71
  %68 = add nuw nsw i64 %59, 1
  %69 = and i64 %68, 4294967295
  %70 = icmp ult i64 %69, %27
  br i1 %70, label %58, label %50, !llvm.loop !13

71:                                               ; preds = %58, %71
  %72 = phi i64 [ 0, %58 ], [ %93, %71 ]
  %73 = phi float [ %60, %58 ], [ %91, %71 ]
  %74 = icmp ult i64 %41, %72
  %75 = sub nsw i64 %41, %72
  %76 = icmp ult i64 %75, %32
  %77 = trunc i64 %75 to i32
  %78 = select i1 %76, i32 %77, i32 %42
  %79 = select i1 %74, i32 0, i32 %78
  %80 = mul nsw i64 %72, %27
  %81 = add i64 %80, %59
  %82 = getelementptr inbounds float, float addrspace(1)* %1, i64 %81
  %83 = load float, float addrspace(1)* %82, align 4, !tbaa !7
  %84 = add i32 %79, %49
  %85 = mul i32 %84, %3
  %86 = add i32 %85, %66
  %87 = zext i32 %86 to i64
  %88 = getelementptr inbounds float, float addrspace(1)* %0, i64 %87
  %89 = load float, float addrspace(1)* %88, align 4, !tbaa !7
  %90 = fmul contract float %83, %89
  %91 = fadd contract float %73, %90
  %92 = add nuw nsw i64 %72, 1
  %93 = and i64 %92, 4294967295
  %94 = icmp ult i64 %93, %27
  br i1 %94, label %71, label %67, !llvm.loop !14

95:                                               ; preds = %50, %7, %31
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

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !12}
!14 = distinct !{!14, !12}
