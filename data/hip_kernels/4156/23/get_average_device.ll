; ModuleID = '../data/hip_kernels/4156/23/main.cu'
source_filename = "../data/hip_kernels/4156/23/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: mustprogress nofree norecurse nounwind
define protected amdgpu_kernel void @_Z11get_averagePhPiS0_i(i8 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture %1, i32 addrspace(1)* nocapture %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = shl i32 %5, 5
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = add i32 %6, %7
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %10 = shl i32 %9, 5
  %11 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %12 = add i32 %10, %11
  %13 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %14 = getelementptr inbounds i8, i8 addrspace(4)* %13, i64 12
  %15 = bitcast i8 addrspace(4)* %14 to i32 addrspace(4)*
  %16 = load i32, i32 addrspace(4)* %15, align 4, !tbaa !5
  %17 = getelementptr i8, i8 addrspace(4)* %13, i64 4
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = load i16, i16 addrspace(4)* %18, align 4, !range !14, !invariant.load !15
  %20 = zext i16 %19 to i32
  %21 = udiv i32 %16, %20
  %22 = mul i32 %21, %20
  %23 = icmp ugt i32 %16, %22
  %24 = zext i1 %23 to i32
  %25 = add i32 %21, %24
  %26 = shl i32 %25, 5
  %27 = mul nsw i32 %12, %26
  %28 = add nsw i32 %27, %8
  %29 = mul nsw i32 %28, 3
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %30
  %32 = load i8, i8 addrspace(1)* %31, align 1, !tbaa !16
  %33 = zext i8 %32 to i32
  %34 = add nsw i32 %29, 1
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %35
  %37 = load i8, i8 addrspace(1)* %36, align 1, !tbaa !16
  %38 = zext i8 %37 to i32
  %39 = add nuw nsw i32 %38, %33
  %40 = add nsw i32 %29, 2
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %41
  %43 = load i8, i8 addrspace(1)* %42, align 1, !tbaa !16
  %44 = zext i8 %43 to i32
  %45 = sub nsw i32 0, %44
  %46 = icmp eq i32 %39, %45
  br i1 %46, label %73, label %47

47:                                               ; preds = %4
  %48 = sdiv i32 %12, %3
  %49 = mul nsw i32 %48, %26
  %50 = sdiv i32 %8, %3
  %51 = add nsw i32 %49, %50
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %52
  %54 = atomicrmw add i32 addrspace(1)* %53, i32 1 syncscope("agent-one-as") monotonic, align 4
  %55 = mul nsw i32 %51, 3
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %56
  %58 = load i8, i8 addrspace(1)* %31, align 1, !tbaa !16
  %59 = zext i8 %58 to i32
  %60 = atomicrmw add i32 addrspace(1)* %57, i32 %59 syncscope("agent-one-as") monotonic, align 4
  %61 = add nsw i32 %55, 1
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %62
  %64 = load i8, i8 addrspace(1)* %36, align 1, !tbaa !16
  %65 = zext i8 %64 to i32
  %66 = atomicrmw add i32 addrspace(1)* %63, i32 %65 syncscope("agent-one-as") monotonic, align 4
  %67 = add nsw i32 %55, 2
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %68
  %70 = load i8, i8 addrspace(1)* %42, align 1, !tbaa !16
  %71 = zext i8 %70 to i32
  %72 = atomicrmw add i32 addrspace(1)* %69, i32 %71 syncscope("agent-one-as") monotonic, align 4
  br label %73

73:                                               ; preds = %47, %4
  %74 = add nsw i32 %12, 8
  %75 = mul nsw i32 %74, %26
  %76 = add nsw i32 %75, %8
  %77 = mul nsw i32 %76, 3
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %78
  %80 = load i8, i8 addrspace(1)* %79, align 1, !tbaa !16
  %81 = zext i8 %80 to i32
  %82 = add nsw i32 %77, 1
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %83
  %85 = load i8, i8 addrspace(1)* %84, align 1, !tbaa !16
  %86 = zext i8 %85 to i32
  %87 = add nuw nsw i32 %86, %81
  %88 = add nsw i32 %77, 2
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %89
  %91 = load i8, i8 addrspace(1)* %90, align 1, !tbaa !16
  %92 = zext i8 %91 to i32
  %93 = sub nsw i32 0, %92
  %94 = icmp eq i32 %87, %93
  br i1 %94, label %121, label %95

95:                                               ; preds = %73
  %96 = sdiv i32 %74, %3
  %97 = mul nsw i32 %96, %26
  %98 = sdiv i32 %8, %3
  %99 = add nsw i32 %97, %98
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %100
  %102 = atomicrmw add i32 addrspace(1)* %101, i32 1 syncscope("agent-one-as") monotonic, align 4
  %103 = mul nsw i32 %99, 3
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %104
  %106 = load i8, i8 addrspace(1)* %79, align 1, !tbaa !16
  %107 = zext i8 %106 to i32
  %108 = atomicrmw add i32 addrspace(1)* %105, i32 %107 syncscope("agent-one-as") monotonic, align 4
  %109 = add nsw i32 %103, 1
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %110
  %112 = load i8, i8 addrspace(1)* %84, align 1, !tbaa !16
  %113 = zext i8 %112 to i32
  %114 = atomicrmw add i32 addrspace(1)* %111, i32 %113 syncscope("agent-one-as") monotonic, align 4
  %115 = add nsw i32 %103, 2
  %116 = sext i32 %115 to i64
  %117 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %116
  %118 = load i8, i8 addrspace(1)* %90, align 1, !tbaa !16
  %119 = zext i8 %118 to i32
  %120 = atomicrmw add i32 addrspace(1)* %117, i32 %119 syncscope("agent-one-as") monotonic, align 4
  br label %121

121:                                              ; preds = %95, %73
  %122 = add nsw i32 %12, 16
  %123 = mul nsw i32 %122, %26
  %124 = add nsw i32 %123, %8
  %125 = mul nsw i32 %124, 3
  %126 = sext i32 %125 to i64
  %127 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %126
  %128 = load i8, i8 addrspace(1)* %127, align 1, !tbaa !16
  %129 = zext i8 %128 to i32
  %130 = add nsw i32 %125, 1
  %131 = sext i32 %130 to i64
  %132 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %131
  %133 = load i8, i8 addrspace(1)* %132, align 1, !tbaa !16
  %134 = zext i8 %133 to i32
  %135 = add nuw nsw i32 %134, %129
  %136 = add nsw i32 %125, 2
  %137 = sext i32 %136 to i64
  %138 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %137
  %139 = load i8, i8 addrspace(1)* %138, align 1, !tbaa !16
  %140 = zext i8 %139 to i32
  %141 = sub nsw i32 0, %140
  %142 = icmp eq i32 %135, %141
  br i1 %142, label %169, label %143

143:                                              ; preds = %121
  %144 = sdiv i32 %122, %3
  %145 = mul nsw i32 %144, %26
  %146 = sdiv i32 %8, %3
  %147 = add nsw i32 %145, %146
  %148 = sext i32 %147 to i64
  %149 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %148
  %150 = atomicrmw add i32 addrspace(1)* %149, i32 1 syncscope("agent-one-as") monotonic, align 4
  %151 = mul nsw i32 %147, 3
  %152 = sext i32 %151 to i64
  %153 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %152
  %154 = load i8, i8 addrspace(1)* %127, align 1, !tbaa !16
  %155 = zext i8 %154 to i32
  %156 = atomicrmw add i32 addrspace(1)* %153, i32 %155 syncscope("agent-one-as") monotonic, align 4
  %157 = add nsw i32 %151, 1
  %158 = sext i32 %157 to i64
  %159 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %158
  %160 = load i8, i8 addrspace(1)* %132, align 1, !tbaa !16
  %161 = zext i8 %160 to i32
  %162 = atomicrmw add i32 addrspace(1)* %159, i32 %161 syncscope("agent-one-as") monotonic, align 4
  %163 = add nsw i32 %151, 2
  %164 = sext i32 %163 to i64
  %165 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %164
  %166 = load i8, i8 addrspace(1)* %138, align 1, !tbaa !16
  %167 = zext i8 %166 to i32
  %168 = atomicrmw add i32 addrspace(1)* %165, i32 %167 syncscope("agent-one-as") monotonic, align 4
  br label %169

169:                                              ; preds = %143, %121
  %170 = add nsw i32 %12, 24
  %171 = mul nsw i32 %170, %26
  %172 = add nsw i32 %171, %8
  %173 = mul nsw i32 %172, 3
  %174 = sext i32 %173 to i64
  %175 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %174
  %176 = load i8, i8 addrspace(1)* %175, align 1, !tbaa !16
  %177 = zext i8 %176 to i32
  %178 = add nsw i32 %173, 1
  %179 = sext i32 %178 to i64
  %180 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %179
  %181 = load i8, i8 addrspace(1)* %180, align 1, !tbaa !16
  %182 = zext i8 %181 to i32
  %183 = add nuw nsw i32 %182, %177
  %184 = add nsw i32 %173, 2
  %185 = sext i32 %184 to i64
  %186 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %185
  %187 = load i8, i8 addrspace(1)* %186, align 1, !tbaa !16
  %188 = zext i8 %187 to i32
  %189 = sub nsw i32 0, %188
  %190 = icmp eq i32 %183, %189
  br i1 %190, label %217, label %191

191:                                              ; preds = %169
  %192 = sdiv i32 %170, %3
  %193 = mul nsw i32 %192, %26
  %194 = sdiv i32 %8, %3
  %195 = add nsw i32 %193, %194
  %196 = sext i32 %195 to i64
  %197 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %196
  %198 = atomicrmw add i32 addrspace(1)* %197, i32 1 syncscope("agent-one-as") monotonic, align 4
  %199 = mul nsw i32 %195, 3
  %200 = sext i32 %199 to i64
  %201 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %200
  %202 = load i8, i8 addrspace(1)* %175, align 1, !tbaa !16
  %203 = zext i8 %202 to i32
  %204 = atomicrmw add i32 addrspace(1)* %201, i32 %203 syncscope("agent-one-as") monotonic, align 4
  %205 = add nsw i32 %199, 1
  %206 = sext i32 %205 to i64
  %207 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %206
  %208 = load i8, i8 addrspace(1)* %180, align 1, !tbaa !16
  %209 = zext i8 %208 to i32
  %210 = atomicrmw add i32 addrspace(1)* %207, i32 %209 syncscope("agent-one-as") monotonic, align 4
  %211 = add nsw i32 %199, 2
  %212 = sext i32 %211 to i64
  %213 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %212
  %214 = load i8, i8 addrspace(1)* %186, align 1, !tbaa !16
  %215 = zext i8 %214 to i32
  %216 = atomicrmw add i32 addrspace(1)* %213, i32 %215 syncscope("agent-one-as") monotonic, align 4
  br label %217

217:                                              ; preds = %191, %169
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

attributes #0 = { mustprogress nofree norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{!6, !10, i64 12}
!6 = !{!"hsa_kernel_dispatch_packet_s", !7, i64 0, !7, i64 2, !7, i64 4, !7, i64 6, !7, i64 8, !7, i64 10, !10, i64 12, !10, i64 16, !10, i64 20, !10, i64 24, !10, i64 28, !11, i64 32, !12, i64 40, !11, i64 48, !13, i64 56}
!7 = !{!"short", !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C/C++ TBAA"}
!10 = !{!"int", !8, i64 0}
!11 = !{!"long", !8, i64 0}
!12 = !{!"any pointer", !8, i64 0}
!13 = !{!"hsa_signal_s", !11, i64 0}
!14 = !{i16 1, i16 1025}
!15 = !{}
!16 = !{!17, !17, i64 0}
!17 = !{!"omnipotent char", !18, i64 0}
!18 = !{!"Simple C++ TBAA"}
