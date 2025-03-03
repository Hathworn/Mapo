; ModuleID = '../data/hip_kernels/1769/5/main.cu'
source_filename = "../data/hip_kernels/1769/5/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z17wlcss_cuda_kernelPiS_S_S_S_S_S_S_S_S_S_(i32 addrspace(1)* nocapture writeonly %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture readonly %2, i32 addrspace(1)* nocapture readonly %3, i32 addrspace(1)* nocapture readonly %4, i32 addrspace(1)* nocapture readonly %5, i32 addrspace(1)* nocapture readonly %6, i32 addrspace(1)* nocapture readonly %7, i32 addrspace(1)* nocapture readonly %8, i32 addrspace(1)* nocapture %9, i32 addrspace(1)* nocapture readonly %10) local_unnamed_addr #0 {
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %15 = sext i32 %13 to i64
  %16 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %15
  %17 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !5, !amdgpu.noclobber !9
  %18 = sext i32 %14 to i64
  %19 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %18
  %20 = load i32, i32 addrspace(1)* %19, align 4, !tbaa !5, !amdgpu.noclobber !9
  %21 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %15
  %22 = load i32, i32 addrspace(1)* %21, align 4, !tbaa !5, !amdgpu.noclobber !9
  %23 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %18
  %24 = load i32, i32 addrspace(1)* %23, align 4, !tbaa !5, !amdgpu.noclobber !9
  %25 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %26 = getelementptr inbounds i8, i8 addrspace(4)* %25, i64 12
  %27 = bitcast i8 addrspace(4)* %26 to i32 addrspace(4)*
  %28 = load i32, i32 addrspace(4)* %27, align 4, !tbaa !10
  %29 = getelementptr i8, i8 addrspace(4)* %25, i64 4
  %30 = bitcast i8 addrspace(4)* %29 to i16 addrspace(4)*
  %31 = load i16, i16 addrspace(4)* %30, align 4, !range !19, !invariant.load !9
  %32 = zext i16 %31 to i32
  %33 = udiv i32 %28, %32
  %34 = mul i32 %33, %32
  %35 = icmp ugt i32 %28, %34
  %36 = zext i1 %35 to i32
  %37 = add i32 %33, %36
  %38 = mul i32 %37, %12
  %39 = getelementptr inbounds i8, i8 addrspace(4)* %25, i64 16
  %40 = bitcast i8 addrspace(4)* %39 to i32 addrspace(4)*
  %41 = load i32, i32 addrspace(4)* %40, align 8, !tbaa !20
  %42 = getelementptr i8, i8 addrspace(4)* %25, i64 6
  %43 = bitcast i8 addrspace(4)* %42 to i16 addrspace(4)*
  %44 = load i16, i16 addrspace(4)* %43, align 2, !range !19, !invariant.load !9
  %45 = zext i16 %44 to i32
  %46 = udiv i32 %41, %45
  %47 = mul i32 %46, %45
  %48 = icmp ugt i32 %41, %47
  %49 = zext i1 %48 to i32
  %50 = add i32 %46, %49
  %51 = add i32 %38, %13
  %52 = mul i32 %50, %51
  %53 = add i32 %52, %14
  %54 = zext i32 %53 to i64
  %55 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %54
  %56 = load i32, i32 addrspace(1)* %55, align 4, !tbaa !5, !amdgpu.noclobber !9
  %57 = getelementptr inbounds i32, i32 addrspace(1)* %10, i64 %54
  %58 = load i32, i32 addrspace(1)* %57, align 4, !tbaa !5, !amdgpu.noclobber !9
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds i32, i32 addrspace(1)* %9, i64 %59
  %61 = sext i32 %56 to i64
  %62 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %61
  %63 = sext i32 %22 to i64
  %64 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %63
  %65 = sext i32 %24 to i64
  %66 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %65
  %67 = mul nuw nsw i32 %12, 3
  %68 = zext i32 %67 to i64
  %69 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %68
  %70 = load i32, i32 addrspace(1)* %69, align 4, !tbaa !5, !amdgpu.noclobber !9
  %71 = add nuw nsw i32 %67, 1
  %72 = zext i32 %71 to i64
  %73 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %72
  %74 = load i32, i32 addrspace(1)* %73, align 4, !tbaa !5, !amdgpu.noclobber !9
  %75 = add nuw nsw i32 %67, 2
  %76 = zext i32 %75 to i64
  %77 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %76
  %78 = load i32, i32 addrspace(1)* %77, align 4, !tbaa !5, !amdgpu.noclobber !9
  %79 = icmp sgt i32 %20, 0
  br i1 %79, label %80, label %99

80:                                               ; preds = %11
  %81 = icmp sgt i32 %17, 0
  %82 = add nsw i32 %17, 1
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds i32, i32 addrspace(1)* %60, i64 %83
  %85 = sext i32 %17 to i64
  %86 = getelementptr inbounds i32, i32 addrspace(1)* %60, i64 %85
  %87 = and i32 %17, 1
  %88 = icmp eq i32 %17, 1
  %89 = and i32 %17, -2
  %90 = icmp eq i32 %87, 0
  br label %91

91:                                               ; preds = %80, %132
  %92 = phi i32 [ 0, %80 ], [ %136, %132 ]
  br i1 %81, label %96, label %93

93:                                               ; preds = %91
  %94 = load i32, i32 addrspace(1)* %84, align 4, !tbaa !5
  %95 = zext i32 %92 to i64
  br label %132

96:                                               ; preds = %91
  %97 = zext i32 %92 to i64
  %98 = getelementptr inbounds i32, i32 addrspace(1)* %66, i64 %97
  br i1 %88, label %100, label %138

99:                                               ; preds = %132, %11
  ret void

100:                                              ; preds = %193, %96
  %101 = phi i32 [ undef, %96 ], [ %195, %193 ]
  %102 = phi i32 [ 0, %96 ], [ %178, %193 ]
  br i1 %90, label %132, label %103

103:                                              ; preds = %100
  %104 = load i32, i32 addrspace(1)* %98, align 4, !tbaa !5
  %105 = zext i32 %102 to i64
  %106 = getelementptr inbounds i32, i32 addrspace(1)* %64, i64 %105
  %107 = load i32, i32 addrspace(1)* %106, align 4, !tbaa !5
  %108 = sub nsw i32 %104, %107
  %109 = tail call i32 @llvm.abs.i32(i32 %108, i1 true)
  %110 = icmp sgt i32 %109, %78
  %111 = getelementptr inbounds i32, i32 addrspace(1)* %60, i64 %105
  %112 = load i32, i32 addrspace(1)* %111, align 4, !tbaa !5
  br i1 %110, label %116, label %113

113:                                              ; preds = %103
  %114 = add nsw i32 %112, %70
  %115 = load i32, i32 addrspace(1)* %84, align 4, !tbaa !5
  br label %128

116:                                              ; preds = %103
  %117 = add nuw nsw i32 %102, 1
  %118 = mul nsw i32 %109, %74
  %119 = sub nsw i32 %112, %118
  %120 = zext i32 %117 to i64
  %121 = getelementptr inbounds i32, i32 addrspace(1)* %60, i64 %120
  %122 = load i32, i32 addrspace(1)* %121, align 4, !tbaa !5
  %123 = sub nsw i32 %122, %118
  %124 = load i32, i32 addrspace(1)* %84, align 4, !tbaa !5
  %125 = sub nsw i32 %124, %118
  %126 = tail call i32 @llvm.smax.i32(i32 %123, i32 %125)
  %127 = tail call i32 @llvm.smax.i32(i32 %119, i32 %126)
  br label %128

128:                                              ; preds = %116, %113
  %129 = phi i32 [ %124, %116 ], [ %115, %113 ]
  %130 = phi i32 [ %127, %116 ], [ %114, %113 ]
  %131 = getelementptr inbounds i32, i32 addrspace(1)* %60, i64 %105
  store i32 %129, i32 addrspace(1)* %131, align 4, !tbaa !5
  store i32 %130, i32 addrspace(1)* %84, align 4, !tbaa !5
  br label %132

132:                                              ; preds = %128, %100, %93
  %133 = phi i64 [ %95, %93 ], [ %97, %100 ], [ %97, %128 ]
  %134 = phi i32 [ %94, %93 ], [ %101, %100 ], [ %130, %128 ]
  store i32 %134, i32 addrspace(1)* %86, align 4, !tbaa !5
  %135 = getelementptr inbounds i32, i32 addrspace(1)* %62, i64 %133
  store i32 %134, i32 addrspace(1)* %135, align 4, !tbaa !5
  store i32 0, i32 addrspace(1)* %84, align 4, !tbaa !5
  %136 = add nuw nsw i32 %92, 1
  %137 = icmp eq i32 %136, %20
  br i1 %137, label %99, label %91, !llvm.loop !21

138:                                              ; preds = %96, %193
  %139 = phi i32 [ %178, %193 ], [ 0, %96 ]
  %140 = phi i32 [ %197, %193 ], [ 0, %96 ]
  %141 = load i32, i32 addrspace(1)* %98, align 4, !tbaa !5
  %142 = zext i32 %139 to i64
  %143 = getelementptr inbounds i32, i32 addrspace(1)* %64, i64 %142
  %144 = load i32, i32 addrspace(1)* %143, align 4, !tbaa !5
  %145 = sub nsw i32 %141, %144
  %146 = tail call i32 @llvm.abs.i32(i32 %145, i1 true)
  %147 = icmp sgt i32 %146, %78
  %148 = getelementptr inbounds i32, i32 addrspace(1)* %60, i64 %142
  %149 = load i32, i32 addrspace(1)* %148, align 4, !tbaa !5
  %150 = or i32 %139, 1
  br i1 %147, label %154, label %151

151:                                              ; preds = %138
  %152 = add nsw i32 %149, %70
  %153 = load i32, i32 addrspace(1)* %84, align 4, !tbaa !5
  br label %165

154:                                              ; preds = %138
  %155 = mul nsw i32 %146, %74
  %156 = sub nsw i32 %149, %155
  %157 = zext i32 %150 to i64
  %158 = getelementptr inbounds i32, i32 addrspace(1)* %60, i64 %157
  %159 = load i32, i32 addrspace(1)* %158, align 4, !tbaa !5
  %160 = sub nsw i32 %159, %155
  %161 = load i32, i32 addrspace(1)* %84, align 4, !tbaa !5
  %162 = sub nsw i32 %161, %155
  %163 = tail call i32 @llvm.smax.i32(i32 %160, i32 %162)
  %164 = tail call i32 @llvm.smax.i32(i32 %156, i32 %163)
  br label %165

165:                                              ; preds = %154, %151
  %166 = phi i32 [ %161, %154 ], [ %153, %151 ]
  %167 = phi i32 [ %164, %154 ], [ %152, %151 ]
  %168 = getelementptr inbounds i32, i32 addrspace(1)* %60, i64 %142
  store i32 %166, i32 addrspace(1)* %168, align 4, !tbaa !5
  store i32 %167, i32 addrspace(1)* %84, align 4, !tbaa !5
  %169 = load i32, i32 addrspace(1)* %98, align 4, !tbaa !5
  %170 = zext i32 %150 to i64
  %171 = getelementptr inbounds i32, i32 addrspace(1)* %64, i64 %170
  %172 = load i32, i32 addrspace(1)* %171, align 4, !tbaa !5
  %173 = sub nsw i32 %169, %172
  %174 = tail call i32 @llvm.abs.i32(i32 %173, i1 true)
  %175 = icmp sgt i32 %174, %78
  %176 = getelementptr inbounds i32, i32 addrspace(1)* %60, i64 %170
  %177 = load i32, i32 addrspace(1)* %176, align 4, !tbaa !5
  %178 = add nuw nsw i32 %139, 2
  br i1 %175, label %182, label %179

179:                                              ; preds = %165
  %180 = add nsw i32 %177, %70
  %181 = load i32, i32 addrspace(1)* %84, align 4, !tbaa !5
  br label %193

182:                                              ; preds = %165
  %183 = mul nsw i32 %174, %74
  %184 = sub nsw i32 %177, %183
  %185 = zext i32 %178 to i64
  %186 = getelementptr inbounds i32, i32 addrspace(1)* %60, i64 %185
  %187 = load i32, i32 addrspace(1)* %186, align 4, !tbaa !5
  %188 = sub nsw i32 %187, %183
  %189 = load i32, i32 addrspace(1)* %84, align 4, !tbaa !5
  %190 = sub nsw i32 %189, %183
  %191 = tail call i32 @llvm.smax.i32(i32 %188, i32 %190)
  %192 = tail call i32 @llvm.smax.i32(i32 %184, i32 %191)
  br label %193

193:                                              ; preds = %182, %179
  %194 = phi i32 [ %189, %182 ], [ %181, %179 ]
  %195 = phi i32 [ %192, %182 ], [ %180, %179 ]
  %196 = getelementptr inbounds i32, i32 addrspace(1)* %60, i64 %170
  store i32 %194, i32 addrspace(1)* %196, align 4, !tbaa !5
  store i32 %195, i32 addrspace(1)* %84, align 4, !tbaa !5
  %197 = add i32 %140, 2
  %198 = icmp eq i32 %197, %89
  br i1 %198, label %100, label %138, !llvm.loop !23
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.abs.i32(i32, i1 immarg) #2

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smax.i32(i32, i32) #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

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
!9 = !{}
!10 = !{!11, !15, i64 12}
!11 = !{!"hsa_kernel_dispatch_packet_s", !12, i64 0, !12, i64 2, !12, i64 4, !12, i64 6, !12, i64 8, !12, i64 10, !15, i64 12, !15, i64 16, !15, i64 20, !15, i64 24, !15, i64 28, !16, i64 32, !17, i64 40, !16, i64 48, !18, i64 56}
!12 = !{!"short", !13, i64 0}
!13 = !{!"omnipotent char", !14, i64 0}
!14 = !{!"Simple C/C++ TBAA"}
!15 = !{!"int", !13, i64 0}
!16 = !{!"long", !13, i64 0}
!17 = !{!"any pointer", !13, i64 0}
!18 = !{!"hsa_signal_s", !16, i64 0}
!19 = !{i16 1, i16 1025}
!20 = !{!11, !15, i64 16}
!21 = distinct !{!21, !22}
!22 = !{!"llvm.loop.mustprogress"}
!23 = distinct !{!23, !22}
