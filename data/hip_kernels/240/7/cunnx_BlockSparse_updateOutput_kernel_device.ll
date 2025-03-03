; ModuleID = '../data/hip_kernels/240/7/main.cu'
source_filename = "../data/hip_kernels/240/7/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z37cunnx_BlockSparse_updateOutput_kernelPfPKfS1_S1_S1_iiii(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture readonly %4, i32 %5, i32 %6, i32 %7, i32 %8) local_unnamed_addr #0 {
  %10 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %11 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %12 = getelementptr i8, i8 addrspace(4)* %11, i64 4
  %13 = bitcast i8 addrspace(4)* %12 to i16 addrspace(4)*
  %14 = load i16, i16 addrspace(4)* %13, align 4, !range !5, !invariant.load !6
  %15 = zext i16 %14 to i32
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %17 = mul i32 %16, %8
  %18 = mul i32 %17, %5
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds float, float addrspace(1)* %0, i64 %19
  %21 = mul i32 %18, %7
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds float, float addrspace(1)* %1, i64 %22
  %24 = sext i32 %17 to i64
  %25 = getelementptr inbounds float, float addrspace(1)* %2, i64 %24
  %26 = getelementptr inbounds float, float addrspace(1)* %3, i64 %24
  %27 = icmp sgt i32 %8, 0
  br i1 %27, label %28, label %35

28:                                               ; preds = %9
  %29 = icmp slt i32 %10, %5
  %30 = icmp sgt i32 %7, 0
  %31 = and i32 %7, 7
  %32 = icmp ult i32 %7, 8
  %33 = and i32 %7, -8
  %34 = icmp eq i32 %31, 0
  br label %36

35:                                               ; preds = %48, %9
  ret void

36:                                               ; preds = %28, %48
  %37 = phi i32 [ 0, %28 ], [ %49, %48 ]
  %38 = zext i32 %37 to i64
  %39 = getelementptr inbounds float, float addrspace(1)* %26, i64 %38
  %40 = load float, float addrspace(1)* %39, align 4, !tbaa !7
  br i1 %29, label %41, label %48

41:                                               ; preds = %36
  %42 = getelementptr inbounds float, float addrspace(1)* %25, i64 %38
  %43 = load float, float addrspace(1)* %42, align 4, !tbaa !7
  %44 = fptosi float %43 to i32
  %45 = add nsw i32 %44, -1
  %46 = mul nsw i32 %45, %5
  %47 = mul nsw i32 %37, %5
  br label %51

48:                                               ; preds = %77, %36
  %49 = add nuw nsw i32 %37, 1
  %50 = icmp eq i32 %49, %8
  br i1 %50, label %35, label %36, !llvm.loop !11

51:                                               ; preds = %41, %77
  %52 = phi i32 [ %10, %41 ], [ %83, %77 ]
  %53 = add nsw i32 %52, %46
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds float, float addrspace(1)* %4, i64 %54
  %56 = load float, float addrspace(1)* %55, align 4, !tbaa !7
  br i1 %30, label %57, label %77

57:                                               ; preds = %51
  br i1 %32, label %58, label %85

58:                                               ; preds = %85, %57
  %59 = phi float [ undef, %57 ], [ %159, %85 ]
  %60 = phi float [ %56, %57 ], [ %159, %85 ]
  %61 = phi i32 [ 0, %57 ], [ %160, %85 ]
  br i1 %34, label %77, label %62

62:                                               ; preds = %58, %62
  %63 = phi float [ %73, %62 ], [ %60, %58 ]
  %64 = phi i32 [ %74, %62 ], [ %61, %58 ]
  %65 = phi i32 [ %75, %62 ], [ 0, %58 ]
  %66 = mul nsw i32 %64, %8
  %67 = add i32 %66, %37
  %68 = mul i32 %67, %5
  %69 = add nsw i32 %68, %52
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds float, float addrspace(1)* %23, i64 %70
  %72 = load float, float addrspace(1)* %71, align 4, !tbaa !7
  %73 = fadd contract float %72, %63
  %74 = add nuw nsw i32 %64, 1
  %75 = add i32 %65, 1
  %76 = icmp eq i32 %75, %31
  br i1 %76, label %77, label %62, !llvm.loop !13

77:                                               ; preds = %58, %62, %51
  %78 = phi float [ %56, %51 ], [ %59, %58 ], [ %73, %62 ]
  %79 = fmul contract float %40, %78
  %80 = add nsw i32 %52, %47
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds float, float addrspace(1)* %20, i64 %81
  store float %79, float addrspace(1)* %82, align 4, !tbaa !7
  %83 = add nuw nsw i32 %52, %15
  %84 = icmp slt i32 %83, %5
  br i1 %84, label %51, label %48, !llvm.loop !15

85:                                               ; preds = %57, %85
  %86 = phi float [ %159, %85 ], [ %56, %57 ]
  %87 = phi i32 [ %160, %85 ], [ 0, %57 ]
  %88 = phi i32 [ %161, %85 ], [ 0, %57 ]
  %89 = mul nsw i32 %87, %8
  %90 = add i32 %89, %37
  %91 = mul i32 %90, %5
  %92 = add nsw i32 %91, %52
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds float, float addrspace(1)* %23, i64 %93
  %95 = load float, float addrspace(1)* %94, align 4, !tbaa !7
  %96 = fadd contract float %95, %86
  %97 = or i32 %87, 1
  %98 = mul nsw i32 %97, %8
  %99 = add i32 %98, %37
  %100 = mul i32 %99, %5
  %101 = add nsw i32 %100, %52
  %102 = sext i32 %101 to i64
  %103 = getelementptr inbounds float, float addrspace(1)* %23, i64 %102
  %104 = load float, float addrspace(1)* %103, align 4, !tbaa !7
  %105 = fadd contract float %104, %96
  %106 = or i32 %87, 2
  %107 = mul nsw i32 %106, %8
  %108 = add i32 %107, %37
  %109 = mul i32 %108, %5
  %110 = add nsw i32 %109, %52
  %111 = sext i32 %110 to i64
  %112 = getelementptr inbounds float, float addrspace(1)* %23, i64 %111
  %113 = load float, float addrspace(1)* %112, align 4, !tbaa !7
  %114 = fadd contract float %113, %105
  %115 = or i32 %87, 3
  %116 = mul nsw i32 %115, %8
  %117 = add i32 %116, %37
  %118 = mul i32 %117, %5
  %119 = add nsw i32 %118, %52
  %120 = sext i32 %119 to i64
  %121 = getelementptr inbounds float, float addrspace(1)* %23, i64 %120
  %122 = load float, float addrspace(1)* %121, align 4, !tbaa !7
  %123 = fadd contract float %122, %114
  %124 = or i32 %87, 4
  %125 = mul nsw i32 %124, %8
  %126 = add i32 %125, %37
  %127 = mul i32 %126, %5
  %128 = add nsw i32 %127, %52
  %129 = sext i32 %128 to i64
  %130 = getelementptr inbounds float, float addrspace(1)* %23, i64 %129
  %131 = load float, float addrspace(1)* %130, align 4, !tbaa !7
  %132 = fadd contract float %131, %123
  %133 = or i32 %87, 5
  %134 = mul nsw i32 %133, %8
  %135 = add i32 %134, %37
  %136 = mul i32 %135, %5
  %137 = add nsw i32 %136, %52
  %138 = sext i32 %137 to i64
  %139 = getelementptr inbounds float, float addrspace(1)* %23, i64 %138
  %140 = load float, float addrspace(1)* %139, align 4, !tbaa !7
  %141 = fadd contract float %140, %132
  %142 = or i32 %87, 6
  %143 = mul nsw i32 %142, %8
  %144 = add i32 %143, %37
  %145 = mul i32 %144, %5
  %146 = add nsw i32 %145, %52
  %147 = sext i32 %146 to i64
  %148 = getelementptr inbounds float, float addrspace(1)* %23, i64 %147
  %149 = load float, float addrspace(1)* %148, align 4, !tbaa !7
  %150 = fadd contract float %149, %141
  %151 = or i32 %87, 7
  %152 = mul nsw i32 %151, %8
  %153 = add i32 %152, %37
  %154 = mul i32 %153, %5
  %155 = add nsw i32 %154, %52
  %156 = sext i32 %155 to i64
  %157 = getelementptr inbounds float, float addrspace(1)* %23, i64 %156
  %158 = load float, float addrspace(1)* %157, align 4, !tbaa !7
  %159 = fadd contract float %158, %150
  %160 = add nuw nsw i32 %87, 8
  %161 = add i32 %88, 8
  %162 = icmp eq i32 %161, %33
  br i1 %162, label %58, label %85, !llvm.loop !16
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}
!15 = distinct !{!15, !12}
!16 = distinct !{!16, !12}
