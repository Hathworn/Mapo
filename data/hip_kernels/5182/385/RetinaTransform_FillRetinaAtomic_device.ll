; ModuleID = '../data/hip_kernels/5182/385/main.cu'
source_filename = "../data/hip_kernels/5182/385/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: mustprogress nofree norecurse nounwind
define protected amdgpu_kernel void @_Z32RetinaTransform_FillRetinaAtomicPfS_iiS_iS_iiS_(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, i32 %2, i32 %3, float addrspace(1)* nocapture %4, i32 %5, float addrspace(1)* nocapture readonly %6, i32 %7, i32 %8, float addrspace(1)* nocapture %9) local_unnamed_addr #0 {
  %11 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %12 = getelementptr i8, i8 addrspace(4)* %11, i64 4
  %13 = bitcast i8 addrspace(4)* %12 to i16 addrspace(4)*
  %14 = load i16, i16 addrspace(4)* %13, align 4, !range !4, !invariant.load !5
  %15 = zext i16 %14 to i32
  %16 = getelementptr inbounds i8, i8 addrspace(4)* %11, i64 12
  %17 = bitcast i8 addrspace(4)* %16 to i32 addrspace(4)*
  %18 = load i32, i32 addrspace(4)* %17, align 4, !tbaa !6
  %19 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %20 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %21 = udiv i32 %18, %15
  %22 = mul i32 %21, %15
  %23 = icmp ugt i32 %18, %22
  %24 = zext i1 %23 to i32
  %25 = add i32 %21, %24
  %26 = mul i32 %25, %20
  %27 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %28 = add i32 %26, %19
  %29 = mul i32 %28, %15
  %30 = add i32 %29, %27
  %31 = freeze i32 %30
  %32 = freeze i32 %2
  %33 = sdiv i32 %31, %32
  %34 = mul i32 %33, %32
  %35 = sub i32 %31, %34
  %36 = sitofp i32 %2 to float
  %37 = sitofp i32 %3 to float
  %38 = tail call float @llvm.minnum.f32(float %36, float %37)
  %39 = getelementptr inbounds float, float addrspace(1)* %0, i64 2
  %40 = load float, float addrspace(1)* %39, align 4, !tbaa !16, !amdgpu.noclobber !5
  %41 = fmul contract float %38, %40
  %42 = fptosi float %41 to i32
  %43 = load float, float addrspace(1)* %0, align 4, !tbaa !16, !amdgpu.noclobber !5
  %44 = fadd contract float %43, 1.000000e+00
  %45 = fmul contract float %44, %36
  %46 = fmul contract float %45, 5.000000e-01
  %47 = fptosi float %46 to i32
  %48 = getelementptr inbounds float, float addrspace(1)* %0, i64 1
  %49 = load float, float addrspace(1)* %48, align 4, !tbaa !16, !amdgpu.noclobber !5
  %50 = fadd contract float %49, 1.000000e+00
  %51 = fmul contract float %50, %37
  %52 = fmul contract float %51, 5.000000e-01
  %53 = fptosi float %52 to i32
  %54 = add nsw i32 %2, -1
  %55 = add nsw i32 %3, -1
  %56 = tail call i32 @llvm.smin.i32(i32 %54, i32 %55)
  %57 = tail call i32 @llvm.smax.i32(i32 %42, i32 1)
  %58 = tail call i32 @llvm.smin.i32(i32 %56, i32 %57)
  %59 = mul nsw i32 %3, %2
  %60 = icmp slt i32 %30, %59
  br i1 %60, label %61, label %210

61:                                               ; preds = %10
  %62 = icmp sgt i32 %7, 0
  br i1 %62, label %63, label %110

63:                                               ; preds = %61
  %64 = sitofp i32 %58 to float
  %65 = sitofp i32 %47 to float
  %66 = sitofp i32 %53 to float
  %67 = sitofp i32 %35 to float
  %68 = sitofp i32 %33 to float
  %69 = and i32 %7, 3
  %70 = icmp ult i32 %7, 4
  br i1 %70, label %73, label %71

71:                                               ; preds = %63
  %72 = and i32 %7, -4
  br label %119

73:                                               ; preds = %119, %63
  %74 = phi i32 [ undef, %63 ], [ %205, %119 ]
  %75 = phi float [ 0x412E847FC0000000, %63 ], [ %206, %119 ]
  %76 = phi i32 [ 1, %63 ], [ %205, %119 ]
  %77 = phi i32 [ 0, %63 ], [ %207, %119 ]
  %78 = icmp eq i32 %69, 0
  br i1 %78, label %107, label %79

79:                                               ; preds = %73, %79
  %80 = phi float [ %103, %79 ], [ %75, %73 ]
  %81 = phi i32 [ %102, %79 ], [ %76, %73 ]
  %82 = phi i32 [ %104, %79 ], [ %77, %73 ]
  %83 = phi i32 [ %105, %79 ], [ 0, %73 ]
  %84 = mul nsw i32 %82, %8
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds float, float addrspace(1)* %6, i64 %85
  %87 = load float, float addrspace(1)* %86, align 4, !tbaa !16, !amdgpu.noclobber !5
  %88 = fmul contract float %87, %64
  %89 = add nsw i32 %84, 1
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds float, float addrspace(1)* %6, i64 %90
  %92 = load float, float addrspace(1)* %91, align 4, !tbaa !16, !amdgpu.noclobber !5
  %93 = fmul contract float %92, %64
  %94 = fadd contract float %88, %65
  %95 = fadd contract float %93, %66
  %96 = fsub contract float %67, %94
  %97 = fmul contract float %96, %96
  %98 = fsub contract float %68, %95
  %99 = fmul contract float %98, %98
  %100 = fadd contract float %97, %99
  %101 = fcmp contract olt float %100, %80
  %102 = select i1 %101, i32 %82, i32 %81
  %103 = select i1 %101, float %100, float %80
  %104 = add nuw nsw i32 %82, 1
  %105 = add i32 %83, 1
  %106 = icmp eq i32 %105, %69
  br i1 %106, label %107, label %79, !llvm.loop !20

107:                                              ; preds = %79, %73
  %108 = phi i32 [ %74, %73 ], [ %102, %79 ]
  %109 = sext i32 %108 to i64
  br label %110

110:                                              ; preds = %107, %61
  %111 = phi i64 [ 1, %61 ], [ %109, %107 ]
  %112 = getelementptr inbounds float, float addrspace(1)* %4, i64 %111
  %113 = sext i32 %30 to i64
  %114 = getelementptr inbounds float, float addrspace(1)* %1, i64 %113
  %115 = load float, float addrspace(1)* %114, align 4, !tbaa !16, !amdgpu.noclobber !5
  %116 = atomicrmw fadd float addrspace(1)* %112, float %115 syncscope("agent-one-as") monotonic, align 4
  %117 = getelementptr inbounds float, float addrspace(1)* %9, i64 %111
  %118 = atomicrmw fadd float addrspace(1)* %117, float 1.000000e+00 syncscope("agent-one-as") monotonic, align 4
  br label %210

119:                                              ; preds = %119, %71
  %120 = phi float [ 0x412E847FC0000000, %71 ], [ %206, %119 ]
  %121 = phi i32 [ 1, %71 ], [ %205, %119 ]
  %122 = phi i32 [ 0, %71 ], [ %207, %119 ]
  %123 = phi i32 [ 0, %71 ], [ %208, %119 ]
  %124 = mul nsw i32 %122, %8
  %125 = sext i32 %124 to i64
  %126 = getelementptr inbounds float, float addrspace(1)* %6, i64 %125
  %127 = load float, float addrspace(1)* %126, align 4, !tbaa !16, !amdgpu.noclobber !5
  %128 = fmul contract float %127, %64
  %129 = or i32 %124, 1
  %130 = sext i32 %129 to i64
  %131 = getelementptr inbounds float, float addrspace(1)* %6, i64 %130
  %132 = load float, float addrspace(1)* %131, align 4, !tbaa !16, !amdgpu.noclobber !5
  %133 = fmul contract float %132, %64
  %134 = fadd contract float %128, %65
  %135 = fadd contract float %133, %66
  %136 = fsub contract float %67, %134
  %137 = fmul contract float %136, %136
  %138 = fsub contract float %68, %135
  %139 = fmul contract float %138, %138
  %140 = fadd contract float %137, %139
  %141 = fcmp contract olt float %140, %120
  %142 = select i1 %141, i32 %122, i32 %121
  %143 = select i1 %141, float %140, float %120
  %144 = or i32 %122, 1
  %145 = mul nsw i32 %144, %8
  %146 = sext i32 %145 to i64
  %147 = getelementptr inbounds float, float addrspace(1)* %6, i64 %146
  %148 = load float, float addrspace(1)* %147, align 4, !tbaa !16, !amdgpu.noclobber !5
  %149 = fmul contract float %148, %64
  %150 = add nsw i32 %145, 1
  %151 = sext i32 %150 to i64
  %152 = getelementptr inbounds float, float addrspace(1)* %6, i64 %151
  %153 = load float, float addrspace(1)* %152, align 4, !tbaa !16, !amdgpu.noclobber !5
  %154 = fmul contract float %153, %64
  %155 = fadd contract float %149, %65
  %156 = fadd contract float %154, %66
  %157 = fsub contract float %67, %155
  %158 = fmul contract float %157, %157
  %159 = fsub contract float %68, %156
  %160 = fmul contract float %159, %159
  %161 = fadd contract float %158, %160
  %162 = fcmp contract olt float %161, %143
  %163 = select i1 %162, i32 %144, i32 %142
  %164 = select i1 %162, float %161, float %143
  %165 = or i32 %122, 2
  %166 = mul nsw i32 %165, %8
  %167 = sext i32 %166 to i64
  %168 = getelementptr inbounds float, float addrspace(1)* %6, i64 %167
  %169 = load float, float addrspace(1)* %168, align 4, !tbaa !16, !amdgpu.noclobber !5
  %170 = fmul contract float %169, %64
  %171 = or i32 %166, 1
  %172 = sext i32 %171 to i64
  %173 = getelementptr inbounds float, float addrspace(1)* %6, i64 %172
  %174 = load float, float addrspace(1)* %173, align 4, !tbaa !16, !amdgpu.noclobber !5
  %175 = fmul contract float %174, %64
  %176 = fadd contract float %170, %65
  %177 = fadd contract float %175, %66
  %178 = fsub contract float %67, %176
  %179 = fmul contract float %178, %178
  %180 = fsub contract float %68, %177
  %181 = fmul contract float %180, %180
  %182 = fadd contract float %179, %181
  %183 = fcmp contract olt float %182, %164
  %184 = select i1 %183, i32 %165, i32 %163
  %185 = select i1 %183, float %182, float %164
  %186 = or i32 %122, 3
  %187 = mul nsw i32 %186, %8
  %188 = sext i32 %187 to i64
  %189 = getelementptr inbounds float, float addrspace(1)* %6, i64 %188
  %190 = load float, float addrspace(1)* %189, align 4, !tbaa !16, !amdgpu.noclobber !5
  %191 = fmul contract float %190, %64
  %192 = add nsw i32 %187, 1
  %193 = sext i32 %192 to i64
  %194 = getelementptr inbounds float, float addrspace(1)* %6, i64 %193
  %195 = load float, float addrspace(1)* %194, align 4, !tbaa !16, !amdgpu.noclobber !5
  %196 = fmul contract float %195, %64
  %197 = fadd contract float %191, %65
  %198 = fadd contract float %196, %66
  %199 = fsub contract float %67, %197
  %200 = fmul contract float %199, %199
  %201 = fsub contract float %68, %198
  %202 = fmul contract float %201, %201
  %203 = fadd contract float %200, %202
  %204 = fcmp contract olt float %203, %185
  %205 = select i1 %204, i32 %186, i32 %184
  %206 = select i1 %204, float %203, float %185
  %207 = add nuw nsw i32 %122, 4
  %208 = add i32 %123, 4
  %209 = icmp eq i32 %208, %72
  br i1 %209, label %73, label %119, !llvm.loop !22

210:                                              ; preds = %110, %10
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.minnum.f32(float, float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smin.i32(i32, i32) #3

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smax.i32(i32, i32) #3

attributes #0 = { mustprogress nofree norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

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
!16 = !{!17, !17, i64 0}
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.unroll.disable"}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.mustprogress"}
