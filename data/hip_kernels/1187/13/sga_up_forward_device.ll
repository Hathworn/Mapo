; ModuleID = '../data/hip_kernels/1187/13/main.cu'
source_filename = "../data/hip_kernels/1187/13/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z14sga_up_forwardiPKfiiiiPf(i32 %0, float addrspace(1)* nocapture readonly %1, i32 %2, i32 %3, i32 %4, i32 %5, float addrspace(1)* nocapture %6) local_unnamed_addr #0 {
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
  %21 = freeze i32 %3
  %22 = sdiv i32 %20, %21
  %23 = mul nsw i32 %22, %19
  %24 = mul nsw i32 %23, %4
  %25 = mul i32 %22, %21
  %26 = sub i32 %20, %25
  %27 = mul nsw i32 %23, %5
  %28 = icmp sgt i32 %2, 0
  br i1 %28, label %29, label %120

29:                                               ; preds = %18
  %30 = icmp sgt i32 %4, 0
  %31 = shl nsw i32 %19, 1
  %32 = shl nsw i32 %3, 1
  %33 = mul nsw i32 %19, 3
  %34 = shl nsw i32 %19, 2
  br label %37

35:                                               ; preds = %114, %37
  %36 = icmp sgt i32 %38, 1
  br i1 %36, label %37, label %120, !llvm.loop !7

37:                                               ; preds = %29, %35
  %38 = phi i32 [ %2, %29 ], [ %39, %35 ]
  %39 = add nsw i32 %38, -1
  %40 = mul nsw i32 %39, %3
  %41 = add i32 %40, %26
  %42 = add i32 %41, %27
  br i1 %30, label %43, label %35

43:                                               ; preds = %37
  %44 = add i32 %41, %24
  %45 = sext i32 %42 to i64
  %46 = getelementptr inbounds float, float addrspace(1)* %1, i64 %45
  %47 = icmp slt i32 %38, %2
  %48 = add nsw i32 %42, %19
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds float, float addrspace(1)* %1, i64 %49
  %51 = add nuw nsw i32 %38, 1
  %52 = icmp slt i32 %51, %2
  %53 = add nsw i32 %42, %31
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds float, float addrspace(1)* %1, i64 %54
  %56 = add nsw i32 %42, %33
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds float, float addrspace(1)* %1, i64 %57
  %59 = add nsw i32 %42, %34
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds float, float addrspace(1)* %1, i64 %60
  br label %62

62:                                               ; preds = %43, %114
  %63 = phi i32 [ 0, %43 ], [ %105, %114 ]
  %64 = mul nsw i32 %63, %19
  %65 = add i32 %44, %64
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds float, float addrspace(1)* %6, i64 %66
  %68 = load float, float addrspace(1)* %67, align 4, !tbaa !9
  %69 = load float, float addrspace(1)* %46, align 4, !tbaa !9
  %70 = fmul contract float %68, %69
  %71 = fadd contract float %70, 0.000000e+00
  br i1 %47, label %72, label %77

72:                                               ; preds = %62
  %73 = add nsw i32 %65, %3
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds float, float addrspace(1)* %6, i64 %74
  %76 = load float, float addrspace(1)* %75, align 4, !tbaa !9
  br label %77

77:                                               ; preds = %62, %72
  %78 = phi float [ %76, %72 ], [ %68, %62 ]
  %79 = load float, float addrspace(1)* %50, align 4, !tbaa !9
  %80 = fmul contract float %78, %79
  %81 = fadd contract float %71, %80
  br i1 %52, label %82, label %87

82:                                               ; preds = %77
  %83 = add nsw i32 %65, %32
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds float, float addrspace(1)* %6, i64 %84
  %86 = load float, float addrspace(1)* %85, align 4, !tbaa !9
  br label %87

87:                                               ; preds = %77, %82
  %88 = phi float [ %86, %82 ], [ %68, %77 ]
  %89 = load float, float addrspace(1)* %55, align 4, !tbaa !9
  %90 = fmul contract float %88, %89
  %91 = fadd contract float %81, %90
  %92 = icmp ne i32 %63, 0
  %93 = select i1 %47, i1 %92, i1 false
  br i1 %93, label %94, label %100

94:                                               ; preds = %87
  %95 = add nsw i32 %65, %3
  %96 = sub i32 %95, %19
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds float, float addrspace(1)* %6, i64 %97
  %99 = load float, float addrspace(1)* %98, align 4, !tbaa !9
  br label %100

100:                                              ; preds = %87, %94
  %101 = phi float [ %99, %94 ], [ %68, %87 ]
  %102 = load float, float addrspace(1)* %58, align 4, !tbaa !9
  %103 = fmul contract float %101, %102
  %104 = fadd contract float %91, %103
  %105 = add nuw nsw i32 %63, 1
  %106 = icmp slt i32 %105, %4
  %107 = select i1 %47, i1 %106, i1 false
  br i1 %107, label %108, label %114

108:                                              ; preds = %100
  %109 = add nsw i32 %65, %3
  %110 = add nsw i32 %109, %19
  %111 = sext i32 %110 to i64
  %112 = getelementptr inbounds float, float addrspace(1)* %6, i64 %111
  %113 = load float, float addrspace(1)* %112, align 4, !tbaa !9
  br label %114

114:                                              ; preds = %100, %108
  %115 = phi float [ %113, %108 ], [ %68, %100 ]
  %116 = load float, float addrspace(1)* %61, align 4, !tbaa !9
  %117 = fmul contract float %115, %116
  %118 = fadd contract float %104, %117
  store float %118, float addrspace(1)* %67, align 4, !tbaa !9
  %119 = icmp eq i32 %105, %4
  br i1 %119, label %35, label %62, !llvm.loop !13

120:                                              ; preds = %35, %18, %7
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
