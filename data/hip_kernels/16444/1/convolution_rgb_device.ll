; ModuleID = '../data/hip_kernels/16444/1/main.cu'
source_filename = "../data/hip_kernels/16444/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z15convolution_rgbPhPfS_mmm(i8 addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, i8 addrspace(1)* nocapture %2, i64 %3, i64 %4, i64 %5) local_unnamed_addr #0 {
  %7 = add i64 %5, 8589934591
  %8 = lshr i64 %7, 1
  %9 = trunc i64 %8 to i32
  %10 = mul i32 %9, 3
  %11 = mul i64 %8, 25769803776
  %12 = ashr exact i64 %11, 32
  %13 = add i64 %12, %3
  %14 = trunc i64 %13 to i32
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %16 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %17 = getelementptr i8, i8 addrspace(4)* %16, i64 4
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = load i16, i16 addrspace(4)* %18, align 4, !range !4, !invariant.load !5
  %20 = zext i16 %19 to i32
  %21 = mul i32 %15, %20
  %22 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %23 = add i32 %21, %22
  %24 = add i32 %23, %10
  %25 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %26 = getelementptr i8, i8 addrspace(4)* %16, i64 6
  %27 = bitcast i8 addrspace(4)* %26 to i16 addrspace(4)*
  %28 = load i16, i16 addrspace(4)* %27, align 2, !range !4, !invariant.load !5
  %29 = zext i16 %28 to i32
  %30 = mul i32 %25, %29
  %31 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %32 = add i32 %30, %31
  %33 = add i32 %32, %10
  %34 = icmp slt i32 %24, %10
  br i1 %34, label %88, label %35

35:                                               ; preds = %6
  %36 = mul i64 %4, 3
  %37 = add i64 %12, %36
  %38 = trunc i64 %37 to i32
  %39 = sub i32 %38, %10
  %40 = icmp ult i32 %24, %39
  %41 = icmp sge i32 %33, %10
  %42 = select i1 %40, i1 %41, i1 false
  %43 = sub i32 %14, %10
  %44 = icmp ult i32 %33, %43
  %45 = select i1 %42, i1 %44, i1 false
  br i1 %45, label %46, label %88

46:                                               ; preds = %35
  %47 = trunc i64 %3 to i32
  %48 = mul i32 %23, %47
  %49 = add i32 %48, %32
  %50 = zext i32 %49 to i64
  %51 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %50
  store i8 0, i8 addrspace(1)* %51, align 1, !tbaa !7
  %52 = sub nsw i32 0, %10
  %53 = icmp slt i32 %10, 0
  br i1 %53, label %88, label %54

54:                                               ; preds = %46
  %55 = trunc i64 %5 to i32
  br label %56

56:                                               ; preds = %54, %64
  %57 = phi i8 [ 0, %54 ], [ %84, %64 ]
  %58 = phi i32 [ 0, %54 ], [ %65, %64 ]
  %59 = phi i32 [ %52, %54 ], [ %66, %64 ]
  %60 = add nsw i32 %59, %24
  %61 = mul i32 %60, %14
  %62 = add i32 %61, %33
  %63 = mul i32 %58, %55
  br label %68

64:                                               ; preds = %68
  %65 = add nuw nsw i32 %58, 1
  %66 = add nsw i32 %59, 3
  %67 = icmp sgt i32 %66, %10
  br i1 %67, label %88, label %56, !llvm.loop !10

68:                                               ; preds = %56, %68
  %69 = phi i8 [ %57, %56 ], [ %84, %68 ]
  %70 = phi i32 [ %52, %56 ], [ %86, %68 ]
  %71 = phi i32 [ 0, %56 ], [ %85, %68 ]
  %72 = add i32 %62, %70
  %73 = add i32 %71, %63
  %74 = zext i32 %72 to i64
  %75 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %74
  %76 = load i8, i8 addrspace(1)* %75, align 1, !tbaa !7
  %77 = uitofp i8 %76 to float
  %78 = zext i32 %73 to i64
  %79 = getelementptr inbounds float, float addrspace(1)* %1, i64 %78
  %80 = load float, float addrspace(1)* %79, align 4, !tbaa !12
  %81 = fmul contract float %80, %77
  %82 = uitofp i8 %69 to float
  %83 = fadd contract float %81, %82
  %84 = fptoui float %83 to i8
  store i8 %84, i8 addrspace(1)* %51, align 1, !tbaa !7
  %85 = add nuw nsw i32 %71, 1
  %86 = add nsw i32 %70, 3
  %87 = icmp sgt i32 %86, %10
  br i1 %87, label %64, label %68, !llvm.loop !14

88:                                               ; preds = %64, %46, %35, %6
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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
!12 = !{!13, !13, i64 0}
!13 = !{!"float", !8, i64 0}
!14 = distinct !{!14, !11}
