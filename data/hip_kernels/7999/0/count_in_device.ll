; ModuleID = '../data/hip_kernels/7999/0/main.cu'
source_filename = "../data/hip_kernels/7999/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: mustprogress nofree norecurse nounwind
define protected amdgpu_kernel void @_Z8count_inPyllldl(i64 addrspace(1)* nocapture %0, i64 %1, i64 %2, i64 %3, double %4, i64 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr inbounds i8, i8 addrspace(4)* %8, i64 12
  %10 = bitcast i8 addrspace(4)* %9 to i32 addrspace(4)*
  %11 = load i32, i32 addrspace(4)* %10, align 4, !tbaa !4
  %12 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %13 = bitcast i8 addrspace(4)* %12 to i16 addrspace(4)*
  %14 = load i16, i16 addrspace(4)* %13, align 4, !range !13, !invariant.load !14
  %15 = zext i16 %14 to i32
  %16 = udiv i32 %11, %15
  %17 = mul i32 %16, %15
  %18 = icmp ugt i32 %11, %17
  %19 = zext i1 %18 to i32
  %20 = add i32 %16, %19
  %21 = mul i32 %20, %7
  %22 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %23 = add i32 %21, %22
  %24 = zext i32 %23 to i64
  %25 = zext i16 %14 to i64
  %26 = mul nuw nsw i64 %24, %25
  %27 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %28 = zext i32 %27 to i64
  %29 = add nuw nsw i64 %26, %28
  %30 = icmp ult i64 %29, %1
  br i1 %30, label %31, label %188

31:                                               ; preds = %6
  %32 = icmp sgt i64 %2, 0
  br i1 %32, label %33, label %51

33:                                               ; preds = %31
  %34 = and i64 %2, 7
  %35 = icmp ult i64 %2, 8
  br i1 %35, label %38, label %36

36:                                               ; preds = %33
  %37 = and i64 %2, -8
  br label %54

38:                                               ; preds = %54, %33
  %39 = phi i64 [ 0, %33 ], [ %81, %54 ]
  %40 = phi <11 x i64> [ undef, %33 ], [ %80, %54 ]
  %41 = icmp eq i64 %34, 0
  br i1 %41, label %51, label %42

42:                                               ; preds = %38, %42
  %43 = phi i64 [ %48, %42 ], [ %39, %38 ]
  %44 = phi <11 x i64> [ %47, %42 ], [ %40, %38 ]
  %45 = phi i64 [ %49, %42 ], [ 0, %38 ]
  %46 = trunc i64 %43 to i32
  %47 = insertelement <11 x i64> %44, i64 0, i32 %46
  %48 = add nuw nsw i64 %43, 1
  %49 = add i64 %45, 1
  %50 = icmp eq i64 %49, %34
  br i1 %50, label %51, label %42, !llvm.loop !16

51:                                               ; preds = %38, %42, %31
  %52 = phi <11 x i64> [ undef, %31 ], [ %40, %38 ], [ %47, %42 ]
  %53 = icmp eq i64 %29, 0
  br i1 %53, label %84, label %91

54:                                               ; preds = %54, %36
  %55 = phi i64 [ 0, %36 ], [ %81, %54 ]
  %56 = phi <11 x i64> [ undef, %36 ], [ %80, %54 ]
  %57 = phi i64 [ 0, %36 ], [ %82, %54 ]
  %58 = trunc i64 %55 to i32
  %59 = insertelement <11 x i64> %56, i64 0, i32 %58
  %60 = trunc i64 %55 to i32
  %61 = or i32 %60, 1
  %62 = insertelement <11 x i64> %59, i64 0, i32 %61
  %63 = trunc i64 %55 to i32
  %64 = or i32 %63, 2
  %65 = insertelement <11 x i64> %62, i64 0, i32 %64
  %66 = trunc i64 %55 to i32
  %67 = or i32 %66, 3
  %68 = insertelement <11 x i64> %65, i64 0, i32 %67
  %69 = trunc i64 %55 to i32
  %70 = or i32 %69, 4
  %71 = insertelement <11 x i64> %68, i64 0, i32 %70
  %72 = trunc i64 %55 to i32
  %73 = or i32 %72, 5
  %74 = insertelement <11 x i64> %71, i64 0, i32 %73
  %75 = trunc i64 %55 to i32
  %76 = or i32 %75, 6
  %77 = insertelement <11 x i64> %74, i64 0, i32 %76
  %78 = trunc i64 %55 to i32
  %79 = or i32 %78, 7
  %80 = insertelement <11 x i64> %77, i64 0, i32 %79
  %81 = add nuw nsw i64 %55, 8
  %82 = add i64 %57, 8
  %83 = icmp eq i64 %82, %37
  br i1 %83, label %38, label %54, !llvm.loop !18

84:                                               ; preds = %91, %51
  %85 = phi <11 x i64> [ %52, %51 ], [ %100, %91 ]
  br i1 %32, label %86, label %121

86:                                               ; preds = %84
  %87 = and i64 %2, 7
  %88 = icmp ult i64 %2, 8
  br i1 %88, label %103, label %89

89:                                               ; preds = %86
  %90 = and i64 %2, -8
  br label %124

91:                                               ; preds = %51, %91
  %92 = phi i64 [ %97, %91 ], [ %29, %51 ]
  %93 = phi i32 [ %101, %91 ], [ 0, %51 ]
  %94 = phi <11 x i64> [ %100, %91 ], [ %52, %51 ]
  %95 = freeze i64 %92
  %96 = freeze i64 %5
  %97 = udiv i64 %95, %96
  %98 = mul i64 %97, %96
  %99 = sub i64 %95, %98
  %100 = insertelement <11 x i64> %94, i64 %99, i32 %93
  %101 = add i32 %93, 1
  %102 = icmp ult i64 %92, %5
  br i1 %102, label %84, label %91, !llvm.loop !20

103:                                              ; preds = %124, %86
  %104 = phi double [ undef, %86 ], [ %182, %124 ]
  %105 = phi i64 [ 0, %86 ], [ %183, %124 ]
  %106 = phi double [ 0.000000e+00, %86 ], [ %182, %124 ]
  %107 = icmp eq i64 %87, 0
  br i1 %107, label %121, label %108

108:                                              ; preds = %103, %108
  %109 = phi i64 [ %118, %108 ], [ %105, %103 ]
  %110 = phi double [ %117, %108 ], [ %106, %103 ]
  %111 = phi i64 [ %119, %108 ], [ 0, %103 ]
  %112 = trunc i64 %109 to i32
  %113 = extractelement <11 x i64> %85, i32 %112
  %114 = sub nsw i64 %113, %3
  %115 = sitofp i64 %114 to double
  %116 = fmul contract double %115, %115
  %117 = fadd contract double %110, %116
  %118 = add nuw nsw i64 %109, 1
  %119 = add i64 %111, 1
  %120 = icmp eq i64 %119, %87
  br i1 %120, label %121, label %108, !llvm.loop !21

121:                                              ; preds = %103, %108, %84
  %122 = phi double [ 0.000000e+00, %84 ], [ %104, %103 ], [ %117, %108 ]
  %123 = fcmp contract olt double %122, %4
  br i1 %123, label %186, label %188

124:                                              ; preds = %124, %89
  %125 = phi i64 [ 0, %89 ], [ %183, %124 ]
  %126 = phi double [ 0.000000e+00, %89 ], [ %182, %124 ]
  %127 = phi i64 [ 0, %89 ], [ %184, %124 ]
  %128 = trunc i64 %125 to i32
  %129 = extractelement <11 x i64> %85, i32 %128
  %130 = sub nsw i64 %129, %3
  %131 = sitofp i64 %130 to double
  %132 = fmul contract double %131, %131
  %133 = fadd contract double %126, %132
  %134 = trunc i64 %125 to i32
  %135 = or i32 %134, 1
  %136 = extractelement <11 x i64> %85, i32 %135
  %137 = sub nsw i64 %136, %3
  %138 = sitofp i64 %137 to double
  %139 = fmul contract double %138, %138
  %140 = fadd contract double %133, %139
  %141 = trunc i64 %125 to i32
  %142 = or i32 %141, 2
  %143 = extractelement <11 x i64> %85, i32 %142
  %144 = sub nsw i64 %143, %3
  %145 = sitofp i64 %144 to double
  %146 = fmul contract double %145, %145
  %147 = fadd contract double %140, %146
  %148 = trunc i64 %125 to i32
  %149 = or i32 %148, 3
  %150 = extractelement <11 x i64> %85, i32 %149
  %151 = sub nsw i64 %150, %3
  %152 = sitofp i64 %151 to double
  %153 = fmul contract double %152, %152
  %154 = fadd contract double %147, %153
  %155 = trunc i64 %125 to i32
  %156 = or i32 %155, 4
  %157 = extractelement <11 x i64> %85, i32 %156
  %158 = sub nsw i64 %157, %3
  %159 = sitofp i64 %158 to double
  %160 = fmul contract double %159, %159
  %161 = fadd contract double %154, %160
  %162 = trunc i64 %125 to i32
  %163 = or i32 %162, 5
  %164 = extractelement <11 x i64> %85, i32 %163
  %165 = sub nsw i64 %164, %3
  %166 = sitofp i64 %165 to double
  %167 = fmul contract double %166, %166
  %168 = fadd contract double %161, %167
  %169 = trunc i64 %125 to i32
  %170 = or i32 %169, 6
  %171 = extractelement <11 x i64> %85, i32 %170
  %172 = sub nsw i64 %171, %3
  %173 = sitofp i64 %172 to double
  %174 = fmul contract double %173, %173
  %175 = fadd contract double %168, %174
  %176 = trunc i64 %125 to i32
  %177 = or i32 %176, 7
  %178 = extractelement <11 x i64> %85, i32 %177
  %179 = sub nsw i64 %178, %3
  %180 = sitofp i64 %179 to double
  %181 = fmul contract double %180, %180
  %182 = fadd contract double %175, %181
  %183 = add nuw nsw i64 %125, 8
  %184 = add i64 %127, 8
  %185 = icmp eq i64 %184, %90
  br i1 %185, label %103, label %124, !llvm.loop !22

186:                                              ; preds = %121
  %187 = atomicrmw add i64 addrspace(1)* %0, i64 1 syncscope("agent-one-as") monotonic, align 8
  br label %188

188:                                              ; preds = %121, %186, %6
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

attributes #0 = { mustprogress nofree norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!16 = distinct !{!16, !17}
!17 = !{!"llvm.loop.unroll.disable"}
!18 = distinct !{!18, !19}
!19 = !{!"llvm.loop.mustprogress"}
!20 = distinct !{!20, !19}
!21 = distinct !{!21, !17}
!22 = distinct !{!22, !19}
