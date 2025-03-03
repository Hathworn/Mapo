; ModuleID = '../data/hip_kernels/1574/35/main.cu'
source_filename = "../data/hip_kernels/1574/35/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z12count_spikesPKdPKiPi(double addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture %2) local_unnamed_addr #0 {
  %4 = load double, double addrspace(1)* %0, align 8, !tbaa !4, !amdgpu.noclobber !8
  %5 = fptosi double %4 to i32
  %6 = getelementptr inbounds double, double addrspace(1)* %0, i64 2
  %7 = load double, double addrspace(1)* %6, align 8, !tbaa !4, !amdgpu.noclobber !8
  %8 = fptosi double %7 to i32
  %9 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !9
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %12 = getelementptr i8, i8 addrspace(4)* %11, i64 4
  %13 = bitcast i8 addrspace(4)* %12 to i16 addrspace(4)*
  %14 = load i16, i16 addrspace(4)* %13, align 4, !range !10, !invariant.load !8
  %15 = zext i16 %14 to i32
  %16 = getelementptr inbounds i8, i8 addrspace(4)* %11, i64 12
  %17 = bitcast i8 addrspace(4)* %16 to i32 addrspace(4)*
  %18 = load i32, i32 addrspace(4)* %17, align 4, !tbaa !11
  %19 = mul i32 %10, %15
  %20 = udiv i32 %18, %15
  %21 = add nsw i32 %19, %9
  %22 = icmp slt i32 %21, %8
  br i1 %22, label %23, label %135

23:                                               ; preds = %3
  %24 = mul i32 %20, %15
  %25 = icmp ugt i32 %18, %24
  %26 = zext i1 %25 to i32
  %27 = add i32 %20, %26
  %28 = icmp sgt i32 %5, 0
  %29 = mul nsw i32 %27, %15
  %30 = and i32 %5, 7
  %31 = icmp ult i32 %5, 8
  %32 = and i32 %5, -8
  %33 = icmp eq i32 %30, 0
  br label %34

34:                                               ; preds = %23, %132
  %35 = phi i32 [ %21, %23 ], [ %133, %132 ]
  br i1 %28, label %36, label %132

36:                                               ; preds = %34
  %37 = sext i32 %35 to i64
  %38 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %37
  br i1 %31, label %116, label %39

39:                                               ; preds = %36, %112
  %40 = phi i32 [ %113, %112 ], [ 0, %36 ]
  %41 = phi i32 [ %114, %112 ], [ 0, %36 ]
  %42 = zext i32 %40 to i64
  %43 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %42
  %44 = load i32, i32 addrspace(1)* %43, align 4, !tbaa !20
  %45 = icmp eq i32 %44, %35
  br i1 %45, label %46, label %49

46:                                               ; preds = %39
  %47 = load i32, i32 addrspace(1)* %38, align 4, !tbaa !20
  %48 = add nsw i32 %47, 1
  store i32 %48, i32 addrspace(1)* %38, align 4, !tbaa !20
  br label %49

49:                                               ; preds = %39, %46
  %50 = or i32 %40, 1
  %51 = zext i32 %50 to i64
  %52 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %51
  %53 = load i32, i32 addrspace(1)* %52, align 4, !tbaa !20
  %54 = icmp eq i32 %53, %35
  br i1 %54, label %55, label %58

55:                                               ; preds = %49
  %56 = load i32, i32 addrspace(1)* %38, align 4, !tbaa !20
  %57 = add nsw i32 %56, 1
  store i32 %57, i32 addrspace(1)* %38, align 4, !tbaa !20
  br label %58

58:                                               ; preds = %55, %49
  %59 = or i32 %40, 2
  %60 = zext i32 %59 to i64
  %61 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %60
  %62 = load i32, i32 addrspace(1)* %61, align 4, !tbaa !20
  %63 = icmp eq i32 %62, %35
  br i1 %63, label %64, label %67

64:                                               ; preds = %58
  %65 = load i32, i32 addrspace(1)* %38, align 4, !tbaa !20
  %66 = add nsw i32 %65, 1
  store i32 %66, i32 addrspace(1)* %38, align 4, !tbaa !20
  br label %67

67:                                               ; preds = %64, %58
  %68 = or i32 %40, 3
  %69 = zext i32 %68 to i64
  %70 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %69
  %71 = load i32, i32 addrspace(1)* %70, align 4, !tbaa !20
  %72 = icmp eq i32 %71, %35
  br i1 %72, label %73, label %76

73:                                               ; preds = %67
  %74 = load i32, i32 addrspace(1)* %38, align 4, !tbaa !20
  %75 = add nsw i32 %74, 1
  store i32 %75, i32 addrspace(1)* %38, align 4, !tbaa !20
  br label %76

76:                                               ; preds = %73, %67
  %77 = or i32 %40, 4
  %78 = zext i32 %77 to i64
  %79 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %78
  %80 = load i32, i32 addrspace(1)* %79, align 4, !tbaa !20
  %81 = icmp eq i32 %80, %35
  br i1 %81, label %82, label %85

82:                                               ; preds = %76
  %83 = load i32, i32 addrspace(1)* %38, align 4, !tbaa !20
  %84 = add nsw i32 %83, 1
  store i32 %84, i32 addrspace(1)* %38, align 4, !tbaa !20
  br label %85

85:                                               ; preds = %82, %76
  %86 = or i32 %40, 5
  %87 = zext i32 %86 to i64
  %88 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %87
  %89 = load i32, i32 addrspace(1)* %88, align 4, !tbaa !20
  %90 = icmp eq i32 %89, %35
  br i1 %90, label %91, label %94

91:                                               ; preds = %85
  %92 = load i32, i32 addrspace(1)* %38, align 4, !tbaa !20
  %93 = add nsw i32 %92, 1
  store i32 %93, i32 addrspace(1)* %38, align 4, !tbaa !20
  br label %94

94:                                               ; preds = %91, %85
  %95 = or i32 %40, 6
  %96 = zext i32 %95 to i64
  %97 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %96
  %98 = load i32, i32 addrspace(1)* %97, align 4, !tbaa !20
  %99 = icmp eq i32 %98, %35
  br i1 %99, label %100, label %103

100:                                              ; preds = %94
  %101 = load i32, i32 addrspace(1)* %38, align 4, !tbaa !20
  %102 = add nsw i32 %101, 1
  store i32 %102, i32 addrspace(1)* %38, align 4, !tbaa !20
  br label %103

103:                                              ; preds = %100, %94
  %104 = or i32 %40, 7
  %105 = zext i32 %104 to i64
  %106 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %105
  %107 = load i32, i32 addrspace(1)* %106, align 4, !tbaa !20
  %108 = icmp eq i32 %107, %35
  br i1 %108, label %109, label %112

109:                                              ; preds = %103
  %110 = load i32, i32 addrspace(1)* %38, align 4, !tbaa !20
  %111 = add nsw i32 %110, 1
  store i32 %111, i32 addrspace(1)* %38, align 4, !tbaa !20
  br label %112

112:                                              ; preds = %109, %103
  %113 = add nuw nsw i32 %40, 8
  %114 = add i32 %41, 8
  %115 = icmp eq i32 %114, %32
  br i1 %115, label %116, label %39, !llvm.loop !22

116:                                              ; preds = %112, %36
  %117 = phi i32 [ 0, %36 ], [ %113, %112 ]
  br i1 %33, label %132, label %118

118:                                              ; preds = %116, %128
  %119 = phi i32 [ %129, %128 ], [ %117, %116 ]
  %120 = phi i32 [ %130, %128 ], [ 0, %116 ]
  %121 = zext i32 %119 to i64
  %122 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %121
  %123 = load i32, i32 addrspace(1)* %122, align 4, !tbaa !20
  %124 = icmp eq i32 %123, %35
  br i1 %124, label %125, label %128

125:                                              ; preds = %118
  %126 = load i32, i32 addrspace(1)* %38, align 4, !tbaa !20
  %127 = add nsw i32 %126, 1
  store i32 %127, i32 addrspace(1)* %38, align 4, !tbaa !20
  br label %128

128:                                              ; preds = %125, %118
  %129 = add nuw nsw i32 %119, 1
  %130 = add i32 %120, 1
  %131 = icmp eq i32 %130, %30
  br i1 %131, label %132, label %118, !llvm.loop !24

132:                                              ; preds = %116, %128, %34
  %133 = add nsw i32 %35, %29
  %134 = icmp slt i32 %133, %8
  br i1 %134, label %34, label %135, !llvm.loop !26

135:                                              ; preds = %132, %3
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

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
!4 = !{!5, !5, i64 0}
!5 = !{!"double", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{}
!9 = !{i32 0, i32 1024}
!10 = !{i16 1, i16 1025}
!11 = !{!12, !16, i64 12}
!12 = !{!"hsa_kernel_dispatch_packet_s", !13, i64 0, !13, i64 2, !13, i64 4, !13, i64 6, !13, i64 8, !13, i64 10, !16, i64 12, !16, i64 16, !16, i64 20, !16, i64 24, !16, i64 28, !17, i64 32, !18, i64 40, !17, i64 48, !19, i64 56}
!13 = !{!"short", !14, i64 0}
!14 = !{!"omnipotent char", !15, i64 0}
!15 = !{!"Simple C/C++ TBAA"}
!16 = !{!"int", !14, i64 0}
!17 = !{!"long", !14, i64 0}
!18 = !{!"any pointer", !14, i64 0}
!19 = !{!"hsa_signal_s", !17, i64 0}
!20 = !{!21, !21, i64 0}
!21 = !{!"int", !6, i64 0}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.mustprogress"}
!24 = distinct !{!24, !25}
!25 = !{!"llvm.loop.unroll.disable"}
!26 = distinct !{!26, !23}
