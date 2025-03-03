; ModuleID = '../data/hip_kernels/18004/8/main.cu'
source_filename = "../data/hip_kernels/18004/8/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z8convolvePhPfiiiiiiS_(i8 addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, i32 %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, i8 addrspace(1)* nocapture writeonly %8) local_unnamed_addr #0 {
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %12 = getelementptr i8, i8 addrspace(4)* %11, i64 4
  %13 = bitcast i8 addrspace(4)* %12 to i16 addrspace(4)*
  %14 = load i16, i16 addrspace(4)* %13, align 4, !range !4, !invariant.load !5
  %15 = zext i16 %14 to i32
  %16 = getelementptr inbounds i8, i8 addrspace(4)* %11, i64 12
  %17 = bitcast i8 addrspace(4)* %16 to i32 addrspace(4)*
  %18 = load i32, i32 addrspace(4)* %17, align 4, !tbaa !6
  %19 = mul i32 %10, %15
  %20 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %21 = add i32 %19, %20
  %22 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %23 = getelementptr i8, i8 addrspace(4)* %11, i64 6
  %24 = bitcast i8 addrspace(4)* %23 to i16 addrspace(4)*
  %25 = load i16, i16 addrspace(4)* %24, align 2, !range !4, !invariant.load !5
  %26 = zext i16 %25 to i32
  %27 = getelementptr inbounds i8, i8 addrspace(4)* %11, i64 16
  %28 = bitcast i8 addrspace(4)* %27 to i32 addrspace(4)*
  %29 = load i32, i32 addrspace(4)* %28, align 8, !tbaa !16
  %30 = mul i32 %22, %26
  %31 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !15
  %32 = add i32 %30, %31
  %33 = sdiv i32 %6, 2
  %34 = sdiv i32 %7, 2
  %35 = add i32 %33, %4
  %36 = icmp slt i32 %21, %35
  %37 = add i32 %34, %5
  %38 = icmp slt i32 %32, %37
  %39 = select i1 %36, i1 true, i1 %38
  br i1 %39, label %207, label %40

40:                                               ; preds = %9
  %41 = udiv i32 %18, %15
  %42 = mul i32 %41, %15
  %43 = icmp ugt i32 %18, %42
  %44 = zext i1 %43 to i32
  %45 = add i32 %41, %44
  %46 = mul i32 %45, %15
  %47 = sub i32 %46, %35
  %48 = icmp ult i32 %21, %47
  br i1 %48, label %49, label %207

49:                                               ; preds = %40
  %50 = udiv i32 %29, %26
  %51 = mul i32 %50, %26
  %52 = icmp ugt i32 %29, %51
  %53 = zext i1 %52 to i32
  %54 = add i32 %50, %53
  %55 = mul i32 %54, %26
  %56 = sub i32 %55, %37
  %57 = icmp uge i32 %32, %56
  %58 = icmp slt i32 %7, -1
  %59 = select i1 %57, i1 true, i1 %58
  br i1 %59, label %207, label %60

60:                                               ; preds = %49
  %61 = sub nsw i32 0, %34
  %62 = sub nsw i32 0, %33
  %63 = icmp slt i32 %6, -1
  %64 = tail call i32 @llvm.abs.i32(i32 %33, i1 true)
  %65 = tail call i32 @llvm.abs.i32(i32 %34, i1 true)
  %66 = add i32 %33, %64
  %67 = add i32 %66, 1
  %68 = and i32 %67, 7
  %69 = icmp eq i32 %68, 0
  %70 = icmp ult i32 %66, 7
  br label %71

71:                                               ; preds = %60, %103
  %72 = phi float [ 0.000000e+00, %60 ], [ %104, %103 ]
  %73 = phi i32 [ %61, %60 ], [ %105, %103 ]
  br i1 %63, label %103, label %74

74:                                               ; preds = %71
  %75 = add nsw i32 %73, %34
  %76 = mul nsw i32 %75, %6
  %77 = add i32 %76, %33
  %78 = add nsw i32 %73, %32
  %79 = mul nsw i32 %78, %2
  %80 = add i32 %79, %21
  br i1 %69, label %99, label %81

81:                                               ; preds = %74, %81
  %82 = phi float [ %95, %81 ], [ %72, %74 ]
  %83 = phi i32 [ %96, %81 ], [ %62, %74 ]
  %84 = phi i32 [ %97, %81 ], [ 0, %74 ]
  %85 = add i32 %77, %83
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds float, float addrspace(1)* %1, i64 %86
  %88 = load float, float addrspace(1)* %87, align 4, !tbaa !17, !amdgpu.noclobber !5
  %89 = add i32 %80, %83
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %90
  %92 = load i8, i8 addrspace(1)* %91, align 1, !tbaa !21, !amdgpu.noclobber !5
  %93 = uitofp i8 %92 to float
  %94 = fmul contract float %88, %93
  %95 = fadd contract float %82, %94
  %96 = add i32 %83, 1
  %97 = add i32 %84, 1
  %98 = icmp eq i32 %97, %68
  br i1 %98, label %99, label %81, !llvm.loop !22

99:                                               ; preds = %81, %74
  %100 = phi float [ undef, %74 ], [ %95, %81 ]
  %101 = phi float [ %72, %74 ], [ %95, %81 ]
  %102 = phi i32 [ %62, %74 ], [ %96, %81 ]
  br i1 %70, label %103, label %107

103:                                              ; preds = %99, %107, %71
  %104 = phi float [ %72, %71 ], [ %100, %99 ], [ %204, %107 ]
  %105 = add i32 %73, 1
  %106 = icmp eq i32 %73, %65
  br i1 %106, label %207, label %71, !llvm.loop !24

107:                                              ; preds = %99, %107
  %108 = phi float [ %204, %107 ], [ %101, %99 ]
  %109 = phi i32 [ %205, %107 ], [ %102, %99 ]
  %110 = add i32 %77, %109
  %111 = sext i32 %110 to i64
  %112 = getelementptr inbounds float, float addrspace(1)* %1, i64 %111
  %113 = load float, float addrspace(1)* %112, align 4, !tbaa !17, !amdgpu.noclobber !5
  %114 = add i32 %80, %109
  %115 = sext i32 %114 to i64
  %116 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %115
  %117 = load i8, i8 addrspace(1)* %116, align 1, !tbaa !21, !amdgpu.noclobber !5
  %118 = uitofp i8 %117 to float
  %119 = fmul contract float %113, %118
  %120 = fadd contract float %108, %119
  %121 = add i32 %109, 1
  %122 = add i32 %77, %121
  %123 = sext i32 %122 to i64
  %124 = getelementptr inbounds float, float addrspace(1)* %1, i64 %123
  %125 = load float, float addrspace(1)* %124, align 4, !tbaa !17, !amdgpu.noclobber !5
  %126 = add i32 %80, %121
  %127 = sext i32 %126 to i64
  %128 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %127
  %129 = load i8, i8 addrspace(1)* %128, align 1, !tbaa !21, !amdgpu.noclobber !5
  %130 = uitofp i8 %129 to float
  %131 = fmul contract float %125, %130
  %132 = fadd contract float %120, %131
  %133 = add i32 %109, 2
  %134 = add i32 %77, %133
  %135 = sext i32 %134 to i64
  %136 = getelementptr inbounds float, float addrspace(1)* %1, i64 %135
  %137 = load float, float addrspace(1)* %136, align 4, !tbaa !17, !amdgpu.noclobber !5
  %138 = add i32 %80, %133
  %139 = sext i32 %138 to i64
  %140 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %139
  %141 = load i8, i8 addrspace(1)* %140, align 1, !tbaa !21, !amdgpu.noclobber !5
  %142 = uitofp i8 %141 to float
  %143 = fmul contract float %137, %142
  %144 = fadd contract float %132, %143
  %145 = add i32 %109, 3
  %146 = add i32 %77, %145
  %147 = sext i32 %146 to i64
  %148 = getelementptr inbounds float, float addrspace(1)* %1, i64 %147
  %149 = load float, float addrspace(1)* %148, align 4, !tbaa !17, !amdgpu.noclobber !5
  %150 = add i32 %80, %145
  %151 = sext i32 %150 to i64
  %152 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %151
  %153 = load i8, i8 addrspace(1)* %152, align 1, !tbaa !21, !amdgpu.noclobber !5
  %154 = uitofp i8 %153 to float
  %155 = fmul contract float %149, %154
  %156 = fadd contract float %144, %155
  %157 = add i32 %109, 4
  %158 = add i32 %77, %157
  %159 = sext i32 %158 to i64
  %160 = getelementptr inbounds float, float addrspace(1)* %1, i64 %159
  %161 = load float, float addrspace(1)* %160, align 4, !tbaa !17, !amdgpu.noclobber !5
  %162 = add i32 %80, %157
  %163 = sext i32 %162 to i64
  %164 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %163
  %165 = load i8, i8 addrspace(1)* %164, align 1, !tbaa !21, !amdgpu.noclobber !5
  %166 = uitofp i8 %165 to float
  %167 = fmul contract float %161, %166
  %168 = fadd contract float %156, %167
  %169 = add i32 %109, 5
  %170 = add i32 %77, %169
  %171 = sext i32 %170 to i64
  %172 = getelementptr inbounds float, float addrspace(1)* %1, i64 %171
  %173 = load float, float addrspace(1)* %172, align 4, !tbaa !17, !amdgpu.noclobber !5
  %174 = add i32 %80, %169
  %175 = sext i32 %174 to i64
  %176 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %175
  %177 = load i8, i8 addrspace(1)* %176, align 1, !tbaa !21, !amdgpu.noclobber !5
  %178 = uitofp i8 %177 to float
  %179 = fmul contract float %173, %178
  %180 = fadd contract float %168, %179
  %181 = add i32 %109, 6
  %182 = add i32 %77, %181
  %183 = sext i32 %182 to i64
  %184 = getelementptr inbounds float, float addrspace(1)* %1, i64 %183
  %185 = load float, float addrspace(1)* %184, align 4, !tbaa !17, !amdgpu.noclobber !5
  %186 = add i32 %80, %181
  %187 = sext i32 %186 to i64
  %188 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %187
  %189 = load i8, i8 addrspace(1)* %188, align 1, !tbaa !21, !amdgpu.noclobber !5
  %190 = uitofp i8 %189 to float
  %191 = fmul contract float %185, %190
  %192 = fadd contract float %180, %191
  %193 = add i32 %109, 7
  %194 = add i32 %77, %193
  %195 = sext i32 %194 to i64
  %196 = getelementptr inbounds float, float addrspace(1)* %1, i64 %195
  %197 = load float, float addrspace(1)* %196, align 4, !tbaa !17, !amdgpu.noclobber !5
  %198 = add i32 %80, %193
  %199 = sext i32 %198 to i64
  %200 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %199
  %201 = load i8, i8 addrspace(1)* %200, align 1, !tbaa !21, !amdgpu.noclobber !5
  %202 = uitofp i8 %201 to float
  %203 = fmul contract float %197, %202
  %204 = fadd contract float %192, %203
  %205 = add i32 %109, 8
  %206 = icmp eq i32 %193, %64
  br i1 %206, label %103, label %107, !llvm.loop !26

207:                                              ; preds = %103, %49, %40, %9
  %208 = phi float [ 0.000000e+00, %49 ], [ 0.000000e+00, %40 ], [ 0.000000e+00, %9 ], [ %104, %103 ]
  %209 = fptoui float %208 to i8
  %210 = mul nsw i32 %32, %2
  %211 = add nsw i32 %210, %21
  %212 = sext i32 %211 to i64
  %213 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 %212
  store i8 %209, i8 addrspace(1)* %213, align 1, !tbaa !21
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.abs.i32(i32, i1 immarg) #2

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
!16 = !{!7, !11, i64 16}
!17 = !{!18, !18, i64 0}
!18 = !{!"float", !19, i64 0}
!19 = !{!"omnipotent char", !20, i64 0}
!20 = !{!"Simple C++ TBAA"}
!21 = !{!19, !19, i64 0}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.unroll.disable"}
!24 = distinct !{!24, !25}
!25 = !{!"llvm.loop.mustprogress"}
!26 = distinct !{!26, !25}
