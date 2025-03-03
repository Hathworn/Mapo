; ModuleID = '../data/hip_kernels/4386/1/main.cu'
source_filename = "../data/hip_kernels/4386/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z13im2col_kerneliPfiiiiiiiiiiiiS_(i32 %0, float addrspace(1)* nocapture readonly %1, i32 %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, i32 %8, i32 %9, i32 %10, i32 %11, i32 %12, i32 %13, float addrspace(1)* nocapture writeonly %14) local_unnamed_addr #0 {
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %17 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %18 = getelementptr i8, i8 addrspace(4)* %17, i64 4
  %19 = bitcast i8 addrspace(4)* %18 to i16 addrspace(4)*
  %20 = load i16, i16 addrspace(4)* %19, align 4, !range !4, !invariant.load !5
  %21 = zext i16 %20 to i32
  %22 = getelementptr inbounds i8, i8 addrspace(4)* %17, i64 12
  %23 = bitcast i8 addrspace(4)* %22 to i32 addrspace(4)*
  %24 = load i32, i32 addrspace(4)* %23, align 4, !tbaa !6
  %25 = mul i32 %16, %21
  %26 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %27 = add i32 %25, %26
  %28 = icmp slt i32 %27, %0
  br i1 %28, label %29, label %46

29:                                               ; preds = %15
  %30 = mul i32 %5, %4
  %31 = mul i32 %30, %12
  %32 = icmp sgt i32 %4, 0
  %33 = icmp sgt i32 %5, 0
  %34 = mul nsw i32 %13, %12
  %35 = sext i32 %34 to i64
  %36 = udiv i32 %24, %21
  %37 = mul i32 %36, %21
  %38 = icmp ugt i32 %24, %37
  %39 = zext i1 %38 to i32
  %40 = add i32 %36, %39
  %41 = mul i32 %40, %21
  %42 = and i32 %5, 3
  %43 = icmp ult i32 %5, 4
  %44 = and i32 %5, -4
  %45 = icmp eq i32 %42, 0
  br label %47

46:                                               ; preds = %85, %15
  ret void

47:                                               ; preds = %29, %85
  %48 = phi float addrspace(1)* [ %1, %29 ], [ %75, %85 ]
  %49 = phi float addrspace(1)* [ %14, %29 ], [ %86, %85 ]
  %50 = phi i32 [ %27, %29 ], [ %87, %85 ]
  %51 = freeze i32 %50
  %52 = freeze i32 %13
  %53 = sdiv i32 %51, %52
  %54 = mul i32 %53, %52
  %55 = sub i32 %51, %54
  %56 = freeze i32 %12
  %57 = sdiv i32 %53, %56
  %58 = mul i32 %57, %56
  %59 = sub i32 %53, %58
  %60 = mul nsw i32 %59, %8
  %61 = sub nsw i32 %60, %6
  %62 = mul nsw i32 %55, %9
  %63 = sub nsw i32 %62, %7
  %64 = mul i32 %31, %57
  %65 = add nsw i32 %64, %59
  %66 = mul nsw i32 %65, %13
  %67 = add nsw i32 %66, %55
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds float, float addrspace(1)* %49, i64 %68
  %70 = mul nsw i32 %57, %2
  %71 = add nsw i32 %70, %61
  %72 = mul nsw i32 %71, %3
  %73 = add nsw i32 %72, %63
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds float, float addrspace(1)* %48, i64 %74
  br i1 %32, label %76, label %85

76:                                               ; preds = %47, %115
  %77 = phi float addrspace(1)* [ %116, %115 ], [ %69, %47 ]
  %78 = phi i32 [ %117, %115 ], [ 0, %47 ]
  br i1 %33, label %79, label %115

79:                                               ; preds = %76
  %80 = mul nsw i32 %78, %10
  %81 = add nsw i32 %80, %61
  %82 = icmp sgt i32 %81, -1
  %83 = icmp slt i32 %81, %2
  %84 = mul nsw i32 %80, %3
  br i1 %43, label %89, label %119

85:                                               ; preds = %115, %47
  %86 = phi float addrspace(1)* [ %69, %47 ], [ %116, %115 ]
  %87 = add i32 %41, %53
  %88 = icmp slt i32 %87, %0
  br i1 %88, label %47, label %46, !llvm.loop !16

89:                                               ; preds = %183, %79
  %90 = phi float addrspace(1)* [ undef, %79 ], [ %185, %183 ]
  %91 = phi float addrspace(1)* [ %77, %79 ], [ %185, %183 ]
  %92 = phi i32 [ 0, %79 ], [ %186, %183 ]
  br i1 %45, label %115, label %93

93:                                               ; preds = %89, %109
  %94 = phi float addrspace(1)* [ %111, %109 ], [ %91, %89 ]
  %95 = phi i32 [ %112, %109 ], [ %92, %89 ]
  %96 = phi i32 [ %113, %109 ], [ 0, %89 ]
  %97 = mul nsw i32 %95, %11
  %98 = add nsw i32 %97, %63
  %99 = icmp sgt i32 %98, -1
  %100 = select i1 %82, i1 %99, i1 false
  %101 = select i1 %100, i1 %83, i1 false
  %102 = icmp slt i32 %98, %3
  %103 = select i1 %101, i1 %102, i1 false
  br i1 %103, label %104, label %109

104:                                              ; preds = %93
  %105 = add nsw i32 %97, %84
  %106 = sext i32 %105 to i64
  %107 = getelementptr inbounds float, float addrspace(1)* %75, i64 %106
  %108 = load float, float addrspace(1)* %107, align 4, !tbaa !18
  br label %109

109:                                              ; preds = %104, %93
  %110 = phi contract float [ %108, %104 ], [ 0.000000e+00, %93 ]
  store float %110, float addrspace(1)* %94, align 4, !tbaa !18
  %111 = getelementptr inbounds float, float addrspace(1)* %94, i64 %35
  %112 = add nuw nsw i32 %95, 1
  %113 = add i32 %96, 1
  %114 = icmp eq i32 %113, %42
  br i1 %114, label %115, label %93, !llvm.loop !22

115:                                              ; preds = %89, %109, %76
  %116 = phi float addrspace(1)* [ %77, %76 ], [ %90, %89 ], [ %111, %109 ]
  %117 = add nuw nsw i32 %78, 1
  %118 = icmp eq i32 %117, %4
  br i1 %118, label %85, label %76, !llvm.loop !24

119:                                              ; preds = %79, %183
  %120 = phi float addrspace(1)* [ %185, %183 ], [ %77, %79 ]
  %121 = phi i32 [ %186, %183 ], [ 0, %79 ]
  %122 = phi i32 [ %187, %183 ], [ 0, %79 ]
  %123 = mul nsw i32 %121, %11
  %124 = add nsw i32 %123, %63
  %125 = icmp sgt i32 %124, -1
  %126 = select i1 %82, i1 %125, i1 false
  %127 = select i1 %126, i1 %83, i1 false
  %128 = icmp slt i32 %124, %3
  %129 = select i1 %127, i1 %128, i1 false
  br i1 %129, label %130, label %135

130:                                              ; preds = %119
  %131 = add nsw i32 %123, %84
  %132 = sext i32 %131 to i64
  %133 = getelementptr inbounds float, float addrspace(1)* %75, i64 %132
  %134 = load float, float addrspace(1)* %133, align 4, !tbaa !18
  br label %135

135:                                              ; preds = %119, %130
  %136 = phi contract float [ %134, %130 ], [ 0.000000e+00, %119 ]
  store float %136, float addrspace(1)* %120, align 4, !tbaa !18
  %137 = getelementptr inbounds float, float addrspace(1)* %120, i64 %35
  %138 = or i32 %121, 1
  %139 = mul nsw i32 %138, %11
  %140 = add nsw i32 %139, %63
  %141 = icmp sgt i32 %140, -1
  %142 = select i1 %82, i1 %141, i1 false
  %143 = select i1 %142, i1 %83, i1 false
  %144 = icmp slt i32 %140, %3
  %145 = select i1 %143, i1 %144, i1 false
  br i1 %145, label %146, label %151

146:                                              ; preds = %135
  %147 = add nsw i32 %139, %84
  %148 = sext i32 %147 to i64
  %149 = getelementptr inbounds float, float addrspace(1)* %75, i64 %148
  %150 = load float, float addrspace(1)* %149, align 4, !tbaa !18
  br label %151

151:                                              ; preds = %146, %135
  %152 = phi contract float [ %150, %146 ], [ 0.000000e+00, %135 ]
  store float %152, float addrspace(1)* %137, align 4, !tbaa !18
  %153 = getelementptr inbounds float, float addrspace(1)* %137, i64 %35
  %154 = or i32 %121, 2
  %155 = mul nsw i32 %154, %11
  %156 = add nsw i32 %155, %63
  %157 = icmp sgt i32 %156, -1
  %158 = select i1 %82, i1 %157, i1 false
  %159 = select i1 %158, i1 %83, i1 false
  %160 = icmp slt i32 %156, %3
  %161 = select i1 %159, i1 %160, i1 false
  br i1 %161, label %162, label %167

162:                                              ; preds = %151
  %163 = add nsw i32 %155, %84
  %164 = sext i32 %163 to i64
  %165 = getelementptr inbounds float, float addrspace(1)* %75, i64 %164
  %166 = load float, float addrspace(1)* %165, align 4, !tbaa !18
  br label %167

167:                                              ; preds = %162, %151
  %168 = phi contract float [ %166, %162 ], [ 0.000000e+00, %151 ]
  store float %168, float addrspace(1)* %153, align 4, !tbaa !18
  %169 = getelementptr inbounds float, float addrspace(1)* %153, i64 %35
  %170 = or i32 %121, 3
  %171 = mul nsw i32 %170, %11
  %172 = add nsw i32 %171, %63
  %173 = icmp sgt i32 %172, -1
  %174 = select i1 %82, i1 %173, i1 false
  %175 = select i1 %174, i1 %83, i1 false
  %176 = icmp slt i32 %172, %3
  %177 = select i1 %175, i1 %176, i1 false
  br i1 %177, label %178, label %183

178:                                              ; preds = %167
  %179 = add nsw i32 %171, %84
  %180 = sext i32 %179 to i64
  %181 = getelementptr inbounds float, float addrspace(1)* %75, i64 %180
  %182 = load float, float addrspace(1)* %181, align 4, !tbaa !18
  br label %183

183:                                              ; preds = %178, %167
  %184 = phi contract float [ %182, %178 ], [ 0.000000e+00, %167 ]
  store float %184, float addrspace(1)* %169, align 4, !tbaa !18
  %185 = getelementptr inbounds float, float addrspace(1)* %169, i64 %35
  %186 = add nuw nsw i32 %121, 4
  %187 = add i32 %122, 4
  %188 = icmp eq i32 %187, %44
  br i1 %188, label %89, label %119, !llvm.loop !25
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
