; ModuleID = '../data/hip_kernels/15412/128/main.cu'
source_filename = "../data/hip_kernels/15412/128/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z34forward_local_avgpool_layer_kerneliiiiiiiiPfS_(i32 %0, i32 %1, i32 %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, float addrspace(1)* nocapture readonly %8, float addrspace(1)* nocapture writeonly %9) local_unnamed_addr #0 {
  %11 = sub i32 %1, %6
  %12 = add i32 %11, %7
  %13 = sdiv i32 %12, %5
  %14 = add nsw i32 %13, 1
  %15 = sub i32 %2, %6
  %16 = add i32 %15, %7
  %17 = sdiv i32 %16, %4
  %18 = add nsw i32 %17, 1
  %19 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %20 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %21 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %22 = getelementptr inbounds i8, i8 addrspace(4)* %21, i64 12
  %23 = bitcast i8 addrspace(4)* %22 to i32 addrspace(4)*
  %24 = load i32, i32 addrspace(4)* %23, align 4, !tbaa !4
  %25 = getelementptr i8, i8 addrspace(4)* %21, i64 4
  %26 = bitcast i8 addrspace(4)* %25 to i16 addrspace(4)*
  %27 = load i16, i16 addrspace(4)* %26, align 4, !range !13, !invariant.load !14
  %28 = zext i16 %27 to i32
  %29 = udiv i32 %24, %28
  %30 = mul i32 %29, %28
  %31 = icmp ugt i32 %24, %30
  %32 = zext i1 %31 to i32
  %33 = add i32 %29, %32
  %34 = mul i32 %33, %20
  %35 = add i32 %34, %19
  %36 = mul i32 %35, %28
  %37 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %38 = add i32 %36, %37
  %39 = icmp slt i32 %38, %0
  br i1 %39, label %40, label %193

40:                                               ; preds = %10
  %41 = freeze i32 %38
  %42 = freeze i32 %18
  %43 = sdiv i32 %41, %42
  %44 = mul i32 %43, %42
  %45 = sub i32 %41, %44
  %46 = freeze i32 %14
  %47 = sdiv i32 %43, %46
  %48 = mul i32 %47, %46
  %49 = sub i32 %43, %48
  %50 = freeze i32 %47
  %51 = sdiv i32 %7, -2
  %52 = mul nsw i32 %50, %14
  %53 = add nsw i32 %52, %49
  %54 = mul nsw i32 %53, %18
  %55 = add nsw i32 %54, %45
  %56 = icmp sgt i32 %6, 0
  br i1 %56, label %57, label %186

57:                                               ; preds = %40
  %58 = mul nsw i32 %49, %5
  %59 = add nsw i32 %58, %51
  %60 = mul nsw i32 %45, %4
  %61 = add nsw i32 %60, %51
  %62 = mul nsw i32 %50, %1
  %63 = and i32 %6, 3
  %64 = icmp ult i32 %6, 4
  %65 = and i32 %6, -4
  %66 = icmp eq i32 %63, 0
  br label %67

67:                                               ; preds = %57, %181
  %68 = phi float [ 0.000000e+00, %57 ], [ %183, %181 ]
  %69 = phi i32 [ 0, %57 ], [ %182, %181 ]
  %70 = phi i32 [ 0, %57 ], [ %184, %181 ]
  %71 = add nsw i32 %59, %70
  %72 = add nsw i32 %71, %62
  %73 = mul nsw i32 %72, %2
  %74 = icmp sgt i32 %71, -1
  %75 = icmp slt i32 %71, %1
  br i1 %64, label %151, label %76

76:                                               ; preds = %67, %145
  %77 = phi float [ %147, %145 ], [ %68, %67 ]
  %78 = phi i32 [ %146, %145 ], [ %69, %67 ]
  %79 = phi i32 [ %148, %145 ], [ 0, %67 ]
  %80 = phi i32 [ %149, %145 ], [ 0, %67 ]
  %81 = add nsw i32 %61, %79
  %82 = add nsw i32 %81, %73
  br i1 %74, label %83, label %94

83:                                               ; preds = %76
  %84 = icmp sgt i32 %81, -1
  %85 = select i1 %75, i1 %84, i1 false
  %86 = icmp slt i32 %81, %2
  %87 = select i1 %85, i1 %86, i1 false
  br i1 %87, label %88, label %94

88:                                               ; preds = %83
  %89 = add nsw i32 %78, 1
  %90 = sext i32 %82 to i64
  %91 = getelementptr inbounds float, float addrspace(1)* %8, i64 %90
  %92 = load float, float addrspace(1)* %91, align 4, !tbaa !16, !amdgpu.noclobber !14
  %93 = fadd contract float %77, %92
  br label %94

94:                                               ; preds = %76, %88, %83
  %95 = phi i32 [ %89, %88 ], [ %78, %83 ], [ %78, %76 ]
  %96 = phi float [ %93, %88 ], [ %77, %83 ], [ %77, %76 ]
  %97 = or i32 %79, 1
  %98 = add nsw i32 %61, %97
  %99 = add nsw i32 %98, %73
  br i1 %74, label %100, label %111

100:                                              ; preds = %94
  %101 = icmp sgt i32 %98, -1
  %102 = select i1 %75, i1 %101, i1 false
  %103 = icmp slt i32 %98, %2
  %104 = select i1 %102, i1 %103, i1 false
  br i1 %104, label %105, label %111

105:                                              ; preds = %100
  %106 = add nsw i32 %95, 1
  %107 = sext i32 %99 to i64
  %108 = getelementptr inbounds float, float addrspace(1)* %8, i64 %107
  %109 = load float, float addrspace(1)* %108, align 4, !tbaa !16, !amdgpu.noclobber !14
  %110 = fadd contract float %96, %109
  br label %111

111:                                              ; preds = %105, %100, %94
  %112 = phi i32 [ %106, %105 ], [ %95, %100 ], [ %95, %94 ]
  %113 = phi float [ %110, %105 ], [ %96, %100 ], [ %96, %94 ]
  %114 = or i32 %79, 2
  %115 = add nsw i32 %61, %114
  %116 = add nsw i32 %115, %73
  br i1 %74, label %117, label %128

117:                                              ; preds = %111
  %118 = icmp sgt i32 %115, -1
  %119 = select i1 %75, i1 %118, i1 false
  %120 = icmp slt i32 %115, %2
  %121 = select i1 %119, i1 %120, i1 false
  br i1 %121, label %122, label %128

122:                                              ; preds = %117
  %123 = add nsw i32 %112, 1
  %124 = sext i32 %116 to i64
  %125 = getelementptr inbounds float, float addrspace(1)* %8, i64 %124
  %126 = load float, float addrspace(1)* %125, align 4, !tbaa !16, !amdgpu.noclobber !14
  %127 = fadd contract float %113, %126
  br label %128

128:                                              ; preds = %122, %117, %111
  %129 = phi i32 [ %123, %122 ], [ %112, %117 ], [ %112, %111 ]
  %130 = phi float [ %127, %122 ], [ %113, %117 ], [ %113, %111 ]
  %131 = or i32 %79, 3
  %132 = add nsw i32 %61, %131
  %133 = add nsw i32 %132, %73
  br i1 %74, label %134, label %145

134:                                              ; preds = %128
  %135 = icmp sgt i32 %132, -1
  %136 = select i1 %75, i1 %135, i1 false
  %137 = icmp slt i32 %132, %2
  %138 = select i1 %136, i1 %137, i1 false
  br i1 %138, label %139, label %145

139:                                              ; preds = %134
  %140 = add nsw i32 %129, 1
  %141 = sext i32 %133 to i64
  %142 = getelementptr inbounds float, float addrspace(1)* %8, i64 %141
  %143 = load float, float addrspace(1)* %142, align 4, !tbaa !16, !amdgpu.noclobber !14
  %144 = fadd contract float %130, %143
  br label %145

145:                                              ; preds = %139, %134, %128
  %146 = phi i32 [ %140, %139 ], [ %129, %134 ], [ %129, %128 ]
  %147 = phi float [ %144, %139 ], [ %130, %134 ], [ %130, %128 ]
  %148 = add nuw nsw i32 %79, 4
  %149 = add i32 %80, 4
  %150 = icmp eq i32 %149, %65
  br i1 %150, label %151, label %76, !llvm.loop !20

151:                                              ; preds = %145, %67
  %152 = phi i32 [ undef, %67 ], [ %146, %145 ]
  %153 = phi float [ undef, %67 ], [ %147, %145 ]
  %154 = phi float [ %68, %67 ], [ %147, %145 ]
  %155 = phi i32 [ %69, %67 ], [ %146, %145 ]
  %156 = phi i32 [ 0, %67 ], [ %148, %145 ]
  br i1 %66, label %181, label %157

157:                                              ; preds = %151, %175
  %158 = phi float [ %177, %175 ], [ %154, %151 ]
  %159 = phi i32 [ %176, %175 ], [ %155, %151 ]
  %160 = phi i32 [ %178, %175 ], [ %156, %151 ]
  %161 = phi i32 [ %179, %175 ], [ 0, %151 ]
  %162 = add nsw i32 %61, %160
  %163 = add nsw i32 %162, %73
  br i1 %74, label %164, label %175

164:                                              ; preds = %157
  %165 = icmp sgt i32 %162, -1
  %166 = select i1 %75, i1 %165, i1 false
  %167 = icmp slt i32 %162, %2
  %168 = select i1 %166, i1 %167, i1 false
  br i1 %168, label %169, label %175

169:                                              ; preds = %164
  %170 = add nsw i32 %159, 1
  %171 = sext i32 %163 to i64
  %172 = getelementptr inbounds float, float addrspace(1)* %8, i64 %171
  %173 = load float, float addrspace(1)* %172, align 4, !tbaa !16, !amdgpu.noclobber !14
  %174 = fadd contract float %158, %173
  br label %175

175:                                              ; preds = %169, %164, %157
  %176 = phi i32 [ %170, %169 ], [ %159, %164 ], [ %159, %157 ]
  %177 = phi float [ %174, %169 ], [ %158, %164 ], [ %158, %157 ]
  %178 = add nuw nsw i32 %160, 1
  %179 = add i32 %161, 1
  %180 = icmp eq i32 %179, %63
  br i1 %180, label %181, label %157, !llvm.loop !22

181:                                              ; preds = %175, %151
  %182 = phi i32 [ %152, %151 ], [ %176, %175 ]
  %183 = phi float [ %153, %151 ], [ %177, %175 ]
  %184 = add nuw nsw i32 %70, 1
  %185 = icmp eq i32 %184, %6
  br i1 %185, label %186, label %67, !llvm.loop !24

186:                                              ; preds = %181, %40
  %187 = phi i32 [ 0, %40 ], [ %182, %181 ]
  %188 = phi float [ 0.000000e+00, %40 ], [ %183, %181 ]
  %189 = sitofp i32 %187 to float
  %190 = fdiv contract float %188, %189
  %191 = sext i32 %55 to i64
  %192 = getelementptr inbounds float, float addrspace(1)* %9, i64 %191
  store float %190, float addrspace(1)* %192, align 4, !tbaa !16
  br label %193

193:                                              ; preds = %10, %186
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{!5, !9, i64 12}
!5 = !{!"hsa_kernel_dispatch_packet_s", !6, i64 0, !6, i64 2, !6, i64 4, !6, i64 6, !6, i64 8, !6, i64 10, !9, i64 12, !9, i64 16, !9, i64 20, !9, i64 24, !9, i64 28, !10, i64 32, !11, i64 40, !10, i64 48, !12, i64 56}
!6 = !{!"short", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!"int", !7, i64 0}
!10 = !{!"long", !7, i64 0}
!11 = !{!"any pointer", !7, i64 0}
!12 = !{!"hsa_signal_s", !10, i64 0}
!13 = !{i16 1, i16 1025}
!14 = !{}
!15 = !{i32 0, i32 1024}
!16 = !{!17, !17, i64 0}
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.unroll.disable"}
!24 = distinct !{!24, !21}
