; ModuleID = '../data/hip_kernels/1187/16/main.cu'
source_filename = "../data/hip_kernels/1187/16/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z17sga_right_forwardiPKfiiiiPf(i32 %0, float addrspace(1)* nocapture readonly %1, i32 %2, i32 %3, i32 %4, i32 %5, float addrspace(1)* nocapture %6) local_unnamed_addr #0 {
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
  br i1 %17, label %18, label %118

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
  %28 = mul nsw i32 %23, %5
  %29 = icmp sgt i32 %3, 0
  br i1 %29, label %30, label %118

30:                                               ; preds = %18
  %31 = icmp sgt i32 %4, 0
  %32 = shl nsw i32 %19, 1
  %33 = mul nsw i32 %19, 3
  %34 = shl nsw i32 %19, 2
  br label %35

35:                                               ; preds = %30, %57
  %36 = phi i32 [ 0, %30 ], [ %58, %57 ]
  %37 = add i32 %36, %27
  %38 = add i32 %37, %28
  br i1 %31, label %39, label %57

39:                                               ; preds = %35
  %40 = add i32 %37, %24
  %41 = sext i32 %38 to i64
  %42 = getelementptr inbounds float, float addrspace(1)* %1, i64 %41
  %43 = icmp eq i32 %36, 0
  %44 = add nsw i32 %38, %19
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds float, float addrspace(1)* %1, i64 %45
  %47 = icmp ugt i32 %36, 1
  %48 = add nsw i32 %38, %32
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds float, float addrspace(1)* %1, i64 %49
  %51 = add nsw i32 %38, %33
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds float, float addrspace(1)* %1, i64 %52
  %54 = add nsw i32 %38, %34
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds float, float addrspace(1)* %1, i64 %55
  br label %60

57:                                               ; preds = %112, %35
  %58 = add nuw nsw i32 %36, 1
  %59 = icmp eq i32 %58, %3
  br i1 %59, label %118, label %35, !llvm.loop !7

60:                                               ; preds = %39, %112
  %61 = phi i32 [ 0, %39 ], [ %103, %112 ]
  %62 = mul nsw i32 %61, %19
  %63 = add i32 %40, %62
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds float, float addrspace(1)* %6, i64 %64
  %66 = load float, float addrspace(1)* %65, align 4, !tbaa !9
  %67 = load float, float addrspace(1)* %42, align 4, !tbaa !9
  %68 = fmul contract float %66, %67
  %69 = fadd contract float %68, 0.000000e+00
  br i1 %43, label %75, label %70

70:                                               ; preds = %60
  %71 = add nsw i32 %63, -1
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds float, float addrspace(1)* %6, i64 %72
  %74 = load float, float addrspace(1)* %73, align 4, !tbaa !9
  br label %75

75:                                               ; preds = %60, %70
  %76 = phi float [ %74, %70 ], [ %66, %60 ]
  %77 = load float, float addrspace(1)* %46, align 4, !tbaa !9
  %78 = fmul contract float %76, %77
  %79 = fadd contract float %69, %78
  br i1 %47, label %80, label %85

80:                                               ; preds = %75
  %81 = add nsw i32 %63, -2
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds float, float addrspace(1)* %6, i64 %82
  %84 = load float, float addrspace(1)* %83, align 4, !tbaa !9
  br label %85

85:                                               ; preds = %75, %80
  %86 = phi float [ %84, %80 ], [ %66, %75 ]
  %87 = load float, float addrspace(1)* %50, align 4, !tbaa !9
  %88 = fmul contract float %86, %87
  %89 = fadd contract float %79, %88
  %90 = icmp eq i32 %61, 0
  %91 = select i1 %43, i1 true, i1 %90
  br i1 %91, label %98, label %92

92:                                               ; preds = %85
  %93 = sub i32 %63, %19
  %94 = add nsw i32 %93, -1
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds float, float addrspace(1)* %6, i64 %95
  %97 = load float, float addrspace(1)* %96, align 4, !tbaa !9
  br label %98

98:                                               ; preds = %85, %92
  %99 = phi float [ %97, %92 ], [ %66, %85 ]
  %100 = load float, float addrspace(1)* %53, align 4, !tbaa !9
  %101 = fmul contract float %99, %100
  %102 = fadd contract float %89, %101
  %103 = add nuw nsw i32 %61, 1
  %104 = icmp sge i32 %103, %4
  %105 = select i1 %43, i1 true, i1 %104
  br i1 %105, label %112, label %106

106:                                              ; preds = %98
  %107 = add nsw i32 %63, -1
  %108 = add nsw i32 %107, %19
  %109 = sext i32 %108 to i64
  %110 = getelementptr inbounds float, float addrspace(1)* %6, i64 %109
  %111 = load float, float addrspace(1)* %110, align 4, !tbaa !9
  br label %112

112:                                              ; preds = %98, %106
  %113 = phi float [ %111, %106 ], [ %66, %98 ]
  %114 = load float, float addrspace(1)* %56, align 4, !tbaa !9
  %115 = fmul contract float %113, %114
  %116 = fadd contract float %102, %115
  store float %116, float addrspace(1)* %65, align 4, !tbaa !9
  %117 = icmp eq i32 %103, %4
  br i1 %117, label %57, label %60, !llvm.loop !13

118:                                              ; preds = %57, %18, %7
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
