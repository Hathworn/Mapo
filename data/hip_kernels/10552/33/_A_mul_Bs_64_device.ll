; ModuleID = '../data/hip_kernels/10552/33/main.cu'
source_filename = "../data/hip_kernels/10552/33/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z12_A_mul_Bs_64iiPdS_PiS0_S_(i32 %0, i32 %1, double addrspace(1)* nocapture readonly %2, double addrspace(1)* nocapture readonly %3, i32 addrspace(1)* nocapture readonly %4, i32 addrspace(1)* nocapture readonly %5, double addrspace(1)* nocapture %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !5, !invariant.load !6
  %14 = zext i16 %13 to i32
  %15 = getelementptr inbounds i8, i8 addrspace(4)* %10, i64 12
  %16 = bitcast i8 addrspace(4)* %15 to i32 addrspace(4)*
  %17 = load i32, i32 addrspace(4)* %16, align 4, !tbaa !7
  %18 = mul i32 %9, %14
  %19 = add i32 %18, %8
  %20 = icmp slt i32 %19, %1
  br i1 %20, label %21, label %182

21:                                               ; preds = %7
  %22 = icmp sgt i32 %0, 0
  %23 = udiv i32 %17, %14
  %24 = mul i32 %23, %14
  %25 = icmp ugt i32 %17, %24
  %26 = zext i1 %25 to i32
  %27 = add i32 %23, %26
  %28 = mul i32 %27, %14
  %29 = and i32 %0, 7
  %30 = icmp ult i32 %0, 8
  %31 = and i32 %0, -8
  %32 = icmp eq i32 %29, 0
  br label %33

33:                                               ; preds = %21, %179
  %34 = phi i32 [ %19, %21 ], [ %180, %179 ]
  %35 = mul nsw i32 %34, %0
  %36 = add nsw i32 %35, %0
  br i1 %22, label %37, label %43

37:                                               ; preds = %33, %37
  %38 = phi i32 [ %41, %37 ], [ %35, %33 ]
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds double, double addrspace(1)* %6, i64 %39
  store double 0.000000e+00, double addrspace(1)* %40, align 8, !tbaa !16
  %41 = add nsw i32 %38, 1
  %42 = icmp slt i32 %41, %36
  br i1 %42, label %37, label %43, !llvm.loop !20

43:                                               ; preds = %37, %33
  %44 = sext i32 %34 to i64
  %45 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %44
  %46 = load i32, i32 addrspace(1)* %45, align 4, !tbaa !22, !amdgpu.noclobber !6
  %47 = add nsw i32 %34, 1
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %48
  %50 = load i32, i32 addrspace(1)* %49, align 4, !tbaa !22, !amdgpu.noclobber !6
  %51 = add nsw i32 %50, -1
  %52 = icmp slt i32 %46, %50
  br i1 %52, label %53, label %179

53:                                               ; preds = %43
  %54 = add nsw i32 %46, -1
  br label %55

55:                                               ; preds = %53, %176
  %56 = phi i32 [ %177, %176 ], [ %54, %53 ]
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %57
  %59 = load i32, i32 addrspace(1)* %58, align 4, !tbaa !22, !amdgpu.noclobber !6
  %60 = add nsw i32 %59, -1
  %61 = getelementptr inbounds double, double addrspace(1)* %3, i64 %57
  %62 = load double, double addrspace(1)* %61, align 8, !tbaa !16
  %63 = mul nsw i32 %60, %0
  br i1 %22, label %64, label %176

64:                                               ; preds = %55
  br i1 %30, label %158, label %65

65:                                               ; preds = %64, %65
  %66 = phi i32 [ %155, %65 ], [ 0, %64 ]
  %67 = phi i32 [ %156, %65 ], [ 0, %64 ]
  %68 = add nsw i32 %66, %63
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds double, double addrspace(1)* %2, i64 %69
  %71 = load double, double addrspace(1)* %70, align 8, !tbaa !16
  %72 = fmul contract double %62, %71
  %73 = add nsw i32 %66, %35
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds double, double addrspace(1)* %6, i64 %74
  %76 = load double, double addrspace(1)* %75, align 8, !tbaa !16
  %77 = fadd contract double %76, %72
  store double %77, double addrspace(1)* %75, align 8, !tbaa !16
  %78 = or i32 %66, 1
  %79 = add nsw i32 %78, %63
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds double, double addrspace(1)* %2, i64 %80
  %82 = load double, double addrspace(1)* %81, align 8, !tbaa !16
  %83 = fmul contract double %62, %82
  %84 = add nsw i32 %78, %35
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds double, double addrspace(1)* %6, i64 %85
  %87 = load double, double addrspace(1)* %86, align 8, !tbaa !16
  %88 = fadd contract double %87, %83
  store double %88, double addrspace(1)* %86, align 8, !tbaa !16
  %89 = or i32 %66, 2
  %90 = add nsw i32 %89, %63
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds double, double addrspace(1)* %2, i64 %91
  %93 = load double, double addrspace(1)* %92, align 8, !tbaa !16
  %94 = fmul contract double %62, %93
  %95 = add nsw i32 %89, %35
  %96 = sext i32 %95 to i64
  %97 = getelementptr inbounds double, double addrspace(1)* %6, i64 %96
  %98 = load double, double addrspace(1)* %97, align 8, !tbaa !16
  %99 = fadd contract double %98, %94
  store double %99, double addrspace(1)* %97, align 8, !tbaa !16
  %100 = or i32 %66, 3
  %101 = add nsw i32 %100, %63
  %102 = sext i32 %101 to i64
  %103 = getelementptr inbounds double, double addrspace(1)* %2, i64 %102
  %104 = load double, double addrspace(1)* %103, align 8, !tbaa !16
  %105 = fmul contract double %62, %104
  %106 = add nsw i32 %100, %35
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds double, double addrspace(1)* %6, i64 %107
  %109 = load double, double addrspace(1)* %108, align 8, !tbaa !16
  %110 = fadd contract double %109, %105
  store double %110, double addrspace(1)* %108, align 8, !tbaa !16
  %111 = or i32 %66, 4
  %112 = add nsw i32 %111, %63
  %113 = sext i32 %112 to i64
  %114 = getelementptr inbounds double, double addrspace(1)* %2, i64 %113
  %115 = load double, double addrspace(1)* %114, align 8, !tbaa !16
  %116 = fmul contract double %62, %115
  %117 = add nsw i32 %111, %35
  %118 = sext i32 %117 to i64
  %119 = getelementptr inbounds double, double addrspace(1)* %6, i64 %118
  %120 = load double, double addrspace(1)* %119, align 8, !tbaa !16
  %121 = fadd contract double %120, %116
  store double %121, double addrspace(1)* %119, align 8, !tbaa !16
  %122 = or i32 %66, 5
  %123 = add nsw i32 %122, %63
  %124 = sext i32 %123 to i64
  %125 = getelementptr inbounds double, double addrspace(1)* %2, i64 %124
  %126 = load double, double addrspace(1)* %125, align 8, !tbaa !16
  %127 = fmul contract double %62, %126
  %128 = add nsw i32 %122, %35
  %129 = sext i32 %128 to i64
  %130 = getelementptr inbounds double, double addrspace(1)* %6, i64 %129
  %131 = load double, double addrspace(1)* %130, align 8, !tbaa !16
  %132 = fadd contract double %131, %127
  store double %132, double addrspace(1)* %130, align 8, !tbaa !16
  %133 = or i32 %66, 6
  %134 = add nsw i32 %133, %63
  %135 = sext i32 %134 to i64
  %136 = getelementptr inbounds double, double addrspace(1)* %2, i64 %135
  %137 = load double, double addrspace(1)* %136, align 8, !tbaa !16
  %138 = fmul contract double %62, %137
  %139 = add nsw i32 %133, %35
  %140 = sext i32 %139 to i64
  %141 = getelementptr inbounds double, double addrspace(1)* %6, i64 %140
  %142 = load double, double addrspace(1)* %141, align 8, !tbaa !16
  %143 = fadd contract double %142, %138
  store double %143, double addrspace(1)* %141, align 8, !tbaa !16
  %144 = or i32 %66, 7
  %145 = add nsw i32 %144, %63
  %146 = sext i32 %145 to i64
  %147 = getelementptr inbounds double, double addrspace(1)* %2, i64 %146
  %148 = load double, double addrspace(1)* %147, align 8, !tbaa !16
  %149 = fmul contract double %62, %148
  %150 = add nsw i32 %144, %35
  %151 = sext i32 %150 to i64
  %152 = getelementptr inbounds double, double addrspace(1)* %6, i64 %151
  %153 = load double, double addrspace(1)* %152, align 8, !tbaa !16
  %154 = fadd contract double %153, %149
  store double %154, double addrspace(1)* %152, align 8, !tbaa !16
  %155 = add nuw nsw i32 %66, 8
  %156 = add i32 %67, 8
  %157 = icmp eq i32 %156, %31
  br i1 %157, label %158, label %65, !llvm.loop !24

158:                                              ; preds = %65, %64
  %159 = phi i32 [ 0, %64 ], [ %155, %65 ]
  br i1 %32, label %176, label %160

160:                                              ; preds = %158, %160
  %161 = phi i32 [ %173, %160 ], [ %159, %158 ]
  %162 = phi i32 [ %174, %160 ], [ 0, %158 ]
  %163 = add nsw i32 %161, %63
  %164 = sext i32 %163 to i64
  %165 = getelementptr inbounds double, double addrspace(1)* %2, i64 %164
  %166 = load double, double addrspace(1)* %165, align 8, !tbaa !16
  %167 = fmul contract double %62, %166
  %168 = add nsw i32 %161, %35
  %169 = sext i32 %168 to i64
  %170 = getelementptr inbounds double, double addrspace(1)* %6, i64 %169
  %171 = load double, double addrspace(1)* %170, align 8, !tbaa !16
  %172 = fadd contract double %171, %167
  store double %172, double addrspace(1)* %170, align 8, !tbaa !16
  %173 = add nuw nsw i32 %161, 1
  %174 = add i32 %162, 1
  %175 = icmp eq i32 %174, %29
  br i1 %175, label %176, label %160, !llvm.loop !25

176:                                              ; preds = %158, %160, %55
  %177 = add nsw i32 %56, 1
  %178 = icmp slt i32 %177, %51
  br i1 %178, label %55, label %179, !llvm.loop !27

179:                                              ; preds = %176, %43
  %180 = add i32 %28, %34
  %181 = icmp slt i32 %180, %1
  br i1 %181, label %33, label %182, !llvm.loop !28

182:                                              ; preds = %179, %7
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
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !12, i64 12}
!8 = !{!"hsa_kernel_dispatch_packet_s", !9, i64 0, !9, i64 2, !9, i64 4, !9, i64 6, !9, i64 8, !9, i64 10, !12, i64 12, !12, i64 16, !12, i64 20, !12, i64 24, !12, i64 28, !13, i64 32, !14, i64 40, !13, i64 48, !15, i64 56}
!9 = !{!"short", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C/C++ TBAA"}
!12 = !{!"int", !10, i64 0}
!13 = !{!"long", !10, i64 0}
!14 = !{!"any pointer", !10, i64 0}
!15 = !{!"hsa_signal_s", !13, i64 0}
!16 = !{!17, !17, i64 0}
!17 = !{!"double", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
!22 = !{!23, !23, i64 0}
!23 = !{!"int", !18, i64 0}
!24 = distinct !{!24, !21}
!25 = distinct !{!25, !26}
!26 = !{!"llvm.loop.unroll.disable"}
!27 = distinct !{!27, !21}
!28 = distinct !{!28, !21}
