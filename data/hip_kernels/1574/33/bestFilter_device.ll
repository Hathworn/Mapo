; ModuleID = '../data/hip_kernels/1574/33/main.cu'
source_filename = "../data/hip_kernels/1574/33/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z10bestFilterPKdPKbPKfPi(double addrspace(1)* nocapture readonly %0, i8 addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, i32 addrspace(1)* nocapture writeonly %3) local_unnamed_addr #0 {
  %5 = load double, double addrspace(1)* %0, align 8, !tbaa !4, !amdgpu.noclobber !8
  %6 = fptosi double %5 to i32
  %7 = getelementptr inbounds double, double addrspace(1)* %0, i64 2
  %8 = load double, double addrspace(1)* %7, align 8, !tbaa !4, !amdgpu.noclobber !8
  %9 = fptosi double %8 to i32
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !9, !invariant.load !8
  %14 = zext i16 %13 to i32
  %15 = getelementptr inbounds i8, i8 addrspace(4)* %10, i64 12
  %16 = bitcast i8 addrspace(4)* %15 to i32 addrspace(4)*
  %17 = load i32, i32 addrspace(4)* %16, align 4, !tbaa !10
  %18 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %19 = mul i32 %18, %14
  %20 = udiv i32 %17, %14
  %21 = getelementptr inbounds double, double addrspace(1)* %0, i64 7
  %22 = load double, double addrspace(1)* %21, align 8, !tbaa !4, !amdgpu.noclobber !8
  %23 = fptrunc double %22 to float
  %24 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !19
  %25 = add nsw i32 %19, %24
  %26 = icmp slt i32 %25, %6
  br i1 %26, label %27, label %137

27:                                               ; preds = %4
  %28 = mul i32 %20, %14
  %29 = icmp ugt i32 %17, %28
  %30 = zext i1 %29 to i32
  %31 = add i32 %20, %30
  %32 = icmp sgt i32 %9, 0
  %33 = fmul contract float %23, %23
  %34 = mul nsw i32 %31, %14
  %35 = and i32 %9, 3
  %36 = icmp ult i32 %9, 4
  %37 = and i32 %9, -4
  %38 = icmp eq i32 %35, 0
  br label %39

39:                                               ; preds = %27, %134
  %40 = phi i32 [ %25, %27 ], [ %135, %134 ]
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %41
  store i32 0, i32 addrspace(1)* %42, align 4, !tbaa !20
  br i1 %32, label %43, label %130

43:                                               ; preds = %39
  br i1 %36, label %106, label %44

44:                                               ; preds = %43, %101
  %45 = phi float [ %102, %101 ], [ 0.000000e+00, %43 ]
  %46 = phi i32 [ %103, %101 ], [ 0, %43 ]
  %47 = phi i32 [ %104, %101 ], [ 0, %43 ]
  %48 = mul nsw i32 %46, %6
  %49 = add nsw i32 %48, %40
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %50
  %52 = load i8, i8 addrspace(1)* %51, align 1, !tbaa !22, !range !24, !amdgpu.noclobber !8
  %53 = icmp eq i8 %52, 0
  br i1 %53, label %59, label %54

54:                                               ; preds = %44
  %55 = getelementptr inbounds float, float addrspace(1)* %2, i64 %50
  %56 = load float, float addrspace(1)* %55, align 4, !tbaa !25, !amdgpu.noclobber !8
  %57 = fcmp contract ogt float %56, %45
  br i1 %57, label %58, label %59

58:                                               ; preds = %54
  store i32 %46, i32 addrspace(1)* %42, align 4, !tbaa !20
  br label %59

59:                                               ; preds = %44, %58, %54
  %60 = phi float [ %56, %58 ], [ %45, %54 ], [ %45, %44 ]
  %61 = or i32 %46, 1
  %62 = mul nsw i32 %61, %6
  %63 = add nsw i32 %62, %40
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %64
  %66 = load i8, i8 addrspace(1)* %65, align 1, !tbaa !22, !range !24, !amdgpu.noclobber !8
  %67 = icmp eq i8 %66, 0
  br i1 %67, label %73, label %68

68:                                               ; preds = %59
  %69 = getelementptr inbounds float, float addrspace(1)* %2, i64 %64
  %70 = load float, float addrspace(1)* %69, align 4, !tbaa !25, !amdgpu.noclobber !8
  %71 = fcmp contract ogt float %70, %60
  br i1 %71, label %72, label %73

72:                                               ; preds = %68
  store i32 %61, i32 addrspace(1)* %42, align 4, !tbaa !20
  br label %73

73:                                               ; preds = %72, %68, %59
  %74 = phi float [ %70, %72 ], [ %60, %68 ], [ %60, %59 ]
  %75 = or i32 %46, 2
  %76 = mul nsw i32 %75, %6
  %77 = add nsw i32 %76, %40
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %78
  %80 = load i8, i8 addrspace(1)* %79, align 1, !tbaa !22, !range !24, !amdgpu.noclobber !8
  %81 = icmp eq i8 %80, 0
  br i1 %81, label %87, label %82

82:                                               ; preds = %73
  %83 = getelementptr inbounds float, float addrspace(1)* %2, i64 %78
  %84 = load float, float addrspace(1)* %83, align 4, !tbaa !25, !amdgpu.noclobber !8
  %85 = fcmp contract ogt float %84, %74
  br i1 %85, label %86, label %87

86:                                               ; preds = %82
  store i32 %75, i32 addrspace(1)* %42, align 4, !tbaa !20
  br label %87

87:                                               ; preds = %86, %82, %73
  %88 = phi float [ %84, %86 ], [ %74, %82 ], [ %74, %73 ]
  %89 = or i32 %46, 3
  %90 = mul nsw i32 %89, %6
  %91 = add nsw i32 %90, %40
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %92
  %94 = load i8, i8 addrspace(1)* %93, align 1, !tbaa !22, !range !24, !amdgpu.noclobber !8
  %95 = icmp eq i8 %94, 0
  br i1 %95, label %101, label %96

96:                                               ; preds = %87
  %97 = getelementptr inbounds float, float addrspace(1)* %2, i64 %92
  %98 = load float, float addrspace(1)* %97, align 4, !tbaa !25, !amdgpu.noclobber !8
  %99 = fcmp contract ogt float %98, %88
  br i1 %99, label %100, label %101

100:                                              ; preds = %96
  store i32 %89, i32 addrspace(1)* %42, align 4, !tbaa !20
  br label %101

101:                                              ; preds = %100, %96, %87
  %102 = phi float [ %98, %100 ], [ %88, %96 ], [ %88, %87 ]
  %103 = add nuw nsw i32 %46, 4
  %104 = add i32 %47, 4
  %105 = icmp eq i32 %104, %37
  br i1 %105, label %106, label %44, !llvm.loop !27

106:                                              ; preds = %101, %43
  %107 = phi float [ undef, %43 ], [ %102, %101 ]
  %108 = phi float [ 0.000000e+00, %43 ], [ %102, %101 ]
  %109 = phi i32 [ 0, %43 ], [ %103, %101 ]
  br i1 %38, label %130, label %110

110:                                              ; preds = %106, %125
  %111 = phi float [ %126, %125 ], [ %108, %106 ]
  %112 = phi i32 [ %127, %125 ], [ %109, %106 ]
  %113 = phi i32 [ %128, %125 ], [ 0, %106 ]
  %114 = mul nsw i32 %112, %6
  %115 = add nsw i32 %114, %40
  %116 = sext i32 %115 to i64
  %117 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %116
  %118 = load i8, i8 addrspace(1)* %117, align 1, !tbaa !22, !range !24, !amdgpu.noclobber !8
  %119 = icmp eq i8 %118, 0
  br i1 %119, label %125, label %120

120:                                              ; preds = %110
  %121 = getelementptr inbounds float, float addrspace(1)* %2, i64 %116
  %122 = load float, float addrspace(1)* %121, align 4, !tbaa !25, !amdgpu.noclobber !8
  %123 = fcmp contract ogt float %122, %111
  br i1 %123, label %124, label %125

124:                                              ; preds = %120
  store i32 %112, i32 addrspace(1)* %42, align 4, !tbaa !20
  br label %125

125:                                              ; preds = %124, %120, %110
  %126 = phi float [ %122, %124 ], [ %111, %120 ], [ %111, %110 ]
  %127 = add nuw nsw i32 %112, 1
  %128 = add i32 %113, 1
  %129 = icmp eq i32 %128, %35
  br i1 %129, label %130, label %110, !llvm.loop !29

130:                                              ; preds = %106, %125, %39
  %131 = phi float [ 0.000000e+00, %39 ], [ %107, %106 ], [ %126, %125 ]
  %132 = fcmp contract olt float %131, %33
  br i1 %132, label %133, label %134

133:                                              ; preds = %130
  store i32 -1, i32 addrspace(1)* %42, align 4, !tbaa !20
  br label %134

134:                                              ; preds = %133, %130
  %135 = add nsw i32 %40, %34
  %136 = icmp slt i32 %135, %6
  br i1 %136, label %39, label %137, !llvm.loop !31

137:                                              ; preds = %134, %4
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
!9 = !{i16 1, i16 1025}
!10 = !{!11, !15, i64 12}
!11 = !{!"hsa_kernel_dispatch_packet_s", !12, i64 0, !12, i64 2, !12, i64 4, !12, i64 6, !12, i64 8, !12, i64 10, !15, i64 12, !15, i64 16, !15, i64 20, !15, i64 24, !15, i64 28, !16, i64 32, !17, i64 40, !16, i64 48, !18, i64 56}
!12 = !{!"short", !13, i64 0}
!13 = !{!"omnipotent char", !14, i64 0}
!14 = !{!"Simple C/C++ TBAA"}
!15 = !{!"int", !13, i64 0}
!16 = !{!"long", !13, i64 0}
!17 = !{!"any pointer", !13, i64 0}
!18 = !{!"hsa_signal_s", !16, i64 0}
!19 = !{i32 0, i32 1024}
!20 = !{!21, !21, i64 0}
!21 = !{!"int", !6, i64 0}
!22 = !{!23, !23, i64 0}
!23 = !{!"bool", !6, i64 0}
!24 = !{i8 0, i8 2}
!25 = !{!26, !26, i64 0}
!26 = !{!"float", !6, i64 0}
!27 = distinct !{!27, !28}
!28 = !{!"llvm.loop.mustprogress"}
!29 = distinct !{!29, !30}
!30 = !{!"llvm.loop.unroll.disable"}
!31 = distinct !{!31, !28}
