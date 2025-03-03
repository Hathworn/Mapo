; ModuleID = '../data/hip_kernels/1187/19/main.cu'
source_filename = "../data/hip_kernels/1187/19/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z16sga_left_forwardiPKfiiiiPf(i32 %0, float addrspace(1)* nocapture readonly %1, i32 %2, i32 %3, i32 %4, i32 %5, float addrspace(1)* nocapture %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !4, !invariant.load !5
  %13 = zext i16 %12 to i32
  %14 = mul i32 %8, %13
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %16 = add i32 %14, %15
  %17 = icmp slt i32 %16, %0
  br i1 %17, label %18, label %120

18:                                               ; preds = %7
  %19 = mul nsw i32 %3, %2
  %20 = freeze i32 %16
  %21 = freeze i32 %2
  %22 = sdiv i32 %20, %21
  %23 = mul nsw i32 %22, %19
  %24 = mul nsw i32 %23, %4
  %25 = mul i32 %22, %21
  %26 = sub i32 %20, %25
  %27 = mul nsw i32 %26, %3
  %28 = add nsw i32 %24, %27
  %29 = mul nsw i32 %23, %5
  %30 = add nsw i32 %29, %27
  %31 = icmp sgt i32 %3, 0
  br i1 %31, label %32, label %120

32:                                               ; preds = %18
  %33 = icmp sgt i32 %4, 0
  %34 = shl nsw i32 %19, 1
  %35 = mul nsw i32 %19, 3
  %36 = shl nsw i32 %19, 2
  br label %39

37:                                               ; preds = %114, %39
  %38 = icmp sgt i32 %40, 1
  br i1 %38, label %39, label %120, !llvm.loop !7

39:                                               ; preds = %32, %37
  %40 = phi i32 [ %3, %32 ], [ %41, %37 ]
  %41 = add nsw i32 %40, -1
  %42 = add nsw i32 %30, %41
  br i1 %33, label %43, label %37

43:                                               ; preds = %39
  %44 = sext i32 %42 to i64
  %45 = getelementptr inbounds float, float addrspace(1)* %1, i64 %44
  %46 = icmp slt i32 %40, %3
  %47 = add nsw i32 %42, %19
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds float, float addrspace(1)* %1, i64 %48
  %50 = add nuw nsw i32 %40, 1
  %51 = icmp slt i32 %50, %3
  %52 = add nsw i32 %42, %34
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds float, float addrspace(1)* %1, i64 %53
  %55 = add nsw i32 %42, %35
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds float, float addrspace(1)* %1, i64 %56
  %58 = add nsw i32 %42, %36
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds float, float addrspace(1)* %1, i64 %59
  br label %61

61:                                               ; preds = %43, %114
  %62 = phi i32 [ 0, %43 ], [ %105, %114 ]
  %63 = mul nsw i32 %62, %19
  %64 = add nsw i32 %28, %63
  %65 = add nsw i32 %64, %41
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds float, float addrspace(1)* %6, i64 %66
  %68 = load float, float addrspace(1)* %67, align 4, !tbaa !9
  %69 = load float, float addrspace(1)* %45, align 4, !tbaa !9
  %70 = fmul contract float %68, %69
  %71 = fadd contract float %70, 0.000000e+00
  br i1 %46, label %72, label %77

72:                                               ; preds = %61
  %73 = add i32 %64, %40
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds float, float addrspace(1)* %6, i64 %74
  %76 = load float, float addrspace(1)* %75, align 4, !tbaa !9
  br label %77

77:                                               ; preds = %61, %72
  %78 = phi float [ %76, %72 ], [ %68, %61 ]
  %79 = load float, float addrspace(1)* %49, align 4, !tbaa !9
  %80 = fmul contract float %78, %79
  %81 = fadd contract float %71, %80
  br i1 %51, label %82, label %87

82:                                               ; preds = %77
  %83 = add nsw i32 %65, 2
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds float, float addrspace(1)* %6, i64 %84
  %86 = load float, float addrspace(1)* %85, align 4, !tbaa !9
  br label %87

87:                                               ; preds = %77, %82
  %88 = phi float [ %86, %82 ], [ %68, %77 ]
  %89 = load float, float addrspace(1)* %54, align 4, !tbaa !9
  %90 = fmul contract float %88, %89
  %91 = fadd contract float %81, %90
  %92 = icmp ne i32 %62, 0
  %93 = select i1 %46, i1 %92, i1 false
  br i1 %93, label %94, label %100

94:                                               ; preds = %87
  %95 = add i32 %64, %40
  %96 = sub i32 %95, %19
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds float, float addrspace(1)* %6, i64 %97
  %99 = load float, float addrspace(1)* %98, align 4, !tbaa !9
  br label %100

100:                                              ; preds = %87, %94
  %101 = phi float [ %99, %94 ], [ %68, %87 ]
  %102 = load float, float addrspace(1)* %57, align 4, !tbaa !9
  %103 = fmul contract float %101, %102
  %104 = fadd contract float %91, %103
  %105 = add nuw nsw i32 %62, 1
  %106 = icmp slt i32 %105, %4
  %107 = select i1 %46, i1 %106, i1 false
  br i1 %107, label %108, label %114

108:                                              ; preds = %100
  %109 = add i32 %64, %40
  %110 = add nsw i32 %109, %19
  %111 = sext i32 %110 to i64
  %112 = getelementptr inbounds float, float addrspace(1)* %6, i64 %111
  %113 = load float, float addrspace(1)* %112, align 4, !tbaa !9
  br label %114

114:                                              ; preds = %100, %108
  %115 = phi float [ %113, %108 ], [ %68, %100 ]
  %116 = load float, float addrspace(1)* %60, align 4, !tbaa !9
  %117 = fmul contract float %115, %116
  %118 = fadd contract float %104, %117
  store float %118, float addrspace(1)* %67, align 4, !tbaa !9
  %119 = icmp eq i32 %105, %4
  br i1 %119, label %37, label %61, !llvm.loop !13

120:                                              ; preds = %37, %18, %7
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
!7 = distinct !{!7, !8}
!8 = !{!"llvm.loop.mustprogress"}
!9 = !{!10, !10, i64 0}
!10 = !{!"float", !11, i64 0}
!11 = !{!"omnipotent char", !12, i64 0}
!12 = !{!"Simple C++ TBAA"}
!13 = distinct !{!13, !8}
