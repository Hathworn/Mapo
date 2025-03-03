; ModuleID = '../data/hip_kernels/4085/32/main.cu'
source_filename = "../data/hip_kernels/4085/32/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z17im2col_gpu_kerneliPKfiiiiiiiPf(i32 %0, float addrspace(1)* nocapture readonly %1, i32 %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, i32 %8, float addrspace(1)* nocapture writeonly %9) local_unnamed_addr #0 {
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %12 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %13 = getelementptr i8, i8 addrspace(4)* %12, i64 4
  %14 = bitcast i8 addrspace(4)* %13 to i16 addrspace(4)*
  %15 = load i16, i16 addrspace(4)* %14, align 4, !range !4, !invariant.load !5
  %16 = zext i16 %15 to i32
  %17 = getelementptr inbounds i8, i8 addrspace(4)* %12, i64 12
  %18 = bitcast i8 addrspace(4)* %17 to i32 addrspace(4)*
  %19 = load i32, i32 addrspace(4)* %18, align 4, !tbaa !6
  %20 = mul i32 %11, %16
  %21 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %22 = add i32 %20, %21
  %23 = icmp slt i32 %22, %0
  br i1 %23, label %24, label %173

24:                                               ; preds = %10
  %25 = mul i32 %4, %4
  %26 = mul i32 %25, %7
  %27 = icmp sgt i32 %4, 0
  %28 = mul nsw i32 %8, %7
  %29 = sext i32 %28 to i64
  %30 = udiv i32 %19, %16
  %31 = mul i32 %30, %16
  %32 = icmp ugt i32 %19, %31
  %33 = zext i1 %32 to i32
  %34 = add i32 %30, %33
  %35 = mul i32 %34, %16
  %36 = and i32 %4, 3
  %37 = icmp ult i32 %4, 4
  %38 = and i32 %4, -4
  %39 = icmp eq i32 %36, 0
  br label %40

40:                                               ; preds = %24, %75
  %41 = phi i32 [ %22, %24 ], [ %76, %75 ]
  %42 = freeze i32 %41
  %43 = freeze i32 %8
  %44 = sdiv i32 %42, %43
  %45 = mul i32 %44, %43
  %46 = sub i32 %42, %45
  %47 = freeze i32 %7
  %48 = sdiv i32 %44, %47
  %49 = mul i32 %48, %47
  %50 = sub i32 %44, %49
  %51 = mul nsw i32 %50, %6
  %52 = sub nsw i32 %51, %5
  %53 = mul nsw i32 %46, %6
  %54 = sub nsw i32 %53, %5
  %55 = mul nsw i32 %48, %2
  %56 = add nsw i32 %55, %52
  %57 = mul nsw i32 %56, %3
  %58 = add nsw i32 %57, %54
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds float, float addrspace(1)* %1, i64 %59
  br i1 %27, label %61, label %75

61:                                               ; preds = %40
  %62 = mul i32 %26, %48
  %63 = add nsw i32 %62, %50
  %64 = mul nsw i32 %63, %8
  %65 = add nsw i32 %64, %46
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds float, float addrspace(1)* %9, i64 %66
  br label %68

68:                                               ; preds = %61, %103
  %69 = phi float addrspace(1)* [ %104, %103 ], [ %67, %61 ]
  %70 = phi i32 [ %105, %103 ], [ 0, %61 ]
  %71 = add nsw i32 %70, %52
  %72 = icmp sgt i32 %71, -1
  %73 = icmp slt i32 %71, %2
  %74 = mul nsw i32 %70, %3
  br i1 %37, label %78, label %107

75:                                               ; preds = %103, %40
  %76 = add i32 %35, %41
  %77 = icmp slt i32 %76, %0
  br i1 %77, label %40, label %173, !llvm.loop !16

78:                                               ; preds = %167, %68
  %79 = phi float addrspace(1)* [ undef, %68 ], [ %169, %167 ]
  %80 = phi float addrspace(1)* [ %69, %68 ], [ %169, %167 ]
  %81 = phi i32 [ 0, %68 ], [ %170, %167 ]
  br i1 %39, label %103, label %82

82:                                               ; preds = %78, %97
  %83 = phi float addrspace(1)* [ %99, %97 ], [ %80, %78 ]
  %84 = phi i32 [ %100, %97 ], [ %81, %78 ]
  %85 = phi i32 [ %101, %97 ], [ 0, %78 ]
  %86 = add nsw i32 %84, %54
  %87 = icmp sgt i32 %86, -1
  %88 = select i1 %72, i1 %87, i1 false
  %89 = select i1 %88, i1 %73, i1 false
  %90 = icmp slt i32 %86, %3
  %91 = select i1 %89, i1 %90, i1 false
  br i1 %91, label %92, label %97

92:                                               ; preds = %82
  %93 = add nsw i32 %84, %74
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds float, float addrspace(1)* %60, i64 %94
  %96 = load float, float addrspace(1)* %95, align 4, !tbaa !18
  br label %97

97:                                               ; preds = %92, %82
  %98 = phi contract float [ %96, %92 ], [ 0.000000e+00, %82 ]
  store float %98, float addrspace(1)* %83, align 4, !tbaa !18
  %99 = getelementptr inbounds float, float addrspace(1)* %83, i64 %29
  %100 = add nuw nsw i32 %84, 1
  %101 = add i32 %85, 1
  %102 = icmp eq i32 %101, %36
  br i1 %102, label %103, label %82, !llvm.loop !22

103:                                              ; preds = %97, %78
  %104 = phi float addrspace(1)* [ %79, %78 ], [ %99, %97 ]
  %105 = add nuw nsw i32 %70, 1
  %106 = icmp eq i32 %105, %4
  br i1 %106, label %75, label %68, !llvm.loop !24

107:                                              ; preds = %68, %167
  %108 = phi float addrspace(1)* [ %169, %167 ], [ %69, %68 ]
  %109 = phi i32 [ %170, %167 ], [ 0, %68 ]
  %110 = phi i32 [ %171, %167 ], [ 0, %68 ]
  %111 = add nsw i32 %109, %54
  %112 = icmp sgt i32 %111, -1
  %113 = select i1 %72, i1 %112, i1 false
  %114 = select i1 %113, i1 %73, i1 false
  %115 = icmp slt i32 %111, %3
  %116 = select i1 %114, i1 %115, i1 false
  br i1 %116, label %117, label %122

117:                                              ; preds = %107
  %118 = add nsw i32 %109, %74
  %119 = sext i32 %118 to i64
  %120 = getelementptr inbounds float, float addrspace(1)* %60, i64 %119
  %121 = load float, float addrspace(1)* %120, align 4, !tbaa !18
  br label %122

122:                                              ; preds = %107, %117
  %123 = phi contract float [ %121, %117 ], [ 0.000000e+00, %107 ]
  store float %123, float addrspace(1)* %108, align 4, !tbaa !18
  %124 = getelementptr inbounds float, float addrspace(1)* %108, i64 %29
  %125 = or i32 %109, 1
  %126 = add nsw i32 %125, %54
  %127 = icmp sgt i32 %126, -1
  %128 = select i1 %72, i1 %127, i1 false
  %129 = select i1 %128, i1 %73, i1 false
  %130 = icmp slt i32 %126, %3
  %131 = select i1 %129, i1 %130, i1 false
  br i1 %131, label %132, label %137

132:                                              ; preds = %122
  %133 = add nsw i32 %125, %74
  %134 = sext i32 %133 to i64
  %135 = getelementptr inbounds float, float addrspace(1)* %60, i64 %134
  %136 = load float, float addrspace(1)* %135, align 4, !tbaa !18
  br label %137

137:                                              ; preds = %132, %122
  %138 = phi contract float [ %136, %132 ], [ 0.000000e+00, %122 ]
  store float %138, float addrspace(1)* %124, align 4, !tbaa !18
  %139 = getelementptr inbounds float, float addrspace(1)* %124, i64 %29
  %140 = or i32 %109, 2
  %141 = add nsw i32 %140, %54
  %142 = icmp sgt i32 %141, -1
  %143 = select i1 %72, i1 %142, i1 false
  %144 = select i1 %143, i1 %73, i1 false
  %145 = icmp slt i32 %141, %3
  %146 = select i1 %144, i1 %145, i1 false
  br i1 %146, label %147, label %152

147:                                              ; preds = %137
  %148 = add nsw i32 %140, %74
  %149 = sext i32 %148 to i64
  %150 = getelementptr inbounds float, float addrspace(1)* %60, i64 %149
  %151 = load float, float addrspace(1)* %150, align 4, !tbaa !18
  br label %152

152:                                              ; preds = %147, %137
  %153 = phi contract float [ %151, %147 ], [ 0.000000e+00, %137 ]
  store float %153, float addrspace(1)* %139, align 4, !tbaa !18
  %154 = getelementptr inbounds float, float addrspace(1)* %139, i64 %29
  %155 = or i32 %109, 3
  %156 = add nsw i32 %155, %54
  %157 = icmp sgt i32 %156, -1
  %158 = select i1 %72, i1 %157, i1 false
  %159 = select i1 %158, i1 %73, i1 false
  %160 = icmp slt i32 %156, %3
  %161 = select i1 %159, i1 %160, i1 false
  br i1 %161, label %162, label %167

162:                                              ; preds = %152
  %163 = add nsw i32 %155, %74
  %164 = sext i32 %163 to i64
  %165 = getelementptr inbounds float, float addrspace(1)* %60, i64 %164
  %166 = load float, float addrspace(1)* %165, align 4, !tbaa !18
  br label %167

167:                                              ; preds = %162, %152
  %168 = phi contract float [ %166, %162 ], [ 0.000000e+00, %152 ]
  store float %168, float addrspace(1)* %154, align 4, !tbaa !18
  %169 = getelementptr inbounds float, float addrspace(1)* %154, i64 %29
  %170 = add nuw nsw i32 %109, 4
  %171 = add i32 %110, 4
  %172 = icmp eq i32 %171, %38
  br i1 %172, label %78, label %107, !llvm.loop !25

173:                                              ; preds = %75, %10
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{!7, !11, i64 12}
!7 = !{!"hsa_kernel_dispatch_packet_s", !8, i64 0, !8, i64 2, !8, i64 4, !8, i64 6, !8, i64 8, !8, i64 10, !11, i64 12, !11, i64 16, !11, i64 20, !11, i64 24, !11, i64 28, !12, i64 32, !13, i64 40, !12, i64 48, !14, i64 56}
!8 = !{!"short", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
!11 = !{!"int", !9, i64 0}
!12 = !{!"long", !9, i64 0}
!13 = !{!"any pointer", !9, i64 0}
!14 = !{!"hsa_signal_s", !12, i64 0}
!15 = !{i32 0, i32 1024}
!16 = distinct !{!16, !17}
!17 = !{!"llvm.loop.mustprogress"}
!18 = !{!19, !19, i64 0}
!19 = !{!"float", !20, i64 0}
!20 = !{!"omnipotent char", !21, i64 0}
!21 = !{!"Simple C++ TBAA"}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.unroll.disable"}
!24 = distinct !{!24, !17}
!25 = distinct !{!25, !17}
