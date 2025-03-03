; ModuleID = '../data/hip_kernels/1187/10/main.cu'
source_filename = "../data/hip_kernels/1187/10/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z16sga_down_forwardiPKfiiiiPf(i32 %0, float addrspace(1)* nocapture readonly %1, i32 %2, i32 %3, i32 %4, i32 %5, float addrspace(1)* nocapture %6) local_unnamed_addr #0 {
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
  br i1 %17, label %18, label %119

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
  br i1 %28, label %29, label %119

29:                                               ; preds = %18
  %30 = icmp sgt i32 %4, 0
  %31 = shl nsw i32 %19, 1
  %32 = shl nsw i32 %3, 1
  %33 = add i32 %19, %3
  %34 = mul nsw i32 %19, 3
  %35 = sub i32 %19, %3
  %36 = shl nsw i32 %19, 2
  br label %37

37:                                               ; preds = %29, %60
  %38 = phi i32 [ 0, %29 ], [ %61, %60 ]
  %39 = mul nsw i32 %38, %3
  %40 = add i32 %39, %26
  %41 = add i32 %40, %27
  br i1 %30, label %42, label %60

42:                                               ; preds = %37
  %43 = add i32 %40, %24
  %44 = sext i32 %41 to i64
  %45 = getelementptr inbounds float, float addrspace(1)* %1, i64 %44
  %46 = icmp eq i32 %38, 0
  %47 = add nsw i32 %41, %19
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds float, float addrspace(1)* %1, i64 %48
  %50 = icmp ugt i32 %38, 1
  %51 = add nsw i32 %41, %31
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds float, float addrspace(1)* %1, i64 %52
  %54 = add nsw i32 %41, %34
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds float, float addrspace(1)* %1, i64 %55
  %57 = add nsw i32 %41, %36
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds float, float addrspace(1)* %1, i64 %58
  br label %63

60:                                               ; preds = %113, %37
  %61 = add nuw nsw i32 %38, 1
  %62 = icmp eq i32 %61, %2
  br i1 %62, label %119, label %37, !llvm.loop !7

63:                                               ; preds = %42, %113
  %64 = phi i32 [ 0, %42 ], [ %105, %113 ]
  %65 = mul nsw i32 %64, %19
  %66 = add i32 %43, %65
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds float, float addrspace(1)* %6, i64 %67
  %69 = load float, float addrspace(1)* %68, align 4, !tbaa !9
  %70 = load float, float addrspace(1)* %45, align 4, !tbaa !9
  %71 = fmul contract float %69, %70
  %72 = fadd contract float %71, 0.000000e+00
  br i1 %46, label %78, label %73

73:                                               ; preds = %63
  %74 = sub nsw i32 %66, %3
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds float, float addrspace(1)* %6, i64 %75
  %77 = load float, float addrspace(1)* %76, align 4, !tbaa !9
  br label %78

78:                                               ; preds = %63, %73
  %79 = phi float [ %77, %73 ], [ %69, %63 ]
  %80 = load float, float addrspace(1)* %49, align 4, !tbaa !9
  %81 = fmul contract float %79, %80
  %82 = fadd contract float %72, %81
  br i1 %50, label %83, label %88

83:                                               ; preds = %78
  %84 = sub nsw i32 %66, %32
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds float, float addrspace(1)* %6, i64 %85
  %87 = load float, float addrspace(1)* %86, align 4, !tbaa !9
  br label %88

88:                                               ; preds = %78, %83
  %89 = phi float [ %87, %83 ], [ %69, %78 ]
  %90 = load float, float addrspace(1)* %53, align 4, !tbaa !9
  %91 = fmul contract float %89, %90
  %92 = fadd contract float %82, %91
  %93 = icmp eq i32 %64, 0
  %94 = select i1 %46, i1 true, i1 %93
  br i1 %94, label %100, label %95

95:                                               ; preds = %88
  %96 = sub i32 %66, %33
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds float, float addrspace(1)* %6, i64 %97
  %99 = load float, float addrspace(1)* %98, align 4, !tbaa !9
  br label %100

100:                                              ; preds = %88, %95
  %101 = phi float [ %99, %95 ], [ %69, %88 ]
  %102 = load float, float addrspace(1)* %56, align 4, !tbaa !9
  %103 = fmul contract float %101, %102
  %104 = fadd contract float %92, %103
  %105 = add nuw nsw i32 %64, 1
  %106 = icmp sge i32 %105, %4
  %107 = select i1 %46, i1 true, i1 %106
  br i1 %107, label %113, label %108

108:                                              ; preds = %100
  %109 = add i32 %35, %66
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds float, float addrspace(1)* %6, i64 %110
  %112 = load float, float addrspace(1)* %111, align 4, !tbaa !9
  br label %113

113:                                              ; preds = %100, %108
  %114 = phi float [ %112, %108 ], [ %69, %100 ]
  %115 = load float, float addrspace(1)* %59, align 4, !tbaa !9
  %116 = fmul contract float %114, %115
  %117 = fadd contract float %104, %116
  store float %117, float addrspace(1)* %68, align 4, !tbaa !9
  %118 = icmp eq i32 %105, %4
  br i1 %118, label %60, label %63, !llvm.loop !13

119:                                              ; preds = %60, %18, %7
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
