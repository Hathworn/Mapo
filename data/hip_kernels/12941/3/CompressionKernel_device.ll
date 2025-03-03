; ModuleID = '../data/hip_kernels/12941/3/main.cu'
source_filename = "../data/hip_kernels/12941/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ17CompressionKerneliPyPhPiS1_E5ibufs = internal unnamed_addr addrspace(3) global [1536 x i32] undef, align 16

; Function Attrs: mustprogress nofree norecurse nounwind
define protected amdgpu_kernel void @_Z17CompressionKerneliPyPhPiS1_(i32 %0, i64 addrspace(1)* nocapture readonly %1, i8 addrspace(1)* nocapture writeonly %2, i32 addrspace(1)* nocapture readonly %3, i32 addrspace(1)* nocapture writeonly %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = and i32 %6, 31
  %8 = lshr i32 %6, 5
  %9 = mul nuw nsw i32 %8, 48
  %10 = add nuw nsw i32 %9, %7
  %11 = getelementptr inbounds [1536 x i32], [1536 x i32] addrspace(3)* @_ZZ17CompressionKerneliPyPhPiS1_E5ibufs, i32 0, i32 %10
  store i32 0, i32 addrspace(3)* %11, align 4, !tbaa !5
  %12 = add nuw nsw i32 %10, 16
  %13 = add nuw nsw i32 %9, 47
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %15 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %16 = getelementptr i8, i8 addrspace(4)* %15, i64 4
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = load i16, i16 addrspace(4)* %17, align 4, !range !9, !invariant.load !10
  %19 = zext i16 %18 to i32
  %20 = mul i32 %14, %19
  %21 = add i32 %20, %6
  %22 = lshr i32 %21, 5
  %23 = srem i32 %7, %0
  %24 = icmp ult i32 %21, 32
  br i1 %24, label %30, label %25

25:                                               ; preds = %5
  %26 = add nsw i32 %22, -1
  %27 = zext i32 %26 to i64
  %28 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %27
  %29 = load i32, i32 addrspace(1)* %28, align 4, !tbaa !5, !amdgpu.noclobber !10
  br label %30

30:                                               ; preds = %25, %5
  %31 = phi i32 [ %29, %25 ], [ 0, %5 ]
  %32 = zext i32 %22 to i64
  %33 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %32
  %34 = load i32, i32 addrspace(1)* %33, align 4, !tbaa !5, !amdgpu.noclobber !10
  %35 = add nsw i32 %31, 1
  %36 = sdiv i32 %35, 2
  %37 = mul nsw i32 %36, 17
  %38 = add nsw i32 %31, %7
  %39 = icmp slt i32 %38, %34
  br i1 %39, label %40, label %55

40:                                               ; preds = %30
  %41 = getelementptr inbounds [1536 x i32], [1536 x i32] addrspace(3)* @_ZZ17CompressionKerneliPyPhPiS1_E5ibufs, i32 0, i32 %12
  %42 = add nuw nsw i32 %10, 15
  %43 = getelementptr inbounds [1536 x i32], [1536 x i32] addrspace(3)* @_ZZ17CompressionKerneliPyPhPiS1_E5ibufs, i32 0, i32 %42
  %44 = add nuw nsw i32 %10, 14
  %45 = getelementptr inbounds [1536 x i32], [1536 x i32] addrspace(3)* @_ZZ17CompressionKerneliPyPhPiS1_E5ibufs, i32 0, i32 %44
  %46 = add nuw nsw i32 %10, 12
  %47 = getelementptr inbounds [1536 x i32], [1536 x i32] addrspace(3)* @_ZZ17CompressionKerneliPyPhPiS1_E5ibufs, i32 0, i32 %46
  %48 = add nuw nsw i32 %10, 8
  %49 = getelementptr inbounds [1536 x i32], [1536 x i32] addrspace(3)* @_ZZ17CompressionKerneliPyPhPiS1_E5ibufs, i32 0, i32 %48
  %50 = getelementptr inbounds [1536 x i32], [1536 x i32] addrspace(3)* @_ZZ17CompressionKerneliPyPhPiS1_E5ibufs, i32 0, i32 %13
  %51 = and i32 %6, 1
  %52 = icmp eq i32 %51, 0
  %53 = lshr i32 %7, 1
  %54 = add i32 %7, %0
  br label %58

55:                                               ; preds = %121, %30
  %56 = phi i32 [ %37, %30 ], [ %122, %121 ]
  %57 = icmp eq i32 %7, 31
  br i1 %57, label %130, label %132

58:                                               ; preds = %40, %121
  %59 = phi i32 [ %38, %40 ], [ %123, %121 ]
  %60 = phi i64 [ 0, %40 ], [ %128, %121 ]
  %61 = phi i32 [ %37, %40 ], [ %122, %121 ]
  %62 = sext i32 %59 to i64
  %63 = getelementptr inbounds i64, i64 addrspace(1)* %1, i64 %62
  %64 = load i64, i64 addrspace(1)* %63, align 8, !tbaa !11
  %65 = sub i64 %64, %60
  %66 = lshr i64 %65, 60
  %67 = trunc i64 %66 to i32
  %68 = and i32 %67, 8
  %69 = icmp eq i32 %68, 0
  %70 = sub i64 0, %65
  %71 = select i1 %69, i64 %65, i64 %70
  %72 = tail call i64 @llvm.ctlz.i64(i64 %71, i1 false), !range !13
  %73 = trunc i64 %72 to i32
  %74 = lshr i32 %73, 3
  %75 = sub nuw nsw i32 8, %74
  %76 = icmp eq i32 %74, 6
  %77 = select i1 %76, i32 3, i32 %75
  store i32 %77, i32 addrspace(3)* %41, align 4, !tbaa !5
  fence syncscope("workgroup") seq_cst
  %78 = load i32, i32 addrspace(3)* %43, align 4, !tbaa !5
  %79 = load i32, i32 addrspace(3)* %41, align 4, !tbaa !5
  %80 = add nsw i32 %79, %78
  store i32 %80, i32 addrspace(3)* %41, align 4, !tbaa !5
  fence syncscope("workgroup") seq_cst
  %81 = load i32, i32 addrspace(3)* %45, align 4, !tbaa !5
  %82 = load i32, i32 addrspace(3)* %41, align 4, !tbaa !5
  %83 = add nsw i32 %82, %81
  store i32 %83, i32 addrspace(3)* %41, align 4, !tbaa !5
  fence syncscope("workgroup") seq_cst
  %84 = load i32, i32 addrspace(3)* %47, align 4, !tbaa !5
  %85 = load i32, i32 addrspace(3)* %41, align 4, !tbaa !5
  %86 = add nsw i32 %85, %84
  store i32 %86, i32 addrspace(3)* %41, align 4, !tbaa !5
  fence syncscope("workgroup") seq_cst
  %87 = load i32, i32 addrspace(3)* %49, align 4, !tbaa !5
  %88 = load i32, i32 addrspace(3)* %41, align 4, !tbaa !5
  %89 = add nsw i32 %88, %87
  store i32 %89, i32 addrspace(3)* %41, align 4, !tbaa !5
  fence syncscope("workgroup") seq_cst
  %90 = load i32, i32 addrspace(3)* %11, align 4, !tbaa !5
  %91 = load i32, i32 addrspace(3)* %41, align 4, !tbaa !5
  %92 = add nsw i32 %91, %90
  store i32 %92, i32 addrspace(3)* %41, align 4, !tbaa !5
  fence syncscope("workgroup") seq_cst
  %93 = add i32 %61, 16
  %94 = load i32, i32 addrspace(3)* %43, align 4, !tbaa !5
  %95 = add nsw i32 %93, %94
  %96 = add nsw i32 %95, %77
  %97 = icmp eq i32 %77, 0
  br i1 %97, label %107, label %98

98:                                               ; preds = %58, %98
  %99 = phi i64 [ %104, %98 ], [ %71, %58 ]
  %100 = phi i32 [ %105, %98 ], [ %95, %58 ]
  %101 = trunc i64 %99 to i8
  %102 = sext i32 %100 to i64
  %103 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %102
  store i8 %101, i8 addrspace(1)* %103, align 1, !tbaa !14
  %104 = lshr i64 %99, 8
  %105 = add nsw i32 %100, 1
  %106 = icmp slt i32 %105, %96
  br i1 %106, label %98, label %107, !llvm.loop !15

107:                                              ; preds = %98, %58
  %108 = icmp sgt i32 %77, 2
  %109 = sext i1 %108 to i32
  %110 = add nsw i32 %77, %109
  %111 = load i32, i32 addrspace(3)* %50, align 4, !tbaa !5
  %112 = or i32 %110, %68
  store i32 %112, i32 addrspace(3)* %41, align 4, !tbaa !5
  fence syncscope("workgroup") seq_cst
  br i1 %52, label %121, label %113

113:                                              ; preds = %107
  %114 = load i32, i32 addrspace(3)* %43, align 4, !tbaa !5
  %115 = shl i32 %112, 4
  %116 = or i32 %114, %115
  %117 = trunc i32 %116 to i8
  %118 = add nsw i32 %61, %53
  %119 = sext i32 %118 to i64
  %120 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %119
  store i8 %117, i8 addrspace(1)* %120, align 1, !tbaa !14
  br label %121

121:                                              ; preds = %113, %107
  %122 = add i32 %93, %111
  %123 = add i32 %59, 32
  %124 = sub i32 %123, %54
  %125 = add i32 %124, %23
  %126 = sext i32 %125 to i64
  %127 = getelementptr inbounds i64, i64 addrspace(1)* %1, i64 %126
  %128 = load i64, i64 addrspace(1)* %127, align 8, !tbaa !11
  %129 = icmp slt i32 %123, %34
  br i1 %129, label %58, label %55, !llvm.loop !17

130:                                              ; preds = %55
  %131 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %32
  store i32 %56, i32 addrspace(1)* %131, align 4, !tbaa !5
  br label %132

132:                                              ; preds = %130, %55
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.ctlz.i64(i64, i1 immarg) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { mustprogress nofree norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"int", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{i16 1, i16 1025}
!10 = !{}
!11 = !{!12, !12, i64 0}
!12 = !{!"long long", !7, i64 0}
!13 = !{i64 0, i64 65}
!14 = !{!7, !7, i64 0}
!15 = distinct !{!15, !16}
!16 = !{!"llvm.loop.mustprogress"}
!17 = distinct !{!17, !16}
